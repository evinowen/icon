;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BufferLoader
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.macro BufferLoader VertFlag, UpFlag, CompleteFlag
.local TileLoop, AttrLoop, AttrTopSkip, AttrBottomSkip, EndMacro, AttrLoopJmp2, AttrLoop2, AttrLoop2, AttrTopSkip2, AttrBottomSkip2, AttrLoopJmp3, AttrLoop3, AttrLoop3, AttrTopSkip3, AttrBottomSkip3
    .ifnblank VertFlag
        LDA scroll_y
    .else
        LDA scroll_x
    .endif


    ;; Tile maps do not include the status bar, thus his height must be
    ;; subtracted to account for it in vertical scenarios.
    .ifnblank VertFlag
        SEC
        SBC #$30
        BCS :+
            JMP EndMacro
        :
    .endif




    ;;
    ;; Check for new Tile Buffer index
    ;; Each run the tile buffer index is checked against the previously
    ;; computed value -- if the value has not changed then exit.
    LSR A               ;
    LSR A               ; Divide A by Eight
    LSR A               ; This accounts for the width/height of the row
                        ; being comprised of 8 pixels -- since each larger
                        ; tile (16x16) is actually four smaller tiles (8x8)

    CMP scroll_bt       ; Compare A to last known Tile Buffer index
    BNE :+              ; Continue if they are different,
        JMP EndMacro    ; else return from subroutine.

    :

    ; .ifnblank VertFlag
    ; CLC
    ; CMP #$20
    ; BCC :+
    ;     JMP EndMacro
    ; :
    ; .endif

    ;; Because the tile buffer is different, store the different value
    ;; so it can be checked against it next run.
    STA scroll_bt       ; Record new Tile Buffer index


    ;; Compute the starting value of store_c, which is the offset used for
    ;; loading tile information to be loaded into the tile buffer.
    LSR A                           ; Divide value by Two!
                                    ; This accounts for each row of tiles being
                                    ; comprised of two rows of tiles.
    .ifnblank VertFlag
        MultiplyAccumulator #$10    ; Multiply value by 16, the width/height of each tile
                                    ; This occurs because the data is stored sequentially,
                                    ; so each row is actually 16 positions appart in memory when
                                    ; scrolling Vertically, whereas with Horizontal scrolling
                                    ; they are adjacent because each tile will be 16 positions
                                    ; appart within the Tile Loop.
    .endif

    STA store_c


    ;;
    ;; Tile Buffer Load Loop
    ;;   Loop is ran once for every-other 8x8 loaded into the buffer,
    ;;   because each tile is 2x2 8x8 squares.
    LDY #$00            ; Start the loop counter at zero

    TileLoop:
    .ifnblank VertFlag
    .ifblank CompleteFlag
    .ifblank UpFlag
MARKTEST_A:
    .endif
    .endif
    .endif
        STY store_a     ; Store the loop counter

        LDY store_c         ; Load store_c, the current Tile Offset
        LDA (address_e), Y  ; Load tile information from address_e using the Tile Offset

        ;;
        ;; Convert Tile with Tile Map
        ;;  The tile identifier is currently in A -- it was loaded
        ;;  by the previous command.
        ;;  Each tile in the tile map is 5 bytes wide,
        ;;  The final tile data address is stored in store_b
        ;;
        ; JSR BufferLoader_TileSelector
        TAY

        LoadPointer tile_map, address_t

        JSR AdvanceTileMapRegister

        STA store_b

        ;;
        ;; Load First Tile
        LoadTile VertFlag

        ;;
        ;; Load Second Tile
        LoadTile VertFlag, SecondFlag

        ;;
        ;; Increment the Y counter
        LDY store_a
        INY
        CLC

        ;; The screen is a total of 16x12 16x16 tiles, since each loop
        ;; is loading two 8x8 tiles, it will loop a number of times equal
        ;; to either the height of 12 tiles (for horizontal), or the
        ;; width of 16 tiles (for vertical).
        .ifnblank VertFlag
            CPY #$10    ; Loop until 16 tiles have been loaded.

        .else
            CPY #$0C    ; Loop until 12 tiles have been loaded.

        .endif

        ;; Branch on Carry Set -- if the carry is set, then the compare
        ;; determined that the boundary has been hit and will branch to
        ;; escape the loop.
        BCS :+
            ;;
            ;; Increment
            LDA store_c
            CLC
            .ifnblank VertFlag
                ADC #$01

            .else
                ADC #$10

            .endif

            STA store_c

            ;;
            ;; Repeat the Tile Loop
            JMP TileLoop

        :


    ;;
    ;;  Check for new Attribute Buffer Index
    ;;
    LDA scroll_bt

    ; SEC
    ; SBC #$01
    ; BCS :+
    ;     LDA scroll_bt

    ; :


    LSR A   ; scroll_bt
    LSR A   ; ABCD EFGH => 00AB CDEF
            ; Divide by 4
            ; This accounts for the fact that for every four Tile runs,
            ; one Attribute run will be loaded -- this is because an
            ; Attribute byte represents 2x2 16x16 Tiles, so each run
            ; consists of a row of 8 or column of 6 tiles.  However, a Tile
            ; run is a row of 32 or column of 24 8x8 tiles.
            ;
            ; | 1 1 2 2 | New Tile Row, New Attribute Row
            ; | 1 1 2 2 | New Tile Row
            ; | 3 3 4 4 | New Tile Row
            ; | 3 3 4 4 | New Tile Row
            ;

    .ifnblank VertFlag
    .ifnblank UpFlag
    .ifblank CompleteFlag
        TAX

        LDA scroll_dir
        AND #%00000111

        CMP #$02
        BEQ :++
            TXA
            CLC
            ADC #$01
            BCC :+
                JMP EndMacro
            :
            TAX
        :

        TXA
    .endif
        ; SEC
        ; SBC #$01
        ; BCS :+
        ;     JMP EndMacro
        ; :
    .else
        ; CLC
        ; ADC #$01
        ; BCC :+
        ;     JMP EndMacro
        ; :
    .endif
    .endif

    CMP scroll_ba   ;
    BNE :+          ; If the values match, then although scroll_bt may
      JMP EndMacro  ; have changed, the attribute zone is the same.
    :               ;

    .ifnblank VertFlag
    CLC
    .ifnblank UpFlag
    ; CMP #$05
    CMP #$07
    .else
    CMP #$07
    .endif
    BCC :+
        JMP EndMacro
    :
    .endif

    ;; Because the Attribute Buffer Index is different, store the different value
    ;; so it can be checked against it next run.
    STA scroll_ba

    ;;
    ;;  Configure Loop
    ;;
    ;;  store_a
    ;;    Durring the processing loop, store_a will remember the loop counter.
    ;;
    ;;  store_b
    ;;    Durring the processing loop, store_b will collect the results of a single byte of attributes
    ;;    and will then be used to store the result in the attribute buffer.
    ;;
    ;;  store_c
    ;;    Durring the processing loop, store_c will represent the current offset of the attribute map.
    ;;    This will start at a value that is based on the current attribute scroll location, scroll_ba.
    ;;

    ;;
    ;; Initialize store_c
    .ifnblank VertFlag
        ;
        ; When scrolling vertically, multiply the current
        ; Attribute Buffer Index by 32 to get the starting offset.
        ;
        ; This is because each Attribute Buffer Index represents a row that is
        ; two tiles high -- as a square of four tiles will be loaded for each loop,
        ; each run will work through two rows of 16 tiles, and so each Attribute
        ; Buffer Index accounts for 32 tiles and the offset is incremented by two
        ; tiles each loop.
        MultiplyAccumulator #$20

    .else
        ;
        ; When scrolling horizontally, multiply the current
        ; Attribute Buffer Index by 2 to get the starting offset.
        ;
        ; This is because each Attribute Buffer Index represents a column that is
        ; two tiles wide -- as a square of four tiles will be loaded for each loop,
        ; each run will work through two columns of 12 tiles, which makes the Attribute
        ; Buffer Index half the tile of offset for the top left tile.  Then for each loop,
        ; the offset is incremented by 32 tiles in order to skip ahead two rows to the
        ; next top left tile.
        ASL A   ; ABCD EFGH => BCDE FGH0
                ; Multiply by 2

    .endif

    STA store_c

    .ifnblank VertFlag
        .ifnblank UpFlag
            LDA scroll_dir
            AND #%00000111

            CMP #$02
            BNE :+
                LDA store_c
                CLC
                ADC #$20
                STA store_c

                JSR BufferAttrCycleTop_Down

            :

            CMP #$04
            BNE :+
                JSR BufferAttrCycleTop_Up

            :


        .else
            BufferAttrCycleBottom VertFlag, UpFlag

        .endif

    .else
        BufferAttrCycleHorizontal VertFlag, UpFlag

    .endif

EndMacro:

.endmacro

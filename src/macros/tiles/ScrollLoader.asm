;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ScrollLoader
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.macro ScrollLoader TileAddress, AttrAddress, VertFlag, UpFlag
.local EndTiles, EndAttributes
    ;;
    ;;  Check for Tile Buffer Update
    ;;    If the Tile Buffer has been updated, then Tile Buffer
    ;;    index (scroll_bt) will be different than the previous
    ;;    Tile Buffer index (scroll_pt)
    ;;
    ;;    If the Tile Buffer is not different, skip to
    ;;    attribute checks.
    ;;
    LDA scroll_bt
    CMP scroll_pt
    .ifnblank VertFlag
    .ifblank UpFlag
MARKTEST_CMP:
    .endif
    .endif
    BEQ EndTiles


    ;;
    ;;  Tile Buffer has been Updated, store update.
    ;;
    STA scroll_pt


    ;;;;;;;;;;;;;;;;;;;;;;
    ;; Create offset
    ; LDA scroll_pt ;; Already Loaded
    .ifnblank VertFlag
        ASL A
        ASL A
        ASL A
        ASL A
        ASL A

    .else

    .endif
    STA store_a

    .ifnblank VertFlag
        LDA scroll_pt
        LSR A
        LSR A
        LSR A

    .else
        LDA #$00

    .endif
    STA store_b


    ;;;;;;;;;;;;;;;;;;;;;;
    ;; Set Nametable start Address,
    ;;   jump to working row.
    ;;
    LDA #<TileAddress
    CLC
    ADC store_a
    STA address_d
    LDA #>TileAddress
    ADC store_b
    STA address_d + 1


    LDA address_d
    CLC

    .ifnblank VertFlag
        .ifnblank UpFlag
            ADC #$C0
        .else
        .endif
    .else
        ADC #$C0
    .endif
    STA address_d
    LDA address_d + 1
    ADC #$00
    STA address_d + 1

    ;;
    ;; TILE OVERFLOW CHECK
    ;;
    ; LDA address_d + 1

    SEC
    SBC #>TileAddress
    CLC
    CMP #$03
    BCC :+
        LDA address_d
        CMP #$C0
        BCC :+
            JMP EndTiles
    :

    ;;
    ;;
    ;;;;;;;;

    ;;;;;;;;;;;;;;;;;;;;;;
    ;; Reset PPU High/Low latch
    PPUStatus


    ;;;;;;;;;;;;;;;;;;;;;;
    ;; Write destination address to PPU
    LDA address_d + 1
    STA $2006
    LDA address_d
    STA $2006


    .ifnblank VertFlag
    ;;;;;;;;;;;;;;;;;;;;;;
    ;; Horizontal Increment
    ;; This is set earlier in the screen load process, when
    ;; the status bar is loaded.
    ;;

    .else
    ;;;;;;;;;;;;;;;;;;;;;;
    ;; Vertical Increment
    LDA #%10010100
    STA $2000

    .endif


    .ifnblank VertFlag
    .ifblank UpFlag
MARKTEST_B:
    .endif
    .endif
    ;;;;;;;;;;;;;;;;;;;;;;
    ;; Run the Tile load
    LDY #$00
    :
        LDA tile_buffer, Y
        STA $2007

        INY
        .ifnblank VertFlag
    .ifblank UpFlag
MARKTEST_C:
    .endif
            ;; Write one row of 32 tiles
            CPY #$20

        .else
            ;; Write one column of 24 tiles
            CPY #$18

        .endif

    BNE :-


    EndTiles:   ;; End Tiles


    ;;
    ;;  Check for Attribute Buffer Update
    ;;    If the Attribute Buffer has been updated, then Attribute Buffer
    ;;    index (scroll_ba) will be different than the previous
    ;;    Attribute Buffer index (scroll_pa)
    ;;
    ;;    If the Attribute Buffer is not different, exit.
    ;;
    LDA scroll_ba
    CMP scroll_pa
    BEQ EndAttributes

    ; .ifnblank VertFlag
    ; CLC
    ; CMP #$04
    ; BCS EndAttributes
    ; .endif


    ;;
    ;;  Attribute Buffer has been Updated, store update.
    ;;
    STA scroll_pa


    ;;;;;;;;;;;;;;;;;;;;;;
    ;; Create offset
    ; LDA scroll_pa ;; Already Loaded
    .ifnblank VertFlag
        ASL A   ; scroll_pa
        ASL A   ; ABCD EFGH => DEFG H000
        ASL A   ; Multiply by 8

    .else

    .endif
    STA store_a

    .ifnblank VertFlag
        LDA scroll_pa
        LSR A   ; scroll_pa
        LSR A   ; ABCD EFGH => 0000 0ABC
        LSR A   ; Divide by 32
        LSR A   ;
        LSR A   ;

    .else
        LDA #$00

    .endif
    STA store_b


    ;;;;;;;;;;;;;;;;;;;;;;
    ;; Set Nametable start Address,
    ;;   jump to working row.
    LDA #<AttrAddress
    CLC
    ADC store_a
    STA address_d
    LDA #>AttrAddress
    ADC store_b
    STA address_d + 1




    LDA address_d
    CLC
    .ifnblank VertFlag
        .ifnblank UpFlag
            ADC #$10
        .else
        .endif
    .else
        ADC #$08
    .endif
    STA address_d
    LDA address_d + 1
    ADC #$00
    STA address_d + 1


    ;;
    ;; ATTR OVERFLOW CHECK
    ;;
    ; LDA address_d + 1
    SEC
    SBC #>AttrAddress
    CLC
    CMP #$01
    BCC :+
        JMP EndAttributes
    :

    ;;
    ;;
    ;;;;;;;;


    ;;;;;;;;;;;;;;;;;;;;;;
    ;; Reset PPU High/Low latch
    PPUStatus

    ;;;;;;;;;;;;;;;;;;;;;;
    ;; Write destination address to PPU
    LDA address_d + 1
    STA $2006
    LDA address_d
    STA $2006


    ;;;;;;;;;;;;;;;;;;;;;;
    ;; Run the Attribute load
    LDY #$00

    :
    .ifnblank VertFlag

        LDA attr_buffer, Y
        STA $2007

        INY
        CPY #$08

    .else
        LDA attr_buffer, Y
        STA $2007

        LDA address_d
        CLC
        ADC #$08
        STA address_d

        LDA address_d + 1
        ADC #$00
        STA address_d + 1
        STA $2006

        LDA address_d
        STA $2006

        INY
        CPY #$07

    .endif

    BNE :-


    EndAttributes:   ;; End Attributes



.endmacro

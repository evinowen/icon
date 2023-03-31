.macro LoadTile VertFlag, SecondFlag
    ;;
    ;; Load the Tile
    LDY store_b

    .ifnblank SecondFlag
        INY

        .ifnblank VertFlag
        .else
            INY

        .endif

    .endif

    LDA scroll_bt                             ; Check for ODD tile row,
    AND #%00000001                            ;  if the row is ODD then the
    CMP #%00000001                            ;  loaded tiles are offset
    BNE :+
        INY
        .ifnblank VertFlag
            INY

        .endif
    :

    ; LDA tile_map, Y
    LDA (address_t), Y
    TAX


    ;;
    ;; Store the Tile
    LDA store_a
    ASL A
    TAY

    .ifnblank SecondFlag
        INY

    .endif

    TXA
    STA tile_buffer, Y

.endmacro

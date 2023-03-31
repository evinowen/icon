;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LoadAttribute
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.macro LoadAttribute Target, BumpOne, BumpTwo, BumpThree
    ;;
    ;; Load data from provided Target
    LDA Target
    TAY
    LoadPointer tile_map, address_t

    JSR AdvanceTileMapRegister

    ;;
    ;; Clear carry, then add OBJ_TILE_COLOR.
    ;;      (the offset for the tile attributes)
    CLC
    ADC #OBJ_TILE_COLOR

    ;;
    ;; Move to Accumulator to Y, load data from tile
    ;; map into the Accumulator.
    TAY
    LDA (address_t), Y

    AND #%00000011

    .ifnblank BumpOne
        ASL A
        ASL A

    .endif

    .ifnblank BumpTwo
        ASL A
        ASL A

    .endif

    .ifnblank BumpThree
        ASL A
        ASL A

    .endif

    ;;
    ;; OR Accumulator with current store_b value to retain
    ;; populated values, then set value to store_b.
    ORA store_b
    STA store_b

.endmacro

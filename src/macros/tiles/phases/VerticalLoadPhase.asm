.macro VerticalLoadPhase UpFlag
    ;;
    ;; Set Mapper to Mirror Horizontally
    ;;
    JSR MAPMirrorHorizontal

    LDY #$00
    LDA #$00
    :
        STA attr_buffer_well_a, Y
        STA attr_buffer_well_b, Y
        INY
        CPY #$08
        BNE :-

    .ifblank UpFlag
        ;;
        ;; Load Current Room Buffer into Address
        ;; Setting address_e to room_buffer_current allows the address to
        ;; be incremented as it is worked.
        ;;
        LoadPointer room_buffer_current, address_e
        ; LDA #<room_buffer_current
        ; STA address_e
        ; LDA #>room_buffer_current
        ; STA address_e + 1

    .else
        ;;
        ;; Load Previous Room Buffer into Address
        ;; Setting address_e to room_buffer_prev allows the address to
        ;; be incremented as it is worked.
        ;;
        LoadPointer room_buffer_prev, address_e
        ; LDA #<room_buffer_prev
        ; STA address_e
        ; LDA #>room_buffer_prev
        ; STA address_e + 1

    .endif


    ;;
    ;; Clear all scroll counters.
    ;; The value of 0xFF is used here because it should not be possible
    ;; for any of these attributes to reach this value.
    ;;
    LDA #$FF
    STA scroll_pt
    STA scroll_pa
    STA scroll_bt
    STA scroll_ba


    ;;
    ;; Force Zero X-Scroll
    ;;
    LDA #$00
    STA scroll_x
    STA scroll_fx


    .ifnblank UpFlag
        ;;
        ;; Reset Y-Scroll
        ;; Make sure scroll_y is set to max height
        ;;
        LDA #$EF

    .else
        ;;
        ;; Reset Y-Scroll
        ;; Make sure scroll_y is set to status bar height
        ;;
        LDA #$30

    .endif

    STA scroll_y


    ;;
    ;; Clear Load Flag, Set Prepare Flag
    ;; Initial load is complete, clear this flag and ensure the scroll
    ;; moves to the prepare stage.
    ;;
    LDA scroll_dir
    AND #%01111111
    ORA #%01000000
    STA scroll_dir

.endmacro

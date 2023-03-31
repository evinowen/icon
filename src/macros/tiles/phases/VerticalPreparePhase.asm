.macro VerticalPreparePhase UpFlag
.local EndMacro
    LDA scroll_dir
    ORA #%00010000
    CMP scroll_dir
    BNE :+
        JSR LoadBuffersBottomCompStatus
        JMP :++
    :

    JSR LoadBuffersBottom

    :


    .ifnblank UpFlag
    VerticalPPUBuffer_BranchOverflow Prepare, , , UpFlag, :+
    .else
    VerticalPPUBuffer_BranchOverflow Prepare, , , UpFlag, :++
        LDA scroll_dir
        ORA #%00010000
        CMP scroll_dir
        BEQ :+
            STA scroll_dir
            JMP EndMacro
        :
    .endif
        ;;
        ;; Scroll Prepare Complete
        ;; The offscreen load is complete, switch to active mode.
        ;;

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


        ;;
        ;; Clear all scroll counters.
        ;;
        LDA #$FF
        STA scroll_pt
        STA scroll_pa
        STA scroll_bt
        STA scroll_ba


        ;;
        ;; Clear Load and Prepare Flags
        ;; Prepare is complete, clear both flags to ensure the system moves
        ;; to the active stage.
        ;;
        LDA scroll_dir
        AND #%00111111
        STA scroll_dir


        .ifnblank UpFlag
            ;;
            ;; Reset Y-Scroll
            ;; Make sure scroll_y is set to max height minus one
            ;;
            LDA #$EF

        .else
            ;;
            ;; Reset Y-Scroll
            ;; Make sure scroll_y is set to status bar height
            ;;
            LDA #$2F

        .endif

    :

    ;;
    ;; Store Y-Scroll
    ;; Store the value of A in scroll_y, which is usually the result of the
    ;; previous addition operation or status bar height if overflow was
    ;; detected.
    ;;

    STA scroll_y

EndMacro:

.endmacro

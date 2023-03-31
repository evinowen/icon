.macro HorizontalPreparePhase LeftFlag
.local EndMacro
    JSR LoadBuffersHorizontal

    HorizontalPPUBuffer_BranchOverflow Prepare, , LeftFlag, :+
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


        .ifblank LeftFlag
            ;;
            ;; Reset X-Scroll
            ;; Make sure scroll_x is set to min width.
            ;;
            LDA #$00

        .else
            ;;
            ;; Reset X-Scroll
            ;; Make sure scroll_x is set to max width minus one.
            ;;
            LDA #$FE

        .endif

    :

    ;;
    ;; Store X-Scroll
    ;; Store the value of A in scroll_x, which is usually the result of the
    ;; previous addition operation or min width if overflow was
    ;; detected.
    ;;

    STA scroll_x

EndMacro:

.endmacro

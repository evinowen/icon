.macro HorizontalCompletePhase LeftFlag
    JSR LoadBuffersHorizontal

    HorizontalPPUBuffer_BranchOverflow , , LeftFlag, :+
        ;;
        ;; Scroll Complete
        ;; The scroll has finished -- reset the scroll direction and
        ;; set the final scroll position.  Flag the room to load.
        ;;

        ;;
        ;; Push Next Background to Current Background
        ;;
        LDA bg_next
        STA bg_current

        LDA map_status
        ORA #%11000000
        STA map_status

        ;;
        ;; Set Scroll Direction to Special Case Horizonal
        ;;
        LDA #$05
        ; LDA #$00
        STA scroll_dir

        ;;
        ;; Reset X-Scroll
        ;; Reset the scroll_x value to zero by loading it into A
        ;; before this section is exited.
        ;;
        LDA #$00

    :

    STA scroll_x

.endmacro

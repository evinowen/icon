.macro VerticalCompletePhase UpFlag
.local EndMacro
    LDA scroll_dir
    ORA #%00010000
    CMP scroll_dir
    BNE :+
        JSR LoadBuffersTopCompStatus
        JMP :++
    :

    JSR LoadBuffersTopComp

    :

    .ifnblank UpFlag
    MARKMARK:
    VerticalPPUBuffer_BranchOverflow , , Complete, UpFlag, :++
        LDA scroll_dir
        ORA #%00010000
        CMP scroll_dir
        BEQ :+
            STA scroll_dir
            JMP EndMacro
        :
    .else
    VerticalPPUBuffer_BranchOverflow , , Complete, UpFlag, :+
    .endif
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
        ;; Set Scroll Direction to Special Case Vertical
        ;;
        LDA #$06
        ; LDA #$00
        STA scroll_dir

        ;;
        ;; Reset Y-Scroll
        ;; Reset the scroll_y value to status bar height by loading it into A
        ;; before this section is exited.
        ;;
        LDA #$2F

    :

    STA scroll_y

EndMacro:

.endmacro

.macro VerticalPPUBuffer UpFlag
.local PhaseLoad, PhasePrepare, PhaseActive, PhaseComplete, PhasePlayer, EndMacro
    ;;
    ;; Background Status Overwrite
    ;; Force background_status to update and split, clear
    ;; all other settings.
    ;;
    LDA #%11000000
    STA bg_status

PhaseLoad:
    ;;
    ;; Check if the scroll_dir LOAD flag is set, if so
    ;; run the Load Phase this loop.
    ;;
    LDA scroll_dir
    AND #%10000000
    CMP #%10000000
    BEQ :+
        JMP PhasePrepare
    :

    VerticalLoadPhase UpFlag
    JMP EndMacro

PhasePrepare:
    ;;
    ;; Check if the scroll_dir PREPARE flag is set, if so
    ;; run the Prepare Phase this loop.
    ;;
    LDA scroll_dir
    AND #%01000000
    CMP #%01000000
    BEQ :+
        JMP PhaseComplete
    :

    VerticalPreparePhase UpFlag
    JMP PhasePlayer

PhaseComplete:
    ;;
    ;; Check if the scroll_dir COMPLETE flag is set, if so
    ;; run the Complete Phase this loop.
    ;;
    LDA scroll_dir
    AND #%00100000
    CMP #%00100000
    BEQ :+
        JMP PhaseActive
    :

    VerticalCompletePhase UpFlag
    JMP PhasePlayer

PhaseActive:

    VerticalActivePhase UpFlag

PhasePlayer:

    LDA scroll_dir
    AND #%00001000
    CMP #%00001000
    BEQ :+
        JMP EndMacro
    :

    VerticalPlayerPhase UpFlag

EndMacro:

.endmacro

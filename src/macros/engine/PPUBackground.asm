;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PPU Background
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.macro PPUBackground
.local EndMacro
    ;;
    ;; PPUBackground will run an update so long as the UPDATE
    ;; bit on bg_status is set, overwise it will return immediately.
    ;; Once PPUBackground has detected that the bit is set,
    ;; it will CLEAR the bit and begin processing.
    ;;
    ;; This way, PPUBackground is only ran when an update has
    ;; been made that requires it, as it's execution can be
    ;; expensive.
    ;;

    GateOnBitThenClear bg_status, #BG_STATUS_UPDATE, EndMacro

    ;;
    ;; PPUClear to clear screen.
    ;;
    PPUClear

    ;;
    ;; Check for non-room background, stored in values #$F0 and higher.
    ;;
    .scope
    CLC             ;; CLEAR CARRY to prepare for COMPARE
    LDA bg_current  ;; LOAD bg_current into ACCUMULATOR
    CMP #$F0        ;; COMPARE bg_current to set CARRY if bg_current >= $F0
    BCS :+
        JMP End     ; BRANCH on CARRY CLEAR
    :
        PPUBackgroundRoom bg_current
        PPUBackgroundRoomSecond bg_current

        JSR PPUNMIEnableAfterVBlankWait
        JMP EndMacro
    End:
    .endscope

EndMacro:
.endmacro

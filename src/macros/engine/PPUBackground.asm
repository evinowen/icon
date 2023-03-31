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
    ; ;;
    ; ;; Check for bg_status UPDATE bit.
    ; ;;
    ; CLC             ;; CLEAR CARRY to prepare for COMPARE
    ; LDA bg_status   ;; LOAD bg_status into ACCUMULATOR
    ; AND #%10000000  ;; AND bg_status to clear ignored bits
    ; CMP #%10000000  ;; COMPARE bg_status to set CARRY
    ; BCS :+          ;; BRANCH on CARRY SET
    ;   JMP EndMacro
    ; :

    ; ;;
    ; ;; Clear the bg_status UPDATE bit.
    ; ;;
    ; LDA bg_status   ;; LOAD bg_status into ACCUMULATOR
    ; AND #%01111111  ;; AND bg_status to clear UPDATE bit
    ; STA bg_status   ;; STORE to save bg_status


    ;;
    ;; SWITCH on current scroll_dir type.
    ;;
    ;; The last four bits in scroll_dir determine the current type
    ;; of the scroll -- if this is a positive value then a scroll
    ;; is currently taking place.  Scrolling requires special
    ;; attention, and is different depending on what direction the
    ;; screen is scrolling.
    ;;
    ;; If a scroll type is detected, then the function will JMP
    ;; to the handling of that scroll -- this way when the scroll
    ;; has been handled, RTS can be called to exit PPUBackground
    ;; by the special case handler.
    ;;

    ; LDA scroll_dir  ;; LOAD scroll_dir into ACCUMULATOR
    ; AND #%00000111  ;; AND scroll_dir to clear ignored bits

    ;     ;; Scroll Right
    ;     CMP #$01    ;; COMPARE scroll_dir for case 1
    ;     BNE :+      ;; BRANCH if NOT EQUAL to continue
    ;       JMP PPUBackground_ScrollXPos
    ;     :

    ;     ;; Scroll Down
    ;     CMP #$02    ;; COMPARE scroll_dir for case 2
    ;     BNE :+      ;; BRANCH if NOT EQUAL to continue
    ;       JMP PPUBackground_ScrollYPos
    ;     :

    ;     ;; Scroll Left
    ;     CMP #$03    ;; COMPARE scroll_dir for case 3
    ;     BNE :+      ;; BRANCH if NOT EQUAL to continue
    ;       JMP PPUBackground_ScrollXNeg
    ;     :

    ;     ;; Scroll Up
    ;     CMP #$04    ;; COMPARE scroll_dir for case 4
    ;     BNE :+      ;; BRANCH if NOT EQUAL to continue
    ;       JMP PPUBackground_ScrollYNeg
    ;     :

    ;     ;; Special Case Horizontal
    ;     CMP #$05    ;; COMPARE scroll_dir for case 5
    ;     BNE :+      ;; BRANCH if NOT EQUAL to continue
    ;       JMP PPUBackground_ScrollXPos
    ;     :

    ;     ;; Special Case Vertical
    ;     CMP #$06    ;; COMPARE scroll_dir for case 6
    ;     BNE :+      ;; BRANCH if NOT EQUAL to continue
    ;       JMP PPUBackground_ScrollYPos
    ;     :

    ;;
    ;; END SWITCH
    ;;

    ;;
    ;; Since the switch did not detect a logical scroll, non-scroll
    ;; execution updates for PPUBackground will be executed.
    ;;

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
    BCC End          ;; BRANCH on CARRY CLEAR
        ;; IF bg_current >= 0xF0

        ;;
        ;; TODO: Elaborate on non-room background loading.
        ;;
        PPUBackgroundRoom bg_current  ;; EXEC PPUBackgroundRoom
        JSR LoadBackgroundFull  ;; EXEC LoadBackgroundFull

        JSR PPUNMIEnable
        JMP EndMacro
    End:
    .endscope


    ; ;;
    ; ;; Check for status bar background load, and load if needed?
    ; ;;
    ; .scope
    ; GateOffBitThenSet screen_status, #SCREEN_STATUS_BAR_LOADED, End
    ; ; LDA screen_status ;; LOAD screen_status into ACCUMULATOR
    ; ; AND #SCREEN_STATUS_BAR_LOADED    ;; AND screen_status to clear ignored bits
    ; ; CMP #SCREEN_STATUS_BAR_LOADED    ;; COMPARE screen_status to set ZERO bit for EQUALITY
    ; ; BEQ :+            ;; BRANCH on EQUAL
    ;     ;; IF screen_status bit is CLEAR

    ;     ;;
    ;     ;; TODO: Explain screen_status bit that is set here
    ;     ;;
    ;     ; LDA screen_status         ;; LOAD screen_status into ACCUMULATOR
    ;     ; ORA #SCREEN_STATUS_BAR_LOADED            ;; SET screen_status bit
    ;     ; STA screen_status         ;; STORE to save screen_status

    ;     ;;
    ;     ;; TODO: Explain LoadBackgroundStatus purpose
    ;     ;;
    ;     ;; This is the single entry point into LoadBackgroundStatus
    ;     ;;
    ;     JSR LoadBackgroundStatus  ;; EXEC LoadBackgroundStatus
    ; ; :
    ; End:
    ; .endscope


    ; ;;
    ; ;; Perform a static load of the background.
    ; ;;

    ; ;;
    ; ;; TODO: Explain static load process, or at least the code below.
    ; ;;

    ; ; JSR RoomCoordinates
    ; ; JSR RoomBuffer

    ; LoadPointer room_buffer_current, address_e
    ; ; LDA #<room_buffer_current
    ; ; STA address_e
    ; ; LDA #>room_buffer_current
    ; ; STA address_e + 1

    ; LDA #$00
    ; STA scroll_x

    ; LDA #$04
    ; STA scroll_dir

    ; LDA #$FF
    ; STA scroll_pt
    ; STA scroll_pa
    ; STA scroll_bt
    ; STA scroll_ba

    ; LDA #$F0

    ; :
    ;     STA scroll_y

    ;     JSR LoadBuffersTop
    ;     JSR LoadScrollUp

    ;     LDA scroll_y
    ;     SEC
    ;     SBC #$08

    ;     CLC
    ;     CMP #$30

    ; BCS :-

    ; LDA #$50
    ; :
    ;     STA scroll_y

    ;     JSR LoadBuffersTopComp
    ;     JSR LoadScrollUp

    ;     LDA scroll_y
    ;     SEC
    ;     SBC #$08

    ;     CLC
    ;     CMP #$30

    ; BCS :-

    ; JSR LoadBuffersTopCompStatus
    ; JSR LoadScrollUpStatus


    ; LDA #$00        ;; LOAD ZERO into ACCUMULATOR
    ; STA scroll_dir  ;; STORE ZERO into scroll_dir to clear

    ; JSR PPUNMIEnable

EndMacro:
.endmacro

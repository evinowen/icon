.macro HorizontalPlayerPhase LeftFlag
  LoadPointer player, address_a
  ; LDA #<player
  ; STA address_a
  ; LDA #>player
  ; STA address_a + 1

  LDY #OBJ_CREATURE_STATUS
  LDA (address_a), Y
  ORA #%10000000
  STA (address_a), Y

  LDY #OBJ_CREATURE_XPOS
  LDA (address_a), Y

  .ifblank LeftFlag
      ;; Shift Player Left
      SEC
      SBC #SCROLL_SPEED
      BCS :+
          LDA #$0A
      :

      ;; Check for Underflow
      CLC
      CMP #$0A
      BCS :+
          LDA #$0A
      :

  .else
      ;; Shift Player Right
      CLC
      ADC #SCROLL_SPEED
      BCC :+
          LDA #$F6
      :

      ;; Check for Overflow
      CLC
      CMP #$F6
      BCC :+
          LDA #$F6
      :

  .endif

  ;; Store Player X
  STA (address_a), Y

.endmacro

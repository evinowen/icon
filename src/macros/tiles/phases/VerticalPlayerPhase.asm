.macro VerticalPlayerPhase UpFlag
  LoadPointer player, address_a
  ; LDA #<player
  ; STA address_a
  ; LDA #>player
  ; STA address_a + 1

  LDY #OBJ_CREATURE_STATUS
  LDA (address_a), Y
  ORA #%10000000
  STA (address_a), Y

  LDY #OBJ_CREATURE_YPOS
  LDA (address_a), Y

  .ifnblank UpFlag
      ;; Shift Player Down
      CLC
      ADC #SCROLL_SPEED
      BCC :+
          LDA #$E6
      :

      ;; Check for Overflow
      CLC
      CMP #$E6
      BCC :+
          LDA #$E6
      :

  .else
      ;; Shift Player Up
      SEC
      SBC #SCROLL_SPEED
      BCS :+
          LDA #$3A
      :

      ;; Check for Underflow
      CLC
      CMP #$3A
      BCS :+
          LDA #$3A
      :

  .endif

  ;; Store Player Y
  STA (address_a), Y

.endmacro

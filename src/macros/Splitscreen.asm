.macro Splitscreen AddressX, AddressY
  PPUAddress #$00

  PPUScroll #$00, #$00

  PPUStatus

  ;;
  ;; Write nametable bits to t.
  ;;
  LDA #$00
  ; LDA scroll_nt
  ; ASL A
  ; ASL A
  STA $2006

  ;;
  ;; Write y bits to t.
  ;;
  LDA AddressY
  STA $2005

  ;;
  ;; The last write needs to occur during horizontal blanking
  ;; to avoid visual glitches.
  ;;
  ;; HBlank is very short, so calculate the value to write now, before HBlank.
  ;;
  AND #$F8
  ASL A
  ASL A
  STA zero_a

  ;;
  ;; Write the X bits to t and x.
  ;;
  LDX AddressX
  TXA

  ;;
  ;; Finish calculating the fourth write.
  ;;
  LSR A
  LSR A
  LSR A
  ORA zero_a

  ;;
  ;; Wait the configured SCROLL_SPLIT_WAIT loops
  ;;
  LDY #SCROLL_SPLIT_WAIT
  :
    DEY
    BNE :-

  ;;
  ;; Final Write
  ;;
  STX $2005
  STA $2006

.endmacro

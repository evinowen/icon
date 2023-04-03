.macro LoadBackgroundTarget HighNameTable, LowNameTable, HighAttributeTable, LowAttributeTable
  LDA address_a
  STA address_c
  LDA address_a + 1
  STA address_c + 1

  PPUStatus

  PPUAddress HighNameTable, LowNameTable

  LDX #$00
  :
    LDY #$00
    :
      LDA (address_c), Y
      STA $2007

      LoopY #$40, :-

    IncrementAddress address_c, #$40

    LoopX #$0F, :--

  PPUStatus

  PPUAddress HighAttributeTable, LowAttributeTable

  LDY #$00
  :

    LDA (address_b), Y
    STA $2007

    LoopY #$40, :-

.endmacro

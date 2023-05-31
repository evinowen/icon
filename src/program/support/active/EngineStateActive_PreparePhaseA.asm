.proc EngineStateActive_PreparePhaseA
  PPUClear

  LDA #$01
  STA scanline

  LDX #$02
  JSR MAPSetCHRBankActive
  JSR ScreenLoader

  PPUMaskHideSprites
  PPUMaskHideBackground

  LDA #$00
  STA color_index
  LDA #%10000000
  STA color_status

  LDA #PALETTE_ACTIVE
  STA palette

  JSR PPUNMIEnable

  RTI
.endproc

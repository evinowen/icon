;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mapper ;; MMC3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

MAPSetCHRBankTitle:
  LDA #%00000010
  STA $8000

  LDA #$04
  STA $8001

  LDA #%00000011
  STA $8000

  LDA #$05
  STA $8001

  RTS

MAPSetCHRBankActive:
  LDA #%00000010
  STA $8000

  LDA #$0C
  STA $8001

  LDA #%00000011
  STA $8000

  LDA #$0D
  STA $8001

  RTS

MAPScanlineTrigger:
  STA $E000
  STA $C000
  STA $C001
  STA $E001
  CLI

  RTS
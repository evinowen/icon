;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PPU NMI ENBALE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Enable NMI by setting flag to false and calling PPUSet
;; to update.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PPUNMIEnableAfterVBlankWait:
  PPUScroll #$00, #$00

  VBlankWait

PPUNMIEnable:
  LDA ppu_ctrl
  ORA #%10000000
  STA ppu_ctrl

  PPUSet

  RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PPU NMI DISABLE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Disable NMI by setting flag to false and calling PPUSet
;; to update.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PPUNMIDisable:
  LDA ppu_ctrl
  AND #%01111111
  STA ppu_ctrl

  PPUSet

  RTS

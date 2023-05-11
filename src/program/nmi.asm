PPUSpriteDMA

;; Load Color Updates
.proc ExecutePaletteUpdates
  LDY palette
  CPY palette_last
  BEQ End
    STY palette_last
    LoadAddressOffsetY PALETTES, address_a
    JSR LoadPalette
  End:
.endproc

GateOnBitThenClear player_score_status, #PLAYER_SCORE_UPDATE, ScoreEnd
;   VBlankWait
  PrintScore
ScoreEnd:

.proc ExecuteSplitscreen
  LDA scanline
  CMP #$00
  BEQ NoSplit
    PPUScroll #$00, #$00
    LDA #$1F
    JSR MAPScanlineTrigger
    JMP End
  NoSplit:
    PPUScroll #$00, scroll

  End:
.endproc

;; Load Background Updates
PPUBackground



;; Update $2000 and $2001
PPUSet

;; Track the current frame from 0 to F
IncrementVariableToLimit frame, #$10

;; Load game state (y) and reset game_prep on change
TrackVariableStoreY game, game_last, :+
  ;; Clear game_prep
  LDA #$00
  STA game_prep
:

;; Track Controller A state
LDA controller_a
STA controller_ap
;;  Load input from Controller A
JSR InputControllerA

;; Track Controller B state
LDA controller_b
STA controller_bp
;;  Load input from Controller A
JSR InputControllerB

;; Leverage retrieved game state (Y) to jump to engine state routine
JumpAddressOffsetY ENGINE_STATES

RTI

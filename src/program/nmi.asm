PPUSpriteDMA

GateOnBitThenClear player_score_status, #PLAYER_SCORE_UPDATE, ScoreEnd
;   VBlankWait
  PrintScore
ScoreEnd:

.proc ExecuteSplitscreen
  PPUScroll #$00, #$00
  LDA scroll
  CMP #$00
  BEQ End
    LDA #$1F
    JSR MAPScanlineTrigger
  End:
.endproc

;; Load Color Updates
; JSR PPUColor
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

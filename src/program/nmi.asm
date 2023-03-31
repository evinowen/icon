;; Load Color Updates
; JSR PPUColor

;; Load Background Updates
PPUBackground

PPUSpriteDMA

.proc ExecuteSplitscreen
;; Load Screen with Scroll
LDA scroll_fy
CMP #$00
BEQ End
  Splitscreen scroll_fx, scroll_fy
End:
.endproc

;; Update $2000 and $2001
PPUSet

;; Setup the next Scroll
PPUBuffer

;; Track the current frame from 0 to F
IncrementVariableToLimit frame, #$10

;; Load game state (y) and reset game_prep on change
TrackVariableStoreY game, game_last, :+
  ;; Clear game_prep
  LDA #$00
  STA game_prep
:

;; Leverage retrieved game state (Y) to jump to engine state routine
JumpAddressOffsetY ENGINE_STATES

RTI

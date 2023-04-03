.proc ExecuteSplitscreen
  PPUScroll #$00, #$00
  LDA scroll_fy
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

PPUSpriteDMA

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

;; Leverage retrieved game state (Y) to jump to engine state routine
JumpAddressOffsetY ENGINE_STATES

RTI

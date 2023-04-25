;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TITLE GAME ENGINE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This is the title screen engine, which is ran when the game
;; is started.
;;
;; Overall, this is one of the simplest modes the game will be
;; in -- there are only two routines called that do not call
;; any additional routines themselves.
;;

ENGINE_STATE_TITLE:
  PrepareEngineState #$00, ENGINE_STATE_TITLE_PREP_P0
  PrepareEngineState #$01, ENGINE_STATE_TITLE_PREP_P1

  JMP ENGINE_STATE_TITLE_ACTIVE

ENGINE_STATE_TITLE_PREP_P0:
  PPUClear

  LDX #$00
  JSR MAPSetCHRBankTitle

  PPUMaskHideSprites

  LDA #$00
  STA color_index

  LDA #%10000000
  STA color_status

  LDA #$00
  STA scroll

  JSR PPUNMIEnable

  RTI

ENGINE_STATE_TITLE_PREP_P1:
  LDA #PPUBACKGROUNDROOM_TITLE
  STA bg_current

  LDA #%10000000
  STA bg_status

  PPUMaskShowBackground

  JSR PPUNMIEnable

  LDA #$01
  STA tick

  RTI


ENGINE_STATE_TITLE_ACTIVE:
  .proc EngineStateTitle_BlinkStart
  DEC tick
  LDA tick
  CMP #$00
  BNE End
    LDA #$30
    STA tick

    LDA game_state
    CMP #$00
    BEQ TurnOn

    TurnOff:
      LDA #$00
      STA game_state
      JSR MAPSetCHRBankTitle
    JMP End

    TurnOn:
      LDA #$01
      STA game_state
      JSR MAPSetCHRBankTitleAlt

  End:
  .endproc

  .proc EngineStateTitle_Randomize
    ;;
    ;; Randomize -- While waiting at the title screen, seed the random
    ;; values for the system.  Essentially, what state the game is in
    ;; is determined by how long the player waits at this screen.
    ;;

    LDA seed
    SEC
    SBC #$01
    CMP #$00
    BNE :+
      LDA #$FF
    :
    STA seed

    LDA frame
    CMP #$00
    BNE :+
      JSR Random
      STA $6000
    :
  .endproc

  .proc EngineStateTitle_PressStart
    ControllerAGateStart :+
      ;; Start Pressed - change game state to GAME_NEXT
      LDA #GAME_SPLASH
      STA game
    :
  .endproc

  RTI

Random:
  LDX #$08     ; iteration count (generates 8 bits)
  LDA seed + 0

  :
    ASL A      ; shift the register
    ROL seed + 1
    BCC :+
      EOR #$2D   ; apply XOR feedback whenever a 1 bit is shifted out
    :
    DEX
    BNE :--

  STA seed + 0
  CMP #$00     ; reload flags

  RTS

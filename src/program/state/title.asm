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

  LDA #$00
  STA scanline

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

  LDA #$00
  STA game_a
  STA game_b

  RTI


ENGINE_STATE_TITLE_ACTIVE:
  GateValueEqual game_b, #$00, GameModeZero
    JSR EngineStateTitle_BlinkStart
  GameModeZero:

  GateValueEqual game_b, #$01, GameModeFade
    LDA scroll
    CMP #$EF
    BNE GameModFade_ScrollDone
      INC game_b
      JMP GameModeFade
    GameModFade_ScrollDone:

    INC scroll

    INC tick
    LDA tick
    CMP #$00
    BNE GameModeFade_FadeNone
      LDA #PALETTE_TITLE
      STA palette
      JMP GameModeFade
    GameModeFade_FadeNone:

    CMP #$20
    BNE GameModeFade_FadeA
      LDA #PALETTE_TITLE_FADE_A
      STA palette
      JMP GameModeFade
    GameModeFade_FadeA:

    CMP #$40
    BNE GameModeFade_FadeB
      LDA #PALETTE_TITLE_FADE_B
      STA palette
      JMP GameModeFade
    GameModeFade_FadeB:

    CMP #$60
    BNE GameModeFade_FadeC
      LDA #PALETTE_TITLE_FADE_C
      STA palette
      JMP GameModeFade
    GameModeFade_FadeC:
  GameModeFade:

  GateValueEqual game_b, #$02, GameModeFadeBack
    INC tick
    LDA tick
    CMP #$10
    BNE GameModeFadeBack_FadeB
      LDA #$00
      STA game_state
      JSR MAPSetCHRBankTitle

      LDA #PALETTE_TITLE_FADE_B
      STA palette
      JMP GameModeFadeBack
    GameModeFadeBack_FadeB:

    CMP #$20
    BNE GameModeFadeBack_FadeA
      LDA #PALETTE_TITLE_FADE_A
      STA palette
      JMP GameModeFadeBack
    GameModeFadeBack_FadeA:

    CMP #$30
    BNE GameModeFadeBack_FadeNone
      LDA #PALETTE_TITLE
      STA palette
      JMP GameModeFadeBack
    GameModeFadeBack_FadeNone:

    CMP #$60
    BNE GameModeFadeBack_Done
      INC game_b
    GameModeFadeBack_Done:
  GameModeFadeBack:

  GateValueEqual game_b, #$03, GameModeFadeAgain
    INC tick
    LDA tick

    CMP #$20
    BNE GameModeFadeAgain_FadeA
      LDA #PALETTE_TITLE_FADE_A
      STA palette
      JMP GameModeFadeAgain
    GameModeFadeAgain_FadeA:

    CMP #$40
    BNE GameModeFadeAgain_FadeB
      LDA #PALETTE_TITLE_FADE_B
      STA palette
      JMP GameModeFadeAgain
    GameModeFadeAgain_FadeB:

    CMP #$60
    BNE GameModeFadeAgain_FadeC
      INC game_b

      LDA #PALETTE_TITLE_FADE_C
      STA palette
      JMP GameModeFadeAgain
    GameModeFadeAgain_FadeC:
  GameModeFadeAgain:

  GateValueEqual game_b, #$04, GameModeScroll
    ; LDA scroll
    ; CMP #$00
    ; BNE GameModeScroll_ScrollDone
    ;   INC game_b
    ;   JMP GameModeScroll
    ; GameModeScroll_ScrollDone:

    ; DEC scroll
    LDA #$00
    STA scroll
    INC game_b

    INC game_state
    JSR MAPSetCHRBankTitleAlt
  GameModeScroll:

  GateValueEqual game_b, #$05, GameModeFadeBackAgain
    INC tick
    LDA tick
    CMP #$10
    BNE GameModeFadeBackAgain_FadeB
      LDA #PALETTE_TITLE_FADE_B
      STA palette
      JMP GameModeFadeBackAgain
    GameModeFadeBackAgain_FadeB:

    CMP #$20
    BNE GameModeFadeBackAgain_FadeA
      LDA #PALETTE_TITLE_FADE_A
      STA palette
      JMP GameModeFadeBackAgain
    GameModeFadeBackAgain_FadeA:

    CMP #$30
    BNE GameModeFadeBackAgain_FadeNone
      LDA #PALETTE_TITLE
      STA palette
      JMP GameModeFadeBackAgain
    GameModeFadeBackAgain_FadeNone:

    CMP #$60
    BNE GameModeFadeBackAgain_Done
      LDA #$00
      STA game_b
      JMP GameModeFadeBackAgain
    GameModeFadeBackAgain_Done:
  GameModeFadeBackAgain:

  JSR EngineStateTitle_Randomize
  JSR EngineStateTitle_PressStart

  RTI

.proc EngineStateTitle_BlinkStart
  DEC tick
  LDA tick
  CMP #$00
  BNE End
    LDA #$20
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
      INC game_a
      INC game_state
      JSR MAPSetCHRBankTitleAlt

      LDA game_a
      CMP #$0A
      BNE End

      LDA #$00
      STA game_a
      STA tick
      INC game_b

End:
    RTS
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
    JSR EngineStateTitle_Random
    STA $6000
  :

  RTS
.endproc

.proc EngineStateTitle_PressStart
  ControllerAGateStart :+
    ;; Start Pressed - change game state to GAME_NEXT
    LDA #GAME_SPLASH
    STA game
  :
  RTS
.endproc

.proc EngineStateTitle_Random
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
.endproc

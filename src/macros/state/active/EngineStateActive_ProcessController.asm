.macro EngineStateActive_ProcessController
.local DirectionUp, DirectionDown, DirectionLeft, DirectionRight, ButtonA, ButtonB, EndMacro
  PlayerGetStatus
  CMP #PLAYER_STATUS_SPAWNED
  BNE EndMacro

  ControllerAGateDirectionUp DirectionUp
    JSR EngineStateActive_PressUp
  DirectionUp:

  ControllerAGateDirectionDown DirectionDown
    JSR EngineStateActive_PressDown
  DirectionDown:

  ControllerAGateDirectionLeft DirectionLeft
    JSR EngineStateActive_PressLeft
  DirectionLeft:

  ControllerAGateDirectionRight DirectionRight
    JSR EngineStateActive_PressRight
  DirectionRight:

  ControllerAGateButtonA ButtonA
    JSR EngineStateActive_PressFire
    JMP ButtonB
  ButtonA:

  ControllerAGateButtonB ButtonB
    JSR EngineStateActive_PressFire
  ButtonB:

EndMacro:
.endmacro

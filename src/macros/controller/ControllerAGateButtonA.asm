CONTROLLER_BUTTON_A = %10000000

.macro ControllerAGateButtonA ExitBranch
  LDA controller_a
  AND #CONTROLLER_BUTTON_A
  CMP #CONTROLLER_BUTTON_A
  BNE ExitBranch

  LDA controller_ap
  AND #CONTROLLER_BUTTON_A
  CMP #CONTROLLER_BUTTON_A
  BNE ExitBranch
.endmacro

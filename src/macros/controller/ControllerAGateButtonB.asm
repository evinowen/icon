CONTROLLER_BUTTON_B = %01000000

.macro ControllerAGateButtonB ExitBranch
  LDA controller_a
  AND #CONTROLLER_BUTTON_B
  CMP #CONTROLLER_BUTTON_B
  BNE ExitBranch

  LDA controller_ap
  AND #CONTROLLER_BUTTON_B
  CMP #CONTROLLER_BUTTON_B
  BNE ExitBranch
.endmacro

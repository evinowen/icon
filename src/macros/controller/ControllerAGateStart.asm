CONTROLLER_START = %00010000

.macro ControllerAGateStart ExitBranch
  LDA controller_a
  AND #CONTROLLER_START
  CMP #CONTROLLER_START
  BNE ExitBranch

  LDA controller_ap
  AND #CONTROLLER_START
  CMP #CONTROLLER_START
  BNE ExitBranch
.endmacro

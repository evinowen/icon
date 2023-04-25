CONTROLLER_SELECT = %00100000

.macro ControllerAGateSelect ExitBranch
  LDA controller_a
  AND #CONTROLLER_SELECT
  CMP #CONTROLLER_SELECT
  BNE ExitBranch

  LDA controller_ap
  AND #CONTROLLER_SELECT
  CMP #CONTROLLER_SELECT
  BNE ExitBranch
.endmacro

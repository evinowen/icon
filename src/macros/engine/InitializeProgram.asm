.macro InitializeProgram
  ;; Set Interupt Disable Flag
  SEI

  ;; Clear Decimal Flag
  CLD

  ;; Set X Register to x40
  LDX #$40
  STX $4017    ; disable APU frame IRQ

  ;; Set X Register to xFF
  LDX #$FF

  ;; Set stack pointer to xFF from X
  TXS

  ;; Increment X, now x00
  INX

  STX $2000    ; disable NMI

  STX $2001    ; disable rendering

  STX $4010    ; disable DMC IRQs
.endmacro

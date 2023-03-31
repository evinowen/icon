.macro LoadPointer Source, Target
  LDA #<Source
  STA Target
  LDA #>Source
  STA Target + 1
.endmacro

.macro LoopPointer Source, Target, Routine, Iterations, Width
  LDA #$00
  PHA

  LoadPointer Source, Target

  :
    TSX
    LDA STACK + 1, X

    JSR Routine

    TSX
    LDY STACK + 1, X
    INY
    TYA
    STA STACK + 1, X

    CLC
    CMP Iterations
    BCS :+
      IncrementAddress Target, Width

      CLV
      BVC :-
    :

  PLA
.endmacro

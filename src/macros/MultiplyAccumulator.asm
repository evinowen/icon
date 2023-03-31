.macro MultiplyAccumulator Factor, Base
.local EndMacro
    .ifnblank Base
        LDA Base
    .endif

    CMP #$00
    BEQ EndMacro

    TAY
    LDA #$00

    :
        CLC
        ADC Factor

        DEY
        CPY #$00

    BNE :-

EndMacro:

.endmacro

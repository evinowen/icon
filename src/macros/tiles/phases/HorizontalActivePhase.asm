.macro HorizontalActivePhase LeftFlag
    JSR LoadBuffersHorizontal

    HorizontalPPUBuffer_BranchOverflow , Active, LeftFlag, :+
        LDA scroll_dir
        AND #%00111111
        ORA #%00100000
        STA scroll_dir

        .ifblank LeftFlag
            LDA #$FF
            STA scroll_fx

            LDA #$DF
        .else
            LDA #$00
            STA scroll_fx

            LDA #$20
        .endif
    :

    STA scroll_x

.endmacro

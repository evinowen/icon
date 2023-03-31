.macro VerticalActivePhase UpFlag
    JSR LoadBuffersTop

    VerticalPPUBuffer_BranchOverflow , Active, , UpFlag, :+
        LDA scroll_dir
        AND #%00111111
        ORA #%00100000
        STA scroll_dir

        .ifnblank UpFlag
            LDA #$60

        .else
            LDA #$EF
            STA scroll_fy

            LDA #$C0
        .endif

    :

    STA scroll_y

.endmacro

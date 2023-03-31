.macro HorizontalPPUBuffer_BranchOverflow Prepare, Active, LeftFlag, Branch
    LDA scroll_x

    .ifnblank Prepare
        .ifnblank LeftFlag
        .else
            CMP #$DF
            BCC :++
                TAX
                LDA scroll_dir
                ORA #%00001000
                STA scroll_dir

                LDA scroll_fx
                CLC
                ADC #SCROLL_SPEED
                CMP #$20
                BCC :+
                    LDA #$20
                :
                STA scroll_fx

                TXA
            :
        .endif
    .endif

    .ifnblank Active
        .ifnblank LeftFlag
            STA scroll_fx

            TAX
            LDA scroll_dir
            ORA #%00001000
            STA scroll_dir
            TXA
        .else
            TAX
            CLC
            ADC #$20
            BCC :+
                LDA #$FF
            :

            STA scroll_fx

            TXA
        .endif
    .endif

    .ifblank LeftFlag
        ;; Increment X-Scroll
        CLC
        ADC #SCROLL_SPEED

        ;; Test for X-Scroll Overflow
        BCC Branch

    .else
        ;; Decrement X-Scroll
        SEC
        SBC #SCROLL_SPEED

        ;; Test for X-Scroll Underflow
        BCS Branch

    .endif

.endmacro

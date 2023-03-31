.macro VerticalPPUBuffer_BranchOverflow Prepare, Active, Complete, UpFlag, Branch
    LDA scroll_y

    .ifnblank Prepare
        .ifnblank UpFlag
        .else
            CMP #$D0
            BCC :++
                TAX

                TAX
                LDA scroll_dir
                ORA #%00001000
                STA scroll_dir
                TXA

                LDA scroll_fy
                CLC
                ADC #SCROLL_SPEED
                CMP #$50
                BCC :+
                    LDA #$50
                :
                STA scroll_fy

                TXA
            :
        .endif
    .endif

    .ifnblank Active
        .ifnblank UpFlag
            TAX

            CLC
            ADC #$30
            BCS :+
            CMP #$EF
            BCC :++
            :
                LDA #$EF
                JMP :++
            :

            TAY
            LDA scroll_dir
            ORA #%00001000
            STA scroll_dir
            TYA

            :

            STA scroll_fy

            TXA
        .else
            TAX
            CLC
            ADC #$30
            BCS :+
            CMP #$EF
            BCC :++
            :
                LDA #$EF
            :

            STA scroll_fy

            TXA
        .endif
    .endif

    .ifnblank Complete
        .ifnblank UpFlag
            TAX
            LDA scroll_fy
            SEC
            SBC #SCROLL_SPEED
            CMP #$30
            BCS :+
                LDA #$30
            :
            STA scroll_fy

            TXA
        .else
        .endif
    .endif

    .ifnblank UpFlag
        ;; Decrement Y-Scroll
        SEC
        SBC #SCROLL_SPEED

        ;; Test for Y-Scroll Underflow
        CLC
        CMP #$30
        BCS Branch

    .else
        ;; Increment Y-Scroll
        CLC
        ADC #SCROLL_SPEED

        ;; Test for Y-Scroll Overflow
        CLC
        CMP #$F1
        BCC Branch

    .endif

.endmacro

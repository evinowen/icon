.macro BufferAttrCycleTop VertFlag, UpFlag, FlipFlag, StatusFlag
.local Loop, TopSkip, BottomSkip

    ;;
    ;; Set inital value for loop counter
    LDY #$00

Loop:
        ;;
        ;; Remember loop counter in store_a
        STY store_a

        ;;
        ;; Clear result in store_b
        LDA #$00
        STA store_b

        ;;
        ;; Load attribute offset from store_c
        LDX store_c


        .ifblank FlipFlag
            .ifnblank StatusFlag
            .else
                LDY store_a
                LoadAttribute {attr_buffer_well_a, Y}

                LDY store_a
                LoadAttribute {attr_buffer_well_b, Y}, 1
            .endif
        .endif


        ;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; TOP LEFT ATTR LOAD

        .ifblank FlipFlag
            TXA
            TAY

            LoadAttribute {(address_e), Y}, 1, 1

        .endif


        ;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; TOP RIGHT ATTR LOAD
        .ifblank FlipFlag
            TXA
            CLC
            ADC #$01
            TAY

            LoadAttribute {(address_e), Y}, 1, 1, 1

        .endif


    TopSkip:


        ;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; BOTTOM LEFT ATTR LOAD
        TXA
        CLC
        ADC #$10
        TAY

        .ifnblank FlipFlag
            .ifnblank StatusFlag
            .else
                LoadAttribute {(address_e), Y}
            .endif

        .else
            LDA (address_e), Y
            LDY store_a
            STA attr_buffer_well_a, Y

        .endif

        ;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; BOTTOM RIGHT ATTR LOAD
        TXA
        CLC
        ADC #$11
        TAY

        .ifnblank FlipFlag
            .ifnblank StatusFlag
            .else
                LoadAttribute {(address_e), Y}, 1
            .endif

        .else
            LDA (address_e), Y
            LDY store_a
            STA attr_buffer_well_b, Y

        .endif

    BottomSkip:

        .ifnblank FlipFlag
            LDY store_a
            LoadAttribute {attr_buffer_well_a, Y}, 1, 1

            LDY store_a
            LoadAttribute {attr_buffer_well_b, Y}, 1, 1, 1

        .endif

        ;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; TOP LEFT ATTR LOAD
        .ifnblank FlipFlag
            TXA
            TAY

            LDA (address_e), Y
            LDY store_a
            STA attr_buffer_well_a, Y
        .endif


        ;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; TOP RIGHT ATTR LOAD
        .ifnblank FlipFlag
            TXA
            CLC
            ADC #$01
            TAY

            LDA (address_e), Y
            LDY store_a
            STA attr_buffer_well_b, Y
        .endif




        ;; LOAD FINAL VALUE, STORE, THEN INCREMENT BUFFER
        LDY store_a
        LDA store_b
        STA attr_buffer, Y

        INY
        CPY #$08

        BEQ :+

            LDA store_c
            CLC
            ADC #$02
            STA store_c

            JMP Loop

        :

.endmacro

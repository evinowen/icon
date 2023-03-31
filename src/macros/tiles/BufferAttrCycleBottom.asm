.macro BufferAttrCycleBottom VertFlag, UpFlag
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


        ;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; TOP LEFT ATTR LOAD
        TXA
        TAY
        LoadAttribute {(address_e), Y}


        ;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; TOP RIGHT ATTR LOAD
        TXA
        CLC
        ADC #$01
        TAY
        LoadAttribute {(address_e), Y}, 1


    TopSkip:


        ;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; BOTTOM LEFT ATTR LOAD
        TXA
        CLC
        ADC #$10
        TAY

        LoadAttribute {(address_e), Y}, 1, 1

        ;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;; BOTTOM RIGHT ATTR LOAD
        TXA
        CLC
        ADC #$11
        TAY

        LoadAttribute {(address_e), Y}, 1, 1, 1


    BottomSkip:


        ;; LOAD FINAL VALUE, STORE, THEN INCREMENT BUFFER
        LDY store_a
        LDA store_b
        STA attr_buffer, Y

        INY
        CPY #$08
        BEQ :+

            LDA store_c
            CLC
            .ifblank VertFlag
                ADC #$20

            .else
                ADC #$02

            .endif
            STA store_c

            JMP Loop

        :

.endmacro

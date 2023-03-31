;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ScreenLoader
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.macro ScreenLoader_Loop Address, Exit, Value
    ;;;;;;;;;;;;;;;;;;;;;;
    ;; Reset PPU High/Low latch
    PPUStatus

    ;;;;;;;;;;;;;;;;;;;;;;
    ;; Write destination address to PPU
    LDA #>Address
    STA $2006
    LDA #<Address
    STA $2006

    ;;;;;;;;;;;;;;;;;;;;;;
    ;; Loop over the load
    CLC
    LDY #$00
    :
        LDA Value
        STA $2007

        INY
        CPY Exit
        BNE :-
.endmacro

ScreenLoader:
    ScreenLoader_Loop $2C00, #$00, #$FF
    ScreenLoader_Loop $2D00, #$00, #$FF
    ScreenLoader_Loop $2E00, #$00, #$FF
    ScreenLoader_Loop $2F00, #$C0, #$FF
    ScreenLoader_Loop $2FC0, #$00, #$00

    ScreenLoader_Loop $23C0, #$00, #$00
    ScreenLoader_Loop $2300, #$C0, #$FF
    ScreenLoader_Loop $2200, #$00, #$FF
    ScreenLoader_Loop $2100, #$00, #$FF
    ScreenLoader_Loop $2000, #$00, #$FF

    RTS

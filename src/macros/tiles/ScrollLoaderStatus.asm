;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ScrollLoader
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.macro ScrollLoaderStatus
    ;;;;;;;;;;;;;;;;;;;;;;
    ;; Reset PPU High/Low latch
    PPUStatus

    ;;;;;;;;;;;;;;;;;;;;;;
    ;; Write destination address to PPU
    LDA #$23
    STA $2006
    LDA #$C8
    STA $2006

    ;;;;;;;;;;;;;;;;;;;;;;
    ;; Run the Attribute load
    LDY #$00

    :
        LDA attr_buffer, Y
        STA $2007

        INY
        CPY #$08

    BNE :-

.endmacro

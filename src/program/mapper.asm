;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mapper Mirror Horizontal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MAPMirrorHorizontal:
    LDA #%10000000
    STA $8000

    LDA #%00000011

    STA $8000
    LSR A
    STA $8000
    LSR A
    STA $8000
    LSR A
    STA $8000
    LSR A
    STA $8000

  RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mapper Mirror Vertical
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MAPMirrorVertical:
    LDA #%10000000
    STA $8000

    LDA #%00000010

    STA $8000
    LSR A
    STA $8000
    LSR A
    STA $8000
    LSR A
    STA $8000
    LSR A
    STA $8000

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mapper Set CHR Bank
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MAPSetCHRBank:
    LDA #%10000000
    STA $A000

    TXA

    STA $A000
    LSR A
    STA $A000
    LSR A
    STA $A000
    LSR A
    STA $A000
    LSR A
    STA $A000

  RTS

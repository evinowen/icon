;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LOAD BACKGROUND STATUS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadBackgroundStatus:
  LoadPointer bg_tile_status, address_c
  ; LDA #<bg_tile_game
  ; STA address_c
  ; LDA #>bg_tile_game
  ; STA address_c + 1

  LoadPointer bg_attr_status, address_b
  ; LDA #<bg_attr_game
  ; STA address_b
  ; LDA #>bg_attr_game
  ; STA address_b + 1

  ;; Reset PPU High/Low latch
  PPUStatus

  PPUAddress #$20, #$00 ;; Tiles Address
  ; LDA #$20
  ; STA $2006             ; write the high byte of $2000 address
  ; LDA #$00
  ; STA $2006             ; write the low byte of $2000 address

  LDX #$00
  :
    LDY #$00
    :
      ;; Load tile at address_c offset by Y
      LDA (address_c), Y
      ;; Write to PPU
      STA $2007

      LoopY #$40, :-
      ; ;; Increment Y, the Inner Counter
      ; INY
      ; ;; Loop 64 times, two rows of tiles
      ; CPY #$40
      ; BNE :-

    ;; Increment target Address
    IncrementAddress address_c, #$40
    ; CLC
    ; LDA address_c
    ; ADC #$40
    ; STA address_c
    ; LDA address_c + 1
    ; ADC #$00
    ; STA address_c + 1

    LoopX #$03, :--
    ; ;; Increment X, the outer counter
    ; INX
    ; ;; Loop 3 times
    ; CPX #$03
    ; BNE :--

  ;; Reset PPU High/Low latch
  PPUStatus

  PPUAddress #$23, #$C0 ;; Attribute Address
  ; LDA #$23
  ; STA $2006             ; write the high byte of $23C0 address
  ; LDA #$C0
  ; STA $2006             ; write the low byte of $23C0 address

  LDY #$00              ; start out at 0
  :
    LDA (address_b), Y      ; load data from address (attribute + the value in x)
    STA $2007             ; write to PPU

    LoopY #$10, :-
    ; INY                   ; X = X + 1
    ; CPY #$10
    ; BNE :-

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LOAD BACKGROUND FULL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadBackgroundFull:
  LDA address_a
  STA address_c
  LDA address_a + 1
  STA address_c + 1

  ;; Reset PPU High/Low latch
  PPUStatus

  PPUAddress #$20, #$00
  ; LDA #$20
  ; STA $2006             ; write the high byte of $2000 address
  ; LDA #$00
  ; STA $2006             ; write the low byte of $2000 address

  ;; Reset and start Outer Loop
  LDX #$00
  :

    ;; Reset and start Inner Loop
    LDY #$00
    :
      ;; Load tile at address_a offset by Y
      LDA (address_c), Y
      ;; Write to PPU
      STA $2007

      LoopY #$40, :-
      ; ;; Increment Y, the Inner Counter
      ; INY
      ; ;; Loop 64 times, two rows of tiles
      ; CPY #$40
      ; BNE :-

    ;; Increment target Address
    IncrementAddress address_c, #$40
    ; CLC
    ; LDA address_c
    ; ADC #$40
    ; STA address_c
    ; LDA address_c + 1
    ; ADC #$00
    ; STA address_c + 1

    LoopX #$0F, :--
    ;; Increment X, the outer counter
    ; INX
    ; ;; Loop 15 times
    ; CPX #$0F
    ; BNE :--

  ;; Reset PPU High/Low latch
  PPUStatus

  PPUAddress #$23, #$C0
  ; LDA #$23
  ; STA $2006             ; write the high byte of $23C0 address
  ; LDA #$C0
  ; STA $2006             ; write the low byte of $23C0 address

  LDY #$00              ; start out at 0
  :

    LDA (address_b), Y      ; load data from address (attribute + the value in x)
    STA $2007             ; write to PPU

    LoopY #$40, :-
    ; INY                   ; X = X + 1
    ; CPY #$40              ; Compare X to hex $08, decimal 8 - copying 8 bytes
    ; BNE :-

  RTS

LoadPalette:
  PPUStatus

  PPUAddress #$3F, #$00
  ; LDA #$3F
  ; STA $2006
  ; LDA #$00
  ; STA $2006

  LDY #$00
  :
    LDA (address_a), Y
    STA $2007

    LoopY #$20, :-
    ; INY
    ; CPY #$20
    ; BNE :-

  RTS

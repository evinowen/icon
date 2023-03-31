;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PPU Split
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This function controls spliting the screen at
;; the zero sprite.
;;
.macro StatusBarSplit
  ;; PPUADDR Reset to Zero
  PPUAddress #$00
  ; LDA #$00
  ; STA $2006
  ; STA $2006

  ;; PPUSCROLL Reset to Zero
  ;; Scroll position always starts at zero -- If the screen is not split
  ;; then it the screen should not be scrolling, thus zero.  If the screen
  ;; is split, then the status bar must still be displayed first, and
  ;; thus the screen must start at zero, then update after the zero sprite
  ;; has triggered.
  PPUScroll #$00, #$00
  ; LDA #$00
  ; STA $2005
  ; STA $2005

  ;; Screen Status Break Check
  ;; Check first two bits of screen_status and continue only if the
  ;; second bit is set, but not the first.
  ;;
  ;; screen_status bit seven is UPDATE SPRITE ZERO -- if this bit is
  ;; set then the system is pending an update to the Zero Sprite, and
  ;; we cannot wait for the ZERO bit to be set without potentially
  ;; stalling the system.
  ;;
  ;; screen_status bit six is STATUS BAR ENABLED -- this indicates
  ;; that the status bar should be shown, so we must split the screen
  ;; at the zero sprite.
  LDA screen_status
  AND #%11000000
  CMP #%01000000
  BNE :+++
    ;; PPUSTATUS Zero is Clear
    ;; Ensure the ZERO bit is clear, thus the pre-render line has started
    ;; processing, and we can avoid triggering the ZERO hit early.
    LDA #%01000000
    :
      BIT $2002
      BVS :-


    ;; PPUSTATUS Zero is Set
    ;; Ensure the ZERO bit is set, thus all lines have been rendered up
    ;; to the Zero Sprite.
    LDA #%01000000
    :
      BIT $2002
      BVC :-

  :

.endmacro

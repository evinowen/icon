.macro PPUClear
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;
  ;; PPUCTRL ($2000)
  ;;  76543210
  ;;  | ||||||
  ;;  | ||||++- Base nametable address
  ;;  | ||||    (0 = $2000; 1 = $2400; 2 = $2800; 3 = $2C00)
  ;;  | |||+--- VRAM address increment per CPU read/write of PPUDATA
  ;;  | |||     (0: increment by 1, going across; 1: increment by 32, going down)
  ;;  | ||+---- Sprite pattern table address for 8x8 sprites (0: $0000; 1: $1000)
  ;;  | |+----- Background pattern table address (0: $0000; 1: $1000)
  ;;  | +------ Sprite size (0: 8x8; 1: 8x16)
  ;;  |
  ;;  +-------- Generate an NMI at the start of the
  ;;            vertical blanking interval vblank (0: off; 1: on)
  ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  LDA #%00000000
  STA $2000

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;
  ;; PPUMASK ($2001)
  ;;
  ;; 76543210
  ;; ||||||||
  ;; |||||||+- Grayscale (0: normal color; 1: AND all palette entries
  ;; |||||||   with 0x30, effectively producing a monochrome display;
  ;; |||||||   note that colour emphasis STILL works when this is on!)
  ;; ||||||+-- Disable background clipping in leftmost 8 pixels of screen
  ;; |||||+--- Disable sprite clipping in leftmost 8 pixels of screen
  ;; ||||+---- Enable background rendering
  ;; |||+----- Enable sprite rendering
  ;; ||+------ Intensify reds (and darken other colors)
  ;; |+------- Intensify greens (and darken other colors)
  ;; +-------- Intensify blues (and darken other colors)
  ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  LDA #%00000000
  STA $2001

.endmacro

InitializeProgram

VBlankWait

ResetSound

ClearMemory

VBlankWait

LDX #$00
JSR MAPSetCHRBankTitle
JSR ScreenLoader

LDA #$00
STA palette
STA palette_last

LoadPointer palette_title, address_a

JSR LoadPalette

;;
;; Enable NMI
;; Background from Pattern Table 1
;; Sprites from Pattern Table 0
;;

LDA #%10010000
STA ppu_ctrl

;;
;; Enable Sprites
;; Enable Background
;; Disable Sprite clipping on left side
;; Disable Background clipping on left side
;;

LDA #%00011110
STA ppu_mask

PPUSet

STA $E000 ;; MMC3 IRQ DISABLE
CLI

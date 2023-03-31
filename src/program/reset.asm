InitializeProgram

VBlankWait

ResetSound

ClearMemory

VBlankWait

LDX #$00
JSR MAPSetCHRBank
JSR MAPMirrorHorizontal
JSR ScreenLoader

;; Set Action flag to skip PPUClear in LoadPalette and LoadBackground
LDA #$00
STA action

;; LOAD STARTING PALETTE
LoadPointer palette_title, address_a
; LDA #<palette_title
; STA address_a
; LDA #>palette_title
; STA address_a + 1

JSR LoadPalette

; LDA #<SPRITE_ADDR_SCROLL
; STA address_b
; LDA #>SPRITE_ADDR_SCROLL
; STA address_b + 1

; LDA #<sprite_scroll
; STA address_c
; LDA #>sprite_scroll
; STA address_c + 1

; JSR LoadSpriteSingle

LoadPointer player, address_player
LoadPointer monsters, address_monsters
LoadPointer collectables, address_collectables

LoadPointer tile_map, address_tile_map

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

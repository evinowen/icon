;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ZEROPAGE SEGMENT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.segment "ZEROPAGE"

;;
;; ZERO A/B/C
;; Quick access storage that should be considered unsafe.
;; Used for situtations where speed is important, and no
;; subroutines will be called while in use.
zero_a:       .res 1
zero_b:       .res 1
zero_c:       .res 1


;;
;; STORE A/B/C/D/E
;; Single byte storage to keep track of variables
;; during execution.
store_a:       .res 1
store_b:       .res 1
store_c:       .res 1
store_d:       .res 1
store_e:       .res 1


;;
;; Address A/B/C/D/E
;; Double byte storage to keep track of addresses
;; during execution.
address_a:     .res 2
address_b:     .res 2
address_c:     .res 2
address_d:     .res 2
address_e:     .res 2
address_t:     .res 2
address_jmp:   .res 2

tick:          .res 1
hit:           .res 1

;;
;; PPU CTRL
;; The current value of PPU_CTRL
ppu_ctrl:      .res 1

;;
;; PPU Mask
;; The current value of PPU_MASK
ppu_mask:      .res 1

;;
;; Seed
;; The random seed value
seed:          .res 2

;;
;; Frame
;; Current game frame position - counts to eight
;; during normal NMI operation for each VBlank, then
;; resets.
frame:         .res 1

;;
;; Game
;; The current game engine mode.
game:          .res 1
game_last:     .res 1
game_prep:     .res 1
game_pause:    .res 1
game_state:    .res 1


;;
;; Scroll
;; Number of pixels to scroll the view down vertically
scroll:     .res 1

;;
;; Controller A and B
;; Location where controller bits are loaded when
;; InputControllerA or InputControllerB are called
controller_a:  .res 1
controller_b:  .res 1

;;
;; Controller A/B Previous
;; Tracking variables, used to determine in a key has
;; been held down.  Should be set to the value of
;; controller_a/controller_b respectively the same frame
;; the input is loaded but after initial checks are done.
controller_ap: .res 1
controller_bp: .res 1

;;
;; Player Score Credit
;; Stores the current credit owed to the player by the system
player_score_credit: .res 1

;;
;; Player Score A/B/C/D
;; Stores the player score, in a format that can be quickly
;; converted to decimal values.
;;
;; Every four bits represent a single digit for 0-9 values.
;; D-------C-------B-------A-------
;; 8---7---6---5---4---3---2---1---
;;
player_score_a: .res 1
player_score_b: .res 1
player_score_c: .res 1
player_score_d: .res 1


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Screen Status Byte
;;
;; 76543210
;; ||||||||
;; ||||||||
;; ||||||||
;; ||||||||
;; ||||++++-
;; |||+-----
;; ||+------ Status Bar Loaded
;; |+------- Status Bar Enabled
;; +-------- Update Sprite Zero
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
screen_status:     .res 1

SCREEN_STATUS_UPDATE      = %10000000
SCREEN_STATUS_BAR_ENABLED = %01000000
SCREEN_STATUS_BAR_LOADED  = %00100000
; SCREEN_STATUS_            = %00010000
; SCREEN_STATUS_            = %00001000
; SCREEN_STATUS_            = %00000100
; SCREEN_STATUS_            = %00000010
; SCREEN_STATUS_            = %00000001


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Color Status Byte
;;
;; 76543210
;; |
;; +-------- Update
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
color_status:  .res 1
color_index:   .res 1


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Sound
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sound_effect:   .res 1
sound_tick:     .res 1
sound_register: .res 1


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Background Status Byte
;;
;; 76543210
;; ||||||||
;; ||||||||
;; ||||||||
;; ||||||||
;; ||||++++- Index
;; |||+-----
;; ||+------ Mirror
;; |+------- Split
;; +-------- Update
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bg_status:     .res 1

BG_STATUS_UPDATE = %10000000
BG_STATUS_SPLIT  = %01000000
BG_STATUS_MIRROR = %00100000
; BG_STATUS_       = %00010000
BG_STATUS_INDEX  = %00001111

bg_current:    .res 1


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Sprite Status Byte
;;
;; 76543210
;; ||||||||
;; ||||||||
;; ||||||++- Facing (00: Up, 01: Down, 10: Left, 11: Right )
;; |||||+---
;; ||||+---- Value
;; |||+----- Toggle
;; ||+------ Rendered
;; |+------- Display
;; +-------- Update
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
creatures:
  player: .res OBJ_CREATURE
  .res OBJ_CREATURE
  .res OBJ_CREATURE
  .res OBJ_CREATURE
  .res OBJ_CREATURE
  .res OBJ_CREATURE
  .res OBJ_CREATURE
  .res OBJ_CREATURE
  .res OBJ_CREATURE
  .res OBJ_CREATURE
  .res OBJ_CREATURE
  .res OBJ_CREATURE
  .res OBJ_CREATURE

player_bullets:
  .res OBJ_BULLET
  .res OBJ_BULLET
  .res OBJ_BULLET
  .res OBJ_BULLET
  .res OBJ_BULLET
  .res OBJ_BULLET
  .res OBJ_BULLET
  .res OBJ_BULLET

enemy_bullets:
  .res OBJ_BULLET
  .res OBJ_BULLET
  .res OBJ_BULLET
  .res OBJ_BULLET
  .res OBJ_BULLET
  .res OBJ_BULLET
  .res OBJ_BULLET
  .res OBJ_BULLET
  .res OBJ_BULLET
  .res OBJ_BULLET
  .res OBJ_BULLET
  .res OBJ_BULLET

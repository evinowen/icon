;; SPRITE
;; These are bytes as defined by the NES system
SPRITE_SIZE         = $04
SPRITE_OFFSET_Y_POS = $00
SPRITE_OFFSET_TILE  = $01
SPRITE_OFFSET_ATTRS = $02
SPRITE_OFFSET_X_POS = $03
;; These are offsets that represent facings
SPRITE_FACE_UP      = $06
SPRITE_FACE_DOWN    = $00
SPRITE_FACE_LEFT    = $04
SPRITE_FACE_RIGHT   = $02
;; These are memory addresses used for sprites
SPRITE_ADDR_SCROLL = $0200
SPRITE_ADDR_WEAPON = $0204
;;EMPTY            = $0208
;;EMPTY            = $020C

SPRITE_ADDR_OBJECTS  = $0210
SPRITE_ADDR_PLAYER   = $0210
SPRITE_ADDR_MONSTERS = $0220
SPRITE_ADDR_COLLECT  = $02A0

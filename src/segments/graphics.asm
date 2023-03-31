;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GRAPHICS BANK
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; The GRAPHICS bank is used to store the tileset.  Only tileset
;; data is stored here, no code.  All of this data is stored in
;; an external binary format file.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.segment "GRAPHICS"
.incbin "gfx/title.frame.chr"
.incbin "gfx/game.frame.chr"

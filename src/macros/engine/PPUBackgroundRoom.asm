
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PPU Background Room
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PPUBACKGROUNDROOM_TITLE   = $F0
PPUBACKGROUNDROOM_SPLASH  = $F1
PPUBACKGROUNDROOM_ACTIVE  = $F2
PPUBACKGROUNDROOM_PASSIVE = $F3
PPUBACKGROUNDROOM_DEATH   = $F4

.macro PPUBackgroundRoom RoomIndex
.local LoadBackground, EndMacro

  LDA RoomIndex

  .scope
  CMP #PPUBACKGROUNDROOM_TITLE
  BNE End
    LoadPointer bg_tile_title, address_a
    LoadPointer bg_attr_title, address_b

    JMP LoadBackground
  End:
  .endscope

  .scope
  CMP #PPUBACKGROUNDROOM_SPLASH
  BNE End
    LoadPointer bg_tile_splash, address_a
    LoadPointer bg_attr_splash, address_b

    JMP LoadBackground
  End:
  .endscope

  .scope
  CMP #PPUBACKGROUNDROOM_ACTIVE
  BNE End
    LoadPointer bg_tile_active, address_a
    LoadPointer bg_attr_active, address_b

    JMP LoadBackground
  End:
  .endscope

  .scope
  CMP #PPUBACKGROUNDROOM_PASSIVE
  BNE End
    LoadPointer bg_tile_passive, address_a
    LoadPointer bg_attr_passive, address_b

    JMP LoadBackground
  End:
  .endscope

  .scope
  CMP #PPUBACKGROUNDROOM_DEATH
  BNE End
    LoadPointer bg_tile_death, address_a
    LoadPointer bg_attr_death, address_b

    JMP LoadBackground
  End:
  .endscope

  JMP EndMacro

LoadBackground:
  JSR LoadBackgroundFull

EndMacro:
.endmacro

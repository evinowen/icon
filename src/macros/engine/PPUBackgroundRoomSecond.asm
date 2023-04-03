;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PPU Background Room Second
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.macro PPUBackgroundRoomSecond RoomIndex
.local LoadBackground, EndMacro

  LDA RoomIndex

  .scope
  CMP #PPUBACKGROUNDROOM_TITLE
  BNE End
    JMP EndMacro
  End:
  .endscope

  .scope
  CMP #PPUBACKGROUNDROOM_SPLASH
  BNE End
    JMP EndMacro
  End:
  .endscope

  .scope
  CMP #PPUBACKGROUNDROOM_ACTIVE
  BNE End
    LoadPointer bg_tile_passive, address_a
    LoadPointer bg_attr_passive, address_b

    JMP LoadBackground
  End:
  .endscope

  .scope
  CMP #PPUBACKGROUNDROOM_DEATH
  BNE End
    JMP EndMacro
  End:
  .endscope

LoadBackground:
  JSR LoadBackgroundFullSecond

EndMacro:
.endmacro

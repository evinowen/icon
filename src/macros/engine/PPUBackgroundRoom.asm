
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PPU Background Room
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.macro PPUBackgroundRoom RoomIndex
.local EndMacro

  LDA RoomIndex

  .proc TitleBackground
  CMP #$F0
  BNE End
    LoadPointer bg_tile_title, address_a
    LoadPointer bg_attr_title, address_b

    JMP EndMacro
  End:
  .endproc

  .proc SplashBackground
  CMP #$F1
  BNE End
    LoadPointer bg_tile_splash, address_a
    LoadPointer bg_attr_splash, address_b

    JMP EndMacro
  End:
  .endproc

  .proc ActiveBackground
  CMP #$F2
  BNE End
    LoadPointer bg_tile_active, address_a
    LoadPointer bg_attr_active, address_b

    JMP EndMacro
  End:
  .endproc

  .proc DeathBackground
  CMP #$F3
  BNE End
    LoadPointer bg_tile_death, address_a
    LoadPointer bg_attr_death, address_b

    JMP EndMacro
  End:
  .endproc

EndMacro:
.endmacro

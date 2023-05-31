.proc EngineStateActive_CoolWeapon
  LDA game_weapon_heat
  CMP #$00
  BEQ :+
    DEC game_weapon_heat
  :

  RTS
.endproc

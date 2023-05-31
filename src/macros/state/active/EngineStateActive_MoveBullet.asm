.macro EngineStateActive_MoveBullet Index
.local EndMacro
  SpriteGetYPosition Index
  CMP #$F0
  BCS EndMacro
    SpriteDecrementYPosition Index, #$03
EndMacro:
.endmacro

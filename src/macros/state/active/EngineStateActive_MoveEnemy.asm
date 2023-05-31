.macro EngineStateActive_MoveEnemy Index
.local EndMacro
  SpriteGetYPosition Index
  CMP #$F0
  BCS EndMacro
    SpriteIncrementYPosition Index, #$01
EndMacro:
.endmacro
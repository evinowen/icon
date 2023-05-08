.macro PrintScorePair Input
  LDA Input
  AND #%11110000

  LSR A
  LSR A
  LSR A
  LSR A

  STA $2007

  LDA Input
  AND #%00001111

  STA $2007
.endmacro

.macro PrintScore
  LDA $2002

  LDA #$20
  STA $2006
  LDA #$57
  STA $2006

  PrintScorePair player_score_d
  PrintScorePair player_score_c
  PrintScorePair player_score_b
  PrintScorePair player_score_a
.endmacro

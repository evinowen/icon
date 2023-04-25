
  LDA #$00
  STA frame
  LDA #$FF
  STA seed

  LDA #GAME_TITLE
  STA game

  STA screen_status

  STA scroll

  STA controller_a
  STA controller_ap
  STA controller_b
  STA controller_bp

  STA bg_status
  STA bg_current

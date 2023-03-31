
  LDA #$00
  STA frame
  LDA #$FF
  STA seed

  ; LDA #ENGINE_STATE_TITLE
  LDA #$00
  STA game

  LDA #%10000000
  STA scroll_dir

  LDA #$00

  STA screen_status

  STA scroll_nt
  STA scroll_x
  STA scroll_y

  STA controller_a
  STA controller_ap
  STA controller_b
  STA controller_bp

  STA map_status
  STA map_dir

  STA bg_status
  STA bg_current
  STA bg_next

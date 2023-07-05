.macro PlayerSetStatus Value
  LDA Value
  STA player_status
.endmacro

.proc EngineStateActive_ScoreUpdate
  GateValueEqual player_score_credit, #$00, ExitNoCredit
    RTS
ExitNoCredit:

  DEC player_score_credit

  ByteSetBit player_score_status, #PLAYER_SCORE_UPDATE

  EngineStateActive_IncrementScore player_score_a, store_a, store_b, ExitCreditComplete
  EngineStateActive_IncrementScore player_score_b, store_a, store_b, ExitCreditComplete
  EngineStateActive_IncrementScore player_score_c, store_a, store_b, ExitCreditComplete
  EngineStateActive_IncrementScore player_score_d, store_a, store_b, ExitCreditComplete

ExitCreditComplete:
  RTS
.endproc

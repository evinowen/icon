.macro MMC3SetCHRBank BankIndex, StoreIndex
  LDA BankIndex
  STA $8000

  LDA StoreIndex
  STA $8001
.endmacro

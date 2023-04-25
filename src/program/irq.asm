PushState

STA $E000 ;; Disable MMC IRQ
Splitscreen #$00, scroll

PullState

RTI

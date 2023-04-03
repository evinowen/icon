PushState

STA $E000 ;; Disable MMC IRQ
Splitscreen #$00, scroll_fy

PullState

RTI

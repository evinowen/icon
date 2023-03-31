.macro VBlankWait
  :

  ;;
  ;; Status ($2002) < read
  ;;
  ;; 7  bit  0
  ;; ---- ----
  ;; VSO. ....
  ;; |
  ;; +--------- Vertical blank has started (0: not in vblank; 1: in vblank).
  ;;            Set at dot 1 of line 241 (the line *after* the post-render
  ;;            line); cleared after reading $2002 and at dot 1 of the
  ;;            pre-render line.
  ;;
  ;; (Source https://wiki.nesdev.com/w/index.php/PPU_registers)
  ;;
  BIT $2002

  ;;
  ;; Since BIT takes bit 7 of the address and assigns
  ;; it to N (Negative Flag), BPL (Branch on Positive) will
  ;; indicate that bit 7 of $2002 is still 0 and as soon
  ;; as 1 is read the loop will exit.
  ;;
  BPL :-

.endmacro

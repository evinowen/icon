;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PPU Buffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.macro PPUBuffer

  ;;
  ;; Load the Scroll Direction
  ;; The first half of scroll_dir, bits 0-3, represent the current scroll
  ;; direction.  Load this value into A so it can be compared and
  ;; the correct scroll function can be called for the current state.
  ;;
  ;; If it is zero, reset scroll_dir and setup for not scrolling.
  ;;

  LDA scroll_dir
  AND #%00000111



  ;;
  ;; Scrolling Right
  ;;

  CLC
  CMP #$01
  BNE :+
    JMP PPUBufferRight
  :



  ;;
  ;; Scrolling Down
  ;;

  CLC
  CMP #$02
  BNE :+
    JMP PPUBufferDown
  :



  ;;
  ;; Scrolling Left
  ;;

  CLC
  CMP #$03
  BNE :+
    JMP PPUBufferLeft
  :




  ;;
  ;; Scrolling Up
  ;;

  CLC
  CMP #$04
  BNE :+
    JMP PPUBufferUp
  :



  ;;
  ;; Not Scrolling
  ;; Reset scroll_dir and screen coordinates to position of static screen
  ;; top left corner -- this should be X at zero, and Y at the status
  ;; bar height.
  ;;

  LDA #$00
  STA scroll_dir

  LDA #$00
  STA scroll_x

  LDA #$2F
  STA scroll_y

.endmacro

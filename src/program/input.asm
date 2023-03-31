;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; INPUT CONTROLLER A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;
  ;; 76543210
  ;; ||||||||
  ;; |||||||+- Right
  ;; ||||||+-- Left
  ;; |||||+--- Down
  ;; ||||+---- Up
  ;; |||+----- Start
  ;; ||+------ Select
  ;; |+------- B
  ;; +-------- A
  ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

InputControllerA:
  LDA controller_a
  STA controller_ap

  LDA #$01
  STA $4016
  LDA #$00
  STA $4016
  LDX #$08

  :
    LDA $4016
    LSR A
    ROL controller_a
    DEX
    BNE :-

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; INPUT CONTROLLER B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;
  ;; 76543210
  ;; ||||||||
  ;; |||||||+- Right
  ;; ||||||+-- Left
  ;; |||||+--- Down
  ;; ||||+---- Up
  ;; |||+----- Start
  ;; ||+------ Select
  ;; |+------- B
  ;; +-------- A
  ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

InputControllerB:
  LDA controller_b
  STA controller_bp

  LDA #$01
  STA $4016
  LDA #$00
  STA $4016
  LDX #$08

  :
    LDA $4017
    LSR A
    ROL controller_b
    DEX
    BNE :-

  RTS

; InputTranslateDirection:
;   CMP #%00001000
;   BNE :+
;     LDA #DIR_UP
;     RTS
;   :

;   CMP #%00000100
;   BNE :+
;     LDA #DIR_DOWN
;     RTS
;   :

;   CMP #%00000010
;   BNE :+
;     LDA #DIR_LEFT
;     RTS
;   :

;   CMP #%00000001
;   BNE :+
;     LDA #DIR_RIGHT
;     RTS
;   :

;   RTS

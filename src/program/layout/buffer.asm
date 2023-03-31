AdvanceTileMapRegister:
  ; Compare Y to ZERO
  CPY #$00
  ; If Y is NE to ZERO, BRANCH
  BNE :+
    ; If Y is EQUAL to ZERO, RETURN
    RTS
  :

  ; Load ZERO into A
  LDA #$00
  ; Store A (ZERO) into STORE_E
  STA store_e

  ; Copy Y (non-ZERO) to A
  TYA


  ; The following process multiplies input Y (as A) by 8, while
  ; preserving the overflow bits in STORE_E
  CLC

  ; Move LEFT-most bit of A to STORE_E
  ROL A
  ROL store_e

  ; Move LEFT-most bit of A to STORE_E
  ROL A
  ROL store_e

  ; Move LEFT-most bit of A to STORE_E
  ROL A
  ROL store_e

  ;       a ; YYYY YYYY -> YYYY Y000
  ; store_e ; 0000 0000 -> 0000 0YYY

  ; Store resulting value as Y
  TAY

  ; Add overlow to second address bit of address_t, the loaded tile pointer
  LDA address_t + 1
  ADC store_e
  STA address_t + 1

  ; Copy Y (non-ZERO) to A again, equal to input multiplied by 8
  TYA

  RTS

BufferAttrCycleTop_Up:
  BufferAttrCycleTop VertFlag, UpFlag, FlipFlag
  RTS

BufferAttrCycleTop_UpStatus:
  BufferAttrCycleTop VertFlag, UpFlag, FlipFlag, StatusFlag
  RTS

BufferAttrCycleTop_Down:
  BufferAttrCycleTop VertFlag, UpFlag
  RTS

BufferAttrCycleTop_DownStatus:
  BufferAttrCycleTop VertFlag, UpFlag, , StatusFlag
  RTS

LoadBuffersBottom:
  BufferLoader VertFlag
  RTS

LoadBuffersBottomCompStatus:
  BufferLoaderStatus
  RTS

LoadBuffersHorizontal:
  BufferLoader
  RTS

LoadBuffersTop:
  BufferLoader VertFlag, UpFlag
  RTS

LoadBuffersTopComp:
  BufferLoader VertFlag, UpFlag, CompleteFlag
  RTS

LoadBuffersTopCompStatus:
  BufferLoaderStatus
  RTS

PPUBufferDown:
  VerticalPPUBuffer
  RTS

PPUBufferUp:
  VerticalPPUBuffer UpFlag
  RTS

PPUBufferRight:
  HorizontalPPUBuffer
  RTS

PPUBufferLeft:
  HorizontalPPUBuffer LeftFlag
  RTS

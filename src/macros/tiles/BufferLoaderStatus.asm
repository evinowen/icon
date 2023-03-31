;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BufferLoaderStatus
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.macro BufferLoaderStatus
.local AttrLoop, AttrTopSkip, AttrBottomSkip, EndMacro, AttrLoopJmp2, AttrLoop2, AttrLoop2, AttrTopSkip2, AttrBottomSkip2, AttrLoopJmp3, AttrLoop3, AttrLoop3, AttrTopSkip3, AttrBottomSkip3
    LDA #$00
    STA store_c

    LDA scroll_dir
    AND #%00000111

    CMP #$02
    BNE :+
        JSR BufferAttrCycleTop_DownStatus

    :

    CMP #$04
    BNE :+
        JSR BufferAttrCycleTop_UpStatus

    :

EndMacro:
.endmacro

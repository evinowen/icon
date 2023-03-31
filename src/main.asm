;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MAIN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; The contents provider here represent the basic layout of the
;; application.  Metadata is defined to establish a baseline for
;; the environment in which instructions can be developed, from
;; use of constants and macros.  Following. each defined segment
;; represents a particular location in memory that is defined as
;; part of the nes.cfg file that accompanies these instructions.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; METADATA
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Constants are symbols defined as part of the assembly process
;; and thus are not defined as part of a segment or represented
;; in memory.
;;
;; Macros are representations of assembler code that are copied
;; to the location that the macro is called as part of the
;; assembly process, and thus are similarly not defined as part
;; of a segment or represented in memory.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.include ".constants.asm" ;; Generated as part of the program make process
.include ".macros.asm"    ;; Generated as part of the program make process

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SEGMENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Each segment represents a particular physical location for
;; storage of instructions and additional data, and map back to
;; labels in the configuration file passed into CA65 on assembly.
;;
;; PRG ROM are ROM banks connected to the CPU
;; CHR ROM are ROM banks connected to the PPU
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Zeropage must be loaded first for correct addressing
.include "segments/zeropage.asm"

.include "segments/buffer.asm"
.include "segments/graphics.asm"
.include "segments/header.asm"
.include "segments/layout.asm"
.include "segments/program.asm"
.include "segments/ram.asm"
.include "segments/vectors.asm"

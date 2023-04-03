;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; HEADER SEGMENT - INES HEADER
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Format per https://wiki.nesdev.com/w/index.php/INES
;;
;;   0-3: Constant $4E $45 $53 $1A ("NES" followed by MS-DOS end-of-file)
;;     4: Size of PRG ROM in 16 KB units
;;     5: Size of CHR ROM in 8 KB units (Value 0 means the board uses CHR RAM)
;;     6: Flags 6
;;     7: Flags 7
;;     8: Size of PRG RAM in 8 KB units (Value 0 infers 8 KB for compatibility; see PRG RAM circuit)
;;     9: Flags 9
;;    10: Flags 10 (unofficial)
;; 11-15: Zero filled
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.segment "HEADER"

;; BYTE 0:  iNES header identifier; "NES" followed by MS-DOS end-of-file
.byte "NES", $1A

;; BYTE 4: Set 16KB PRG ROM Banks
.byte $04

;; BYTE 5: Set 8KB CHR ROM Banks
.byte $08

;; BYTE 6: https://www.nesdev.org/wiki/INES#Flags_6
;;   76543210
;;   ||||||||
;;   |||||||+- Mirroring: 0: horizontal (vertical arrangement) (CIRAM A10 = PPU A11)
;;   |||||||              1: vertical (horizontal arrangement) (CIRAM A10 = PPU A10)
;;   ||||||+-- 1: Cartridge contains battery-backed PRG RAM ($6000-7FFF) or other persistent memory
;;   |||||+--- 1: 512-byte trainer at $7000-$71FF (stored before PRG data)
;;   ||||+---- 1: Ignore mirroring control or above mirroring bit; instead provide four-screen VRAM
;;   ++++----- Lower nybble of mapper number
.byte %01000000

;; BYTE 7: https://www.nesdev.org/wiki/INES#Flags_7
;;   76543210
;;   ||||||||
;;   |||||||+- VS Unisystem
;;   ||||||+-- PlayChoice-10 (8KB of Hint Screen data stored after CHR data)
;;   ||||++--- If equal to 2, flags 8-15 are in NES 2.0 format
;;   ++++----- Upper nybble of mapper number
.byte %00000000

;; BYTE 8: Set zero 8KB PRG RAM Banks
.byte $00

;; BYTE 9: https://www.nesdev.org/wiki/INES#Flags_9
;;   76543210
;;   ||||||||
;;   |||||||+- TV system (0: NTSC; 1: PAL)
;;   +++++++-- Reserved, set to zero
;;
.byte %00000000

;; BYTE 10: https://www.nesdev.org/wiki/INES#Flags_10
;; 76543210
;;   ||  ||
;;   ||  ++- TV system (0: NTSC; 2: PAL; 1/3: dual compatible)
;;   |+----- PRG RAM ($6000-$7FFF) (0: present; 1: not present)
;;   +------ 0: Board has no bus conflicts; 1: Board has bus conflicts
.byte $00

;; BYTE 11: Zerofill Remaining
.byte $00, $00, $00, $00, $00

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SYSTEM BANK
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; The SYSTEM bank stores data about the system.
;;
;; Various read-only details about tile mapping, monster setup,
;; etc. are stored here under the LAYOUT segment.  Essentially
;; large arrays of data need as a basis for many systems used
;; to create the game world.
;;
;; Additionally, maps the labels that are used for the NES
;; NMI and RESET functions, under the VECTORS segment.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.segment "LAYOUT"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PALETTES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Title
palette_title:
  .byte $0F,$20,$00,$10,  $0F,$20,$00,$10,  $0F,$20,$00,$10,  $0F,$20,$00,$10
  .byte $0F,$20,$00,$10,  $0F,$20,$00,$10,  $0F,$20,$00,$10,  $0F,$20,$00,$10


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Title Screen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bg_tile_title:
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  1 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  2 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  3 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  4 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  5 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  6 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  7 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  8 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  ___,___,___,___,  ___,XXX,XXX,XXX,  XXX,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  9 ;;
  .byte  ___,___,___,___,  ___,___,XXX,XXX,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 10 ;;
  .byte  ___,___,___,___,  ___,___,XXX,XXX,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 11 ;;
  .byte  ___,___,___,___,  ___,___,XXX,XXX,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 12 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  ___,___,___,___,  ___,___,XXX,XXX,  ___,___,___,XXX,  XXX,XXX,XXX,___,  ___,XXX,XXX,XXX,  XXX,___,___,XXX,  ___,___,XXX,___,  ___,___,___,___  ;; 13 ;;
  .byte  ___,___,___,___,  ___,___,XXX,XXX,  ___,___,___,XXX,  ___,___,___,___,  ___,XXX,___,___,  XXX,___,___,XXX,  XXX,___,XXX,___,  ___,___,___,___  ;; 14 ;;
  .byte  ___,___,___,___,  ___,___,XXX,XXX,  ___,___,___,XXX,  ___,___,___,___,  ___,XXX,___,___,  XXX,___,___,XXX,  ___,XXX,XXX,___,  ___,___,___,___  ;; 15 ;;
  .byte  ___,___,___,___,  ___,XXX,XXX,XXX,  XXX,___,___,XXX,  XXX,XXX,XXX,___,  ___,XXX,XXX,XXX,  XXX,___,___,XXX,  ___,___,XXX,___,  ___,___,___,___  ;; 16 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 17 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 18 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 19 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 20 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 21 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 22 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 23 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,_P_,_R_,  _E_,_S_,_S_,___,  ___,_S_,_T_,_A_,  _R_,_T_,___,___,  ___,___,___,___,  ___,___,___,___  ;; 24 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 25 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 26 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 27 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 28 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 29 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 30 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;

bg_attr_title:
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Splash Screen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bg_tile_splash:
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  1 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  2 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  3 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  4 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  5 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  6 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  7 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  8 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  9 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 10 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 11 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 12 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 13 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,_L_,_A_,_U_,  _N_,_C_,_H_,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 14 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 15 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 16 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 17 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 18 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 19 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 20 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 21 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 22 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 23 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 24 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 25 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 26 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 27 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 28 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 29 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 30 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;

bg_attr_splash:
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Active Screen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

bg_tile_active:
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  1 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  2 ;;
  .byte  ___,_I_,_C_,_O_,  _N_,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,_0_,  _0_,_0_,_0_,_0_,  _0_,_0_,_0_,___  ;;  3 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  4 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$32  ;;  5 ;;
  .byte  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43  ;;  6 ;;
  .byte  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53  ;;  7 ;;
  .byte  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63  ;;  8 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$32  ;;  9 ;;
  .byte  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43  ;; 10 ;;
  .byte  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53  ;; 11 ;;
  .byte  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63  ;; 12 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$32  ;; 13 ;;
  .byte  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43  ;; 14 ;;
  .byte  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53  ;; 15 ;;
  .byte  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63  ;; 16 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$32  ;; 17 ;;
  .byte  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43  ;; 18 ;;
  .byte  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53  ;; 19 ;;
  .byte  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63  ;; 20 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$32  ;; 21 ;;
  .byte  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43  ;; 22 ;;
  .byte  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53  ;; 23 ;;
  .byte  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63  ;; 24 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$32  ;; 25 ;;
  .byte  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43  ;; 26 ;;
  .byte  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53  ;; 27 ;;
  .byte  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63  ;; 28 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$32  ;; 29 ;;
  .byte  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43  ;; 30 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;

bg_attr_active:
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Passive Screen - Second Screen for Star Scroll
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bg_tile_passive:
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$32  ;;  1 ;;
  .byte  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43  ;;  2 ;;
  .byte  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53  ;;  3 ;;
  .byte  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63  ;;  4 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$32  ;;  5 ;;
  .byte  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43  ;;  6 ;;
  .byte  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53  ;;  7 ;;
  .byte  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63  ;;  8 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$32  ;;  9 ;;
  .byte  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43  ;; 10 ;;
  .byte  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53  ;; 11 ;;
  .byte  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63  ;; 12 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$32  ;; 13 ;;
  .byte  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43  ;; 14 ;;
  .byte  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53  ;; 15 ;;
  .byte  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63  ;; 16 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$32  ;; 17 ;;
  .byte  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43  ;; 18 ;;
  .byte  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53  ;; 19 ;;
  .byte  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63  ;; 20 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$32  ;; 21 ;;
  .byte  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43  ;; 22 ;;
  .byte  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53  ;; 23 ;;
  .byte  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63  ;; 24 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$32  ;; 25 ;;
  .byte  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43  ;; 26 ;;
  .byte  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53,  $50,$51,$52,$53  ;; 27 ;;
  .byte  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63,  $60,$61,$62,$63  ;; 28 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$33,  $30,$31,$32,$32  ;; 29 ;;
  .byte  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43,  $40,$41,$42,$43  ;; 30 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;

bg_attr_passive:
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Death Screen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bg_tile_death:
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  1 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  2 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  3 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  4 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  5 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  6 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  7 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  8 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;;  9 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 10 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 11 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 12 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 13 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 14 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 15 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 16 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 17 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 18 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 19 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 20 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 21 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 22 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 23 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,_G_,  _A_,_M_,_E_,___,  ___,_O_,_V_,_E_,  _R_,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 24 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 25 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 26 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 27 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 28 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 29 ;;
  .byte  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___,  ___,___,___,___  ;; 30 ;;
;;         1   2   3   4     5   6   7   8     9  10  11  12    13  14  15  16    17  18  19  20    21  22  23  24    25  26  27  28    29  30  31  32  ;;    ;;

bg_attr_death:
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000
  .byte        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000,        %00000000


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SPRITES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Icon
sprite_icon:
  .byte $FF, $00, %00000000, $FF
  .byte $FF, $01, %00000000, $FF
  .byte $FF, $10, %00000000, $FF
  .byte $FF, $11, %00000000, $FF

;; Monster
sprite_monster:
  .byte $FF, $08, %00000001, $FF
  .byte $FF, $09, %00000001, $FF
  .byte $FF, $18, %00000001, $FF
  .byte $FF, $19, %00000001, $FF

ResetSound_Clear:
  .byte $30, $08, $00, $00
  .byte $30, $08, $00, $00
  .byte $80, $00, $00, $00
  .byte $30, $00, $00, $00
  .byte $00, $00, $00, $00

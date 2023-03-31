;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TrackVariableStoreY
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Used to track and detect the changes made to a variable.
;; Requires two variables, the variable tracked and a variable
;; to store a copy of the tracked variable in, and a branch.
;;
;; When there is no change, execution will branch preventing any
;; code designed to handle variable change from running.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.macro TrackVariableStoreY Variable, VariableStoreLast, BranchNoChange
  LDY Variable
  CPY VariableStoreLast
  BEQ BranchNoChange
    STY VariableStoreLast
.endmacro

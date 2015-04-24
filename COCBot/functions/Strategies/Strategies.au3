; Just need a single line for each attack strategy plugin
; Leave Standard at top!
#include "Standard\Functions.au3"
; New plugins below here.
#include "Dummy\Functions.au3"

; Add Tab info to combobox
GUICtrlSetData($cmbAttackStrat, $StratComboText, "")
_GUICtrlComboBox_SetCurSel($cmbAttackStrat,0)

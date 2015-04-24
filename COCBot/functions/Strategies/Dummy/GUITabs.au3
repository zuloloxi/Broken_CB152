GUISwitch($frmAttackConfig)
; Line above required

; Name your strategy
$StratComboText = $StratComboText & "|Just a blank Dummy Plugin"
; List the number of tabs you are using
$StratTabs = $StratTabs & "|" & "2"

$pageDummy1 = GUICtrlCreateTabItem("A blank tab")

$pageDummy2 = GUICtrlCreateTabItem("Another")

; Line below required
GUICtrlCreateTabItem("")

;Compares the searched values to the minimum values, returns false if doesn't meet.
;Every 30 searches, it will decrease minimum by certain amounts.

Func CompareResources() ;Compares resources and returns true if conditions meet, otherwise returns false
	Local $conditionlogstr
	$NukeAttack=False
	If $SearchCount <> 0 And Mod($SearchCount, 30) = 0 Then
		If $MinDeadGold - 5000 >= 0 Then $MinDeadGold -= 5000
		If $MinDeadElixir - 5000 >= 0 Then $MinDeadElixir -= 5000
		If $MinDeadDark - 100 >= 0 Then $MinDeadDark -= 100
		If $MinDeadTrophy - 2 >= 0 Then $MinDeadTrophy -= 2
		If $MinGold - 5000 >= 0 Then $MinGold -= 5000
		If $MinElixir - 5000 >= 0 Then $MinElixir -= 5000
		If $MinDark - 100 >= 0 Then $MinDark -= 100
		If $MinTrophy - 2 >= 0 Then $MinTrophy -= 2
		If $iNukeLimit - 300 >= 0 Then $iNukeLimit -= 100
		SetLog("Search Condition:", $COLOR_RED)
		If GUICtrlRead($chkDeadActivate) = $GUI_CHECKED And $fullArmy Then
			$conditionlogstr = "Dead Base ("
			If GUICtrlRead($chkDeadGE) = $GUI_CHECKED Then
				If _GUICtrlComboBox_GetCurSel($cmbDead) = 0 Then
					$conditionlogstr = $conditionlogstr & " Gold: " & $MinDeadGold & " And " & "Elixir: " & $MinDeadElixir
				Else
					$conditionlogstr = $conditionlogstr & " Gold: " & $MinDeadGold & " Or " & "Elixir: " & $MinDeadElixir
				EndIf
			EndIf
			If GUICtrlRead($chkDeadMeetDE) = $GUI_CHECKED Then
				If $conditionlogstr <> "Dead Base (" Then
					$conditionlogstr = $conditionlogstr & ";"
				EndIf
				$conditionlogstr = $conditionlogstr & " Dark: " & $MinDeadDark
			EndIf
			If GUICtrlRead($chkDeadMeetTrophy) = $GUI_CHECKED Then
				If $conditionlogstr <> "Dead Base (" Then
					$conditionlogstr = $conditionlogstr & ";"
				EndIf
				$conditionlogstr = $conditionlogstr & " Trophy: " & $MinDeadTrophy
			EndIf
			If GUICtrlRead($chkDeadMeetTH) = $GUI_CHECKED Then
				If $conditionlogstr <> "Dead Base (" Then
					$conditionlogstr = $conditionlogstr & ";"
				EndIf
				$conditionlogstr = $conditionlogstr & " Max Townhall: " & $MaxDeadTH
			EndIf
			If GUICtrlRead($chkDeadMeetTHO) = $GUI_CHECKED Then
				If $conditionlogstr <> "Dead Base (" Then
					$conditionlogstr = $conditionlogstr & ";"
				EndIf
				$conditionlogstr = $conditionlogstr & " Townhall Outside"
			EndIf
			$conditionlogstr = $conditionlogstr & " )"
			SetLog($conditionlogstr, $COLOR_GREEN)
		EndIf
		If GUICtrlRead($chkAnyActivate) = $GUI_CHECKED And $fullArmy Then
			$conditionlogstr = "Live Base ("
			If GUICtrlRead($chkMeetGE) = $GUI_CHECKED Then
				If _GUICtrlComboBox_GetCurSel($cmbDead) = 0 Then
					$conditionlogstr = $conditionlogstr & " Gold: " & $MinGold & " And " & "Elixir: " & $MinElixir
				Else
					$conditionlogstr = $conditionlogstr & " Gold: " & $MinGold & " Or " & "Elixir: " & $MinElixir
				EndIf
			EndIf
			If GUICtrlRead($chkMeetDE) = $GUI_CHECKED Then
				If $conditionlogstr <> "Live Base (" Then
					$conditionlogstr = $conditionlogstr & ";"
				EndIf
				$conditionlogstr = $conditionlogstr & " Dark: " & $MinDark
			EndIf
			If GUICtrlRead($chkMeetTrophy) = $GUI_CHECKED Then
				If $conditionlogstr <> "Live Base (" Then
					$conditionlogstr = $conditionlogstr & ";"
				EndIf
				$conditionlogstr = $conditionlogstr & " Trophy: " & $MinTrophy
			EndIf
			If GUICtrlRead($chkMeetTH) = $GUI_CHECKED Then
				If $conditionlogstr <> "Live Base (" Then
					$conditionlogstr = $conditionlogstr & ";"
				EndIf
				$conditionlogstr = $conditionlogstr & " Max Townhall: " & $MaxTH
			EndIf
			If GUICtrlRead($chkMeetTHO) = $GUI_CHECKED Then
				If $conditionlogstr <> "Live Base (" Then
					$conditionlogstr = $conditionlogstr & ";"
				EndIf
				$conditionlogstr = $conditionlogstr & " Townhall Outside"
			EndIf
			$conditionlogstr = $conditionlogstr & " )"
			SetLog($conditionlogstr, $COLOR_GREEN)
		EndIf
		If GUICtrlRead($chkNukeOnly) = $GUI_CHECKED And $fullSpellFactory And $iNukeLimit > 0 Then
			$conditionlogstr = "Zap Base ( Dark: " & $iNukeLimit & " )"
			SetLog($conditionlogstr, $COLOR_GREEN)
		EndIf
	EndIf

	Local $DG = (Number($searchGold) >= Number($MinDeadGold)), $DE = (Number($searchElixir) >= Number($MinDeadElixir)), $DD = (Number($searchDark) >= Number($MinDeadDark)), $DT = (Number($searchTrophy) >= Number($MinDeadTrophy))
	Local $G = (Number($searchGold) >= Number($MinGold)), $E = (Number($searchElixir) >= Number($MinElixir)), $D = (Number($searchDark) >= Number($MinDark)), $T = (Number($searchTrophy) >= Number($MinTrophy))
	Local $THL = -1, $THLO = -1

	For $i = 0 To 4
		If $searchTH = $THText[$i] Then $THL = $i
	Next

	Switch $THLoc
		Case "In"
			$THLO = 0
		Case "Out"
			$THLO = 1
	EndSwitch

	If $THLoc = "Out" And (GUICtrlRead($chkDeadActivate) = $GUI_CHECKED) And ($chkConditions[10] = 1 And $searchDead) Then
		SetLog("~~~~~~~Outside Townhall in Dead Base Found!~~~~~~~", $COLOR_PURPLE)
		Return True
	ElseIf $THLoc = "Out" And (GUICtrlRead($chkAnyActivate) = $GUI_CHECKED) And ($chkConditions[11] = 1 And Not ($searchDead)) Then
		SetLog("~~~~~~~Outside Townhall in Live Base Found!~~~~~~~", $COLOR_PURPLE)
		Return True
	EndIf

	; Variables to check whether to attack dead bases
	Local $conditionDeadPass = True

	If GUICtrlRead($chkDeadActivate) = $GUI_CHECKED  And $fullArmy Then
		If GUICtrlRead($chkDeadGE) = $GUI_CHECKED Then
			$deadEnabled = True
			If $icmbDead = 0 Then ; And
				If $DG = False Or $DE = False Then $conditionDeadPass = False
			Else ; Or
				If $DG = False And $DE = False Then $conditionDeadPass = False
			EndIf
		EndIf

		If GUICtrlRead($chkDeadMeetDE) = $GUI_CHECKED Then
			If $DD = False Then $conditionDeadPass = False
		EndIf

		If GUICtrlRead($chkDeadMeetTrophy) = $GUI_CHECKED Then
			If $DT = False Then $conditionDeadPass = False
		EndIf

		If GUICtrlRead($chkDeadMeetTH) = $GUI_CHECKED Then
			If $THL = -1 Or $THL > _GUICtrlComboBox_GetCurSel($cmbDeadTH) Then $conditionDeadPass = False
		EndIf

		If GUICtrlRead($chkDeadMeetTHO) = $GUI_CHECKED Then
			If $THLO <> 1 Then $conditionDeadPass = False
		EndIf

		If $searchdead And $conditionDeadPass Then
			SetLog("~~~~~~~Dead Base Found!~~~~~~~", $COLOR_GREEN)
			Return True
		EndIf
	EndIf

	; Variables to check whether to attack non-dead bases
	Local $conditionAnyPass = True

	If (GUICtrlRead($chkAnyActivate) = $GUI_CHECKED)  And $fullArmy Then
		If GUICtrlRead($chkMeetGE) = $GUI_CHECKED Then
			$anyEnabled = True
			If $icmbAny = 0 Then ; And
				If $G = False Or $E = False Then $conditionAnyPass = False
			Else ; Or
				If $G = False And $E = False Then $conditionAnyPass = False
			EndIf
		EndIf

		If GUICtrlRead($chkMeetDE) = $GUI_CHECKED Then
			If $D = False Then $conditionAnyPass = False
		EndIf

		If GUICtrlRead($chkMeetTrophy) = $GUI_CHECKED Then
			If $T = False Then $conditionAnyPass = False
		EndIf

		If GUICtrlRead($chkMeetTH) = $GUI_CHECKED Then
			If $THL = -1 Or $THL > _GUICtrlComboBox_GetCurSel($cmbTH) Then $conditionAnyPass = False
		EndIf

		If GUICtrlRead($chkMeetTHO) = $GUI_CHECKED Then
			If $THLO <> 1 Then $conditionAnyPass = False
		EndIf

		If $conditionAnyPass Then
			SetLog("~~~~~~~Other Base Found!~~~~~~~", $COLOR_GREEN)
			Return True
		EndIf
	EndIf

	; Variables to check whether to zap Dark elixir
	If GUICtrlRead($chkNukeOnly) = $GUI_CHECKED And $fullSpellFactory And $iNukeLimit > 0 Then
		If Number($searchDark) >= Number($iNukeLimit) Then
			If checkDarkElix() Then
				$NukeAttack=True
				SetLog("~~~~~~~Base to Zap Found!~~~~~~~", $COLOR_GREEN)
				Return True
			Else
				Return False
			EndIf
		EndIf
	EndIf

EndFunc   ;==>CompareResources

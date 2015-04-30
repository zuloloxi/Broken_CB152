Func CheckArmyCamp()
	SetLog("Checking Army Camp...", $COLOR_BLUE)

	If _Sleep(100) Then Return

	ClickP($TopLeftClient) ;Click Away

	If $ArmyPos[0] = "" Then
		LocateCamp()
		SaveConfig()
	Else
		If _Sleep(1000) Then Return
		Click($ArmyPos[0], $ArmyPos[1]) ;Click Army Camp
	EndIf

	_CaptureRegion()
	If _Sleep(1000) Then Return
	Local $BArmyPos = _PixelSearch(309, 581, 433, 583, Hex(0x4084B8, 6), 5) ;Finds Info button
	If IsArray($BArmyPos) = False Then
		SetLog("Your Army Camp is not available", $COLOR_RED)
	Else
		Click($BArmyPos[0], $BArmyPos[1]) ;Click Info button
		If _Sleep(2000) Then Return

		_CaptureRegion()
		Switch $icmbRaidcap
			Case 0 ; 10%
				Local $Campbar = _PixelSearch(454, 210, 456, 213, Hex(0x37A800, 6), 5)
			Case 1 ; 20%
				Local $Campbar = _PixelSearch(482, 210, 484, 213, Hex(0x37A800, 6), 5)
			Case 2 ; 30%
				Local $Campbar = _PixelSearch(510, 210, 512, 213, Hex(0x37A800, 6), 5)
			Case 3 ; 40%
				Local $Campbar = _PixelSearch(538, 210, 540, 213, Hex(0x37A800, 6), 5)
			Case 4 ; 50%
				Local $Campbar = _PixelSearch(566, 210, 568, 213, Hex(0x37A800, 6), 5)
			Case 5 ; 60%
				Local $Campbar = _PixelSearch(595, 210, 597, 213, Hex(0x37A800, 6), 5)
			Case 6 ; 70%
				Local $Campbar = _PixelSearch(623, 210, 625, 213, Hex(0x37A800, 6), 5)
			Case 7 ; 80%
				Local $Campbar = _PixelSearch(651, 210, 653, 213, Hex(0x37A800, 6), 5)
			Case 8 ; 90%
				Local $Campbar = _PixelSearch(679, 210, 681, 213, Hex(0x37A800, 6), 5)
			Case 9 ; 100%
				Local $Campbar = _PixelSearch(707, 210, 709, 213, Hex(0x37A800, 6), 5)
		EndSwitch
		$CurCamp = Number(getOther(586, 193, "Camp"))
		If $CurCamp > 0 Then
			SetLog("Total Troop Capacity: " & $CurCamp & "/" & $itxtcampCap, $COLOR_GREEN)
		EndIf
		If $CurCamp >= ($itxtcampCap * (GUICtrlRead($cmbRaidcap) / 100)) Or IsArray($Campbar) = True Then
			$fullArmy = True
		Else
			_CaptureRegion()
			If $FirstStart Then
				$ArmyComp = 0
				$CurGiant = 0
				$CurWB = 0
				$CurArch = 0
				$CurBarb = 0
				$CurGoblin = 0
			EndIf
			For $i = 0 To 6
				Local $TroopKind = _GetPixelColor(230 + 71 * $i, 359)
				Local $TroopKind2 = _GetPixelColor(230 + 71 * $i, 385)
				Local $TroopName = 0
				Local $TroopQ = getOther(229 + 71 * $i, 413, "Camp")
				If _ColorCheck($TroopKind, Hex(0xF85CCB, 6), 20) Then
					If ($CurArch = 0 And $FirstStart) Then $CurArch -= $TroopQ
					$TroopName = "Archers"
				ElseIf _ColorCheck($TroopKind, Hex(0xF8E439, 6), 20) Then
					If ($CurBarb = 0 And $FirstStart) Then $CurBarb -= $TroopQ
					$TroopName = "Barbarians"
				ElseIf _ColorCheck($TroopKind, Hex(0xF8D198, 6), 20) Then
					If ($CurGiant = 0 And $FirstStart) Then $CurGiant -= $TroopQ
					$TroopName = "Giants"
				ElseIf _ColorCheck($TroopKind, Hex(0x93EC60, 6), 20) Then
					If ($CurGoblin = 0 And $FirstStart) Then $CurGoblin -= $TroopQ
					$TroopName = "Goblins"
				ElseIf _ColorCheck($TroopKind, Hex(0x48A8E8, 6), 20) Then
					If ($CurWB = 0 And $FirstStart) Then $CurWB -= $TroopQ
					$TroopName = "Wallbreakers"
				ElseIf _ColorCheck($TroopKind, Hex(0x131D38, 6), 20) Then
					   If ($FirstStart) Then $CurMinion -= $TroopQ
					   $TroopName = "Minions"

					   ElseIf _ColorCheck($TroopKind, Hex(0xB87469, 6), 20) Then
						If ($FirstStart) Then $CurWiz -= $TroopQ
						$TroopName = "Wizards"

				ElseIf _ColorCheck($TroopKind2, Hex(0x212018, 6), 20) Then
					If ($FirstStart) Then $CurHog -= $TroopQ
					$TroopName = "Hogs"
				ElseIf _ColorCheck($TroopKind, Hex(0x983B08, 6), 20) Then
					If ($FirstStart) Then $CurValkyrie -= $TroopQ
					$TroopName = "Valkyries"
				EndIf
				If $TroopQ <> 0 Then SetLog("- " & $TroopName & " " & $TroopQ, $COLOR_GREEN)
			Next
		EndIf
		ClickP($TopLeftClient) ;Click Away
		$FirstCampView = True
	EndIf
EndFunc   ;==>CheckArmyCamp

;Uses the location of manually set Barracks to train specified troops

; Train the troops (Fill the barracks)

Func GetTrainPos($troopKind)
	Switch $troopKind
		Case $eBarbarian ; 261, 366: 0x39D8E0
			Return $TrainBarbarian
		Case $eArcher ; 369, 366: 0x39D8E0
			Return $TrainArcher
		Case $eGiant ; 475, 366: 0x3DD8E0
			Return $TrainGiant
		Case $eGoblin ; 581, 366: 0x39D8E0
			Return $TrainGoblin
		Case $eWallbreaker ; 688, 366, 0x3AD8E0
			Return $TrainWallbreaker
		Case $eMinion
			Return $TrainMinion
		Case $eHog
			Return $TrainHog
		Case $eValkyrie
			Return $TrainValkyrie
		Case Else
			SetLog("Don't know how to train the troop " & $troopKind & " yet")
			Return 0
	EndSwitch
EndFunc   ;==>GetTrainPos

Func TrainIt($troopKind, $howMuch = 1, $iSleep = 100)
	_CaptureRegion()
	Local $pos = GetTrainPos($troopKind)
	If IsArray($pos) Then
		If CheckPixel($pos) Then
			ClickP($pos, $howMuch, 20)
			If _Sleep($iSleep) Then Return False
			Return True
		EndIf
	EndIf
EndFunc   ;==>TrainIt

Func Train()
	resetBarracksError()
	If $fullArmy Then
		SetLog("Army Camp Full : " & $fullArmy, $COLOR_RED)
	EndIf

	If $barrackPos[0][0] = "" Then
		LocateBarrack()
		SaveConfig()
		If _Sleep(2000) Then Return
	EndIf

	SetLog("Training Troops...", $COLOR_BLUE)

	If $fullArmy Then ; reset all for cook again on startup
		$ArmyComp = 0
		$CurGiant = 0
		$CurWB = 0
		$CurArch = 0
		$CurBarb = 0
		$CurGoblin = 0
	EndIf

	If (($ArmyComp = 0) And (_GUICtrlComboBox_GetCurSel($cmbTroopComp) <> 8)) Or $FixTrain Then
		If $FixTrain or $FirstStart and Not $fullArmy Then $ArmyComp = $CurCamp
		$FixTrain = False
		$CurGiant += GUICtrlRead($txtNumGiants)
		$CurWB += GUICtrlRead($txtNumWallbreakers)
		$CurArch += Floor((($itxtcampCap * GUICtrlRead($cmbRaidcap) / 100) - (GUICtrlRead($txtNumGiants) * 5) - (GUICtrlRead($txtNumWallbreakers) * 2)) * (GUICtrlRead($txtArchers) / 100))
		$CurBarb += Floor((($itxtcampCap * GUICtrlRead($cmbRaidcap) / 100) - (GUICtrlRead($txtNumGiants) * 5) - (GUICtrlRead($txtNumWallbreakers) * 2)) * (GUICtrlRead($txtBarbarians) / 100))
		$CurGoblin += Floor((($itxtcampCap * GUICtrlRead($cmbRaidcap) / 100) - (GUICtrlRead($txtNumGiants) * 5) - (GUICtrlRead($txtNumWallbreakers) * 2)) * (GUICtrlRead($txtGoblins) / 100))
		If $CurArch < 0 Then $CurArch = 0
		If $CurBarb < 0 Then $CurBarb = 0
		If $CurGoblin < 0 Then $CurGoblin = 0
		If $CurWB < 0 Then $CurWB = 0
		If $CurGiant < 0 Then $CurGiant = 0
		If ($CurArch + $CurBarb + $CurGoblin + (5 * $CurGiant) + (2 * $CurWB)) < $itxtcampCap Then
			If $CurArch > 0 Then
				$CurArch += 1
			EndIf
			If ($CurArch + $CurBarb + $CurGoblin + (5 * $CurGiant) + (2 * $CurWB)) < $itxtcampCap Then
				If $CurBarb > 0 Then
					$CurBarb += 1
				EndIf
				If ($CurArch + $CurBarb + $CurGoblin + (5 * $CurGiant) + (2 * $CurWB)) < $itxtcampCap Then
					If $CurGoblin > 0 Then
						$CurGoblin += 1
					EndIf
				EndIf
			EndIf
		EndIf
		SetLog("Forces needed: B-" & $CurBarb & ", A-" & $CurArch & ", Go-" & $CurGoblin & ", Gi-" & $CurGiant & ", W-" & $CurWB, $COLOR_GREEN)
	EndIf

	Local $GiantEBarrack ,$WallEBarrack ,$ArchEBarrack ,$BarbEBarrack ,$GoblinEBarrack
	$GiantEBarrack = Floor($CurGiant/4)
	$WallEBarrack = Floor($CurWB/4)
	$ArchEBarrack = Floor($CurArch/4)
	$BarbEBarrack = Floor($CurBarb/4)
	$GoblinEBarrack = Floor($CurGoblin/4)

	Local $troopFirstGiant,$troopSecondGiant,$troopFirstWall,$troopSecondWall,$troopFirstGoblin,$troopSecondGoblin,$troopFirstBarba,$troopSecondBarba,$troopFirstArch,$troopSecondArch
	$troopFirstGiant = 0
	$troopSecondGiant = 0
	$troopFirstWall = 0
	$troopSecondWall = 0
	$troopFirstGoblin = 0
	$troopSecondGoblin = 0
	$troopFirstBarba = 0
	$troopSecondBarba = 0
	$troopFirstArch = 0
	$troopSecondArch = 0

	For $i = 0 To 3
		If _Sleep(500) Then ExitLoop

		ClickP($TopLeftClient) ;Click Away

		If _Sleep(500) Then ExitLoop

		Click($barrackPos[$i][0], $barrackPos[$i][1]) ;Click Barrack
		If _Sleep(500) Then ExitLoop

		Local $TrainPos = _PixelSearch(155, 603, 694, 605, Hex(0x603818, 6), 5) ;Finds Train Troops button
		If IsArray($TrainPos) = False Then
            SetLog("Barrack " & $i + 1 & " is not available", $COLOR_RED)
            handleBarracksError($i)
            If _Sleep(500) Then ExitLoop
        Else
			Click($TrainPos[0], $TrainPos[1]) ;Click Train Troops button
			;SetLog("Barrack " & $i + 1 & " ...", $COLOR_GREEN)
			If _Sleep(1000) Then ExitLoop

			If _GUICtrlComboBox_GetCurSel($cmbTroopComp) = 8 Then
				_CaptureRegion()
				Switch $barrackTroop[$i]
					Case 0
						While _ColorCheck(_GetPixelColor(220, 320), Hex(0xF89683, 6), 20)
							Click(220, 320, 75) ;Barbarian
							If _Sleep(150) Then ExitLoop
							_CaptureRegion()
						WEnd
					Case 1
						While _ColorCheck(_GetPixelColor(325, 330), Hex(0xF8C3B0, 6), 20)
							Click(325, 320, 75) ;Archer
							If _Sleep(150) Then ExitLoop
							_CaptureRegion()
						WEnd
					Case 2
						While _ColorCheck(_GetPixelColor(430, 320), Hex(0xE68358, 6), 20)
							Click(430, 320, 20) ;Giant
							If _Sleep(150) Then ExitLoop
							_CaptureRegion()
						WEnd
					Case 3
						While _ColorCheck(_GetPixelColor(535, 310), Hex(0x7AA440, 6), 20)
							Click(535, 320, 75) ;Goblin
							If _Sleep(150) Then ExitLoop
							_CaptureRegion()
						WEnd
					Case 4
						While _ColorCheck(_GetPixelColor(640, 290), Hex(0x5FC6D6, 6), 20)
							Click(640, 320, 20) ;Wall Breaker
							If _Sleep(150) Then ExitLoop
							_CaptureRegion()
						WEnd
					Case 5
						While _ColorCheck(_GetPixelColor(220, 410), Hex(0x58C0D8, 6), 20)
							Click(220, 425, 20) ;Balloon
							If _Sleep(150) Then ExitLoop
							_CaptureRegion()
						WEnd
					Case 6
						While _ColorCheck(_GetPixelColor(325, 425), Hex(0xA46052, 6), 20)
							Click(325, 425, 20) ;Wizard
							If _Sleep(150) Then ExitLoop
							_CaptureRegion()
						WEnd
					Case 7
						While _ColorCheck(_GetPixelColor(430, 425), Hex(0xEFBB96, 6), 20)
							Click(430, 425, 10) ;Healer
							If _Sleep(150) Then ExitLoop
							_CaptureRegion()
						WEnd
					Case 8
						While _ColorCheck(_GetPixelColor(535, 410), Hex(0x8B7CA8, 6), 20)
							Click(535, 425, 10) ;Dragon
							If _Sleep(150) Then ExitLoop
							_CaptureRegion()
						WEnd
					Case 9
						While _ColorCheck(_GetPixelColor(640, 410), Hex(0x7092AC, 6), 20)
							Click(640, 425, 10) ;PEKKA
							If _Sleep(150) Then ExitLoop
							_CaptureRegion()
						WEnd
					Case Else
						If _Sleep(50) Then ExitLoop
						_CaptureRegion()
				EndSwitch
			Else
			SetLog("====== Barrack " & $i + 1 & " : ======", $COLOR_BLUE)
			_CaptureRegion()
			;while _ColorCheck(_GetPixelColor(496, 200), Hex(0x880000, 6), 20) Then
			If $fullArmy Or $FirstStart Then
				Click(496, 190, 80,5)
			EndIf
			;wend

			If _Sleep(500) Then ExitLoop
			_CaptureRegion()
			If GUICtrlRead($txtNumGiants) <> "0" Then
				$troopFirstGiant = Number(getOther(171 + 107 * 2, 278, "Barrack"))
				If $troopFirstGiant = 0 Then
					$troopFirstGiant = Number(getOther(171 + 107 * 2, 278, "Barrack"))
				EndIf
			Endif

			If GUICtrlRead($txtNumWallbreakers) <> "0" Then
				$troopFirstWall = Number(getOther(171 + 107 * 4, 278, "Barrack"))
				If $troopFirstWall = 0 Then
					$troopFirstWall = Number(getOther(171 + 107 * 4, 278, "Barrack"))
				EndIf
			EndIf

			If GUICtrlRead($txtGoblins) <> "0" Then
				$troopFirstGoblin = Number(getOther(171 + 107 * 3, 278, "Barrack"))
				If $troopFirstGoblin = 0 Then
					$troopFirstGoblin = Number(getOther(171 + 107 * 3, 278, "Barrack"))
				EndIf
			EndIf

			If GUICtrlRead($txtBarbarians) <> "0" Then
				$troopFirstBarba = Number(getOther(171 + 107 * 0, 278, "Barrack"))
				If $troopFirstBarba = 0 Then
					$troopFirstBarba = Number(getOther(171 + 107 * 0, 278, "Barrack"))
				EndIf
			EndIf

			If GUICtrlRead($txtArchers) <> "0" Then
				$troopFirstArch = Number(getOther(171 + 107 * 1, 278, "Barrack"))
				If $troopFirstArch = 0 Then
					$troopFirstArch = Number(getOther(171 + 107 * 1, 278, "Barrack"))
				EndIf
			Endif

			If GUICtrlRead($txtArchers) <> "0" And $CurArch > 0 Then
				;If _ColorCheck(_GetPixelColor(261, 366), Hex(0x39D8E0, 6), 20) And $CurArch > 0 Then
				If $CurArch > 0  Then
					If $ArchEBarrack = 0 Then
						TrainIt($eArcher, 1)
					ElseIf $ArchEBarrack >= $CurArch Then
						TrainIt($eArcher, $CurArch)
					Else
						TrainIt($eArcher, $ArchEBarrack)
					EndIf
				EndIf
			EndIf

			If GUICtrlRead($txtNumGiants) <> "0" And $CurGiant > 0 Then
				;If _ColorCheck(_GetPixelColor(475, 366), Hex(0x3DD8E0, 6), 20) And $CurGiant > 0 Then
				If $CurGiant > 0 Then
					If $GiantEBarrack = 0 Then
						TrainIt($eGiant, 1)
					ElseIf $GiantEBarrack >= $CurGiant Or $GiantEBarrack = 0  Then
						TrainIt($eGiant, $CurGiant)
					Else
						TrainIt($eGiant, $GiantEBarrack)
					EndIf
				EndIf
			EndIf


			If GUICtrlRead($txtNumWallbreakers) <> "0" And $CurWB > 0 Then
				;If _ColorCheck(_GetPixelColor(688, 366), Hex(0x3AD8E0, 6), 20) And $CurWB > 0  Then
				If $CurWB > 0  Then
					If $WallEBarrack = 0 Then
						TrainIt($eWallbreaker, 1)
					ElseIf $WallEBarrack >= $CurWB Or $WallEBarrack = 0  Then
						TrainIt($eWallbreaker, $CurWB)
					Else
						TrainIt($eWallbreaker, $WallEBarrack)
					EndIf
				EndIf
			EndIf


			If GUICtrlRead($txtBarbarians) <> "0" And $CurBarb > 0 Then
				;If _ColorCheck(_GetPixelColor(369, 366), Hex(0x39D8E0, 6), 20) And $CurBarb > 0 Then
				If $CurBarb > 0  Then
					If $BarbEBarrack = 0 Then
						TrainIt($eBarbarian, 1)
					ElseIf $BarbEBarrack >= $CurBarb Or $BarbEBarrack = 0  Then
						TrainIt($eBarbarian, $CurBarb)
					Else
						TrainIt($eBarbarian, $BarbEBarrack)
					EndIf
				EndIf
			EndIf


			If GUICtrlRead($txtGoblins) <> "0" And $CurGoblin > 0 Then
				;If _ColorCheck(_GetPixelColor(261, 366), Hex(0x39D8E0, 6), 20) And $CurGoblin > 0 Then
				If $CurGoblin > 0  Then
					If $GoblinEBarrack = 0 Then
						TrainIt($eGoblin, 1)
					ElseIf $GoblinEBarrack >= $CurGoblin or $GoblinEBarrack = 0  Then
						TrainIt($eGoblin, $CurGoblin)
					Else
						TrainIt($eGoblin, $GoblinEBarrack)
					EndIf
				EndIf
			EndIf

			If _Sleep(900) Then ExitLoop
			_CaptureRegion()

			If GUICtrlRead($txtNumGiants) <> "0" Then
				$troopSecondGiant = Number(getOther(171 + 107 * 2, 278, "Barrack"))
				If $troopSecondGiant = 0 Then
					$troopSecondGiant = Number(getOther(171 + 107 * 2, 278, "Barrack"))
				EndIf
			EndIf

			If GUICtrlRead($txtNumWallbreakers) <> "0" Then
				$troopSecondWall = Number(getOther(171 + 107 * 4, 278, "Barrack"))
				If $troopSecondWall = 0 Then
					$troopSecondWall = Number(getOther(171 + 107 * 4, 278, "Barrack"))
				EndIf
			EndIf

			If GUICtrlRead($txtGoblins) <> "0" Then
				$troopSecondGoblin = Number(getOther(171 + 107 * 3, 278, "Barrack"))
				If $troopSecondGoblin = 0 Then
					$troopSecondGoblin = Number(getOther(171 + 107 * 3, 278, "Barrack"))
				EndIf
			EndIf

			If GUICtrlRead($txtBarbarians) <> "0" Then
				$troopSecondBarba = Number(getOther(171 + 107 * 0, 278, "Barrack"))
				If $troopSecondBarba = 0 Then
					$troopSecondBarba = Number(getOther(171 + 107 * 0, 278, "Barrack"))
				EndIf
			EndIf

			If GUICtrlRead($txtArchers) <> "0" Then
				$troopSecondArch = Number(getOther(171 + 107 * 1, 278, "Barrack"))
				If $troopSecondArch = 0 Then
					$troopSecondArch = Number(getOther(171 + 107 * 1, 278, "Barrack"))
				EndIf
			EndIf


			If $troopSecondGiant > $troopFirstGiant And GUICtrlRead($txtNumGiants) <> "0" Then
				$ArmyComp += ($troopSecondGiant - $troopFirstGiant)*5
				$CurGiant -= ($troopSecondGiant - $troopFirstGiant)
				SetLog("Barrack " & ($i+1) & " Training Giant : " & ($troopSecondGiant - $troopFirstGiant) , $COLOR_GREEN)
				SetLog("Giant Remaining : " & $CurGiant , $COLOR_BLUE)
			EndIf


			If $troopSecondWall > $troopFirstWall And GUICtrlRead($txtNumWallbreakers) <> "0" Then
				$ArmyComp += ($troopSecondWall - $troopFirstWall)*2
				$CurWB -= ($troopSecondWall - $troopFirstWall)
				SetLog("Barrack " & ($i+1) & " Training WallBreaker : " & ($troopSecondWall - $troopFirstWall) , $COLOR_GREEN)
				SetLog("WallBreaker Remaining : " & $CurWB , $COLOR_BLUE)
			EndIf

			If $troopSecondGoblin > $troopFirstGoblin And GUICtrlRead($txtGoblins) <> "0" Then
				$ArmyComp += ($troopSecondGoblin - $troopFirstGoblin)
				$CurGoblin -= ($troopSecondGoblin - $troopFirstGoblin)
				SetLog("Barrack " & ($i+1) & " Training Goblin : " & ($troopSecondGoblin - $troopFirstGoblin) , $COLOR_GREEN)
				SetLog("Goblin Remaining : " & $CurGoblin , $COLOR_BLUE)
			EndIf

			If $troopSecondBarba > $troopFirstBarba And GUICtrlRead($txtBarbarians) <> "0" Then
				$ArmyComp += ($troopSecondBarba - $troopFirstBarba)
				$CurBarb -= ($troopSecondBarba - $troopFirstBarba)
				SetLog("Barrack " & ($i+1) & " Training Barbarian : " & ($troopSecondBarba - $troopFirstBarba) , $COLOR_GREEN)
				SetLog("Barbarian Remaining : " & $CurBarb , $COLOR_BLUE)
			EndIf

			If $troopSecondArch > $troopFirstArch And GUICtrlRead($txtArchers) <> "0" Then
				$ArmyComp += ($troopSecondArch - $troopFirstArch)
				$CurArch -= ($troopSecondArch - $troopFirstArch)
				SetLog("Barrack " & ($i+1) & " Training Archer : " & ($troopSecondArch - $troopFirstArch) , $COLOR_GREEN)
				SetLog("Archer Remaining : " & $CurArch , $COLOR_BLUE)
			EndIf
			SetLog("Total Troops building : " & $ArmyComp , $COLOR_RED)
		EndIf
	EndIf
    If _Sleep(100) Then ExitLoop
	Click($TopLeftClient[0], $TopLeftClient[1], 2, 250); Click away twice with 250ms delay
Next
	If $brerror[0]= True And $brerror[1]= True And $brerror[2]= True And $brerror[3]= True Then
		resetBarracksError()
		$needzoomout = true
		SetLog("Restart Completed ...", $COLOR_RED)
	Else
		SetLog("Training Troops Complete...", $COLOR_BLUE)
	EndIf
    $FirstStart = False
 EndFunc   ;==>Train

;Searches for a village that until meets conditions

Func VillageSearch($TakeSS = 0) ;Control for searching a village that meets conditions
	Local $skippedVillages
	Local $conditionlogstr
	_WinAPI_EmptyWorkingSet(WinGetProcess($Title)) ; Reduce BlueStacks Memory Usage

	$hTimerClickNext = TimerInit() ;Next button already pressed before call here
	If _Sleep(1000) Then Return
	_CaptureRegion() ; Check Break Shield button again
	If _ColorCheck(_GetPixelColor(513, 416), Hex(0x5DAC10, 6), 50) Then
		Click(513, 416);Click Okay To Break Shield
	EndIf
	While 1
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
				If _GUICtrlComboBox_GetCurSel($cmbAny) = 0 Then
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
		GUICtrlSetData($lblresultsearchcost, GUICtrlRead($lblresultsearchcost) + $SearchCost)
		If $TakeSS = 1 Then SetLog("Will save all of the towns when searching", $COLOR_GREEN)
		$SearchCount = 0
		_BlockInputEx(3, "", "", $HWnD)
		While 1
			If _Sleep(1000) Then ExitLoop (2)
			GUICtrlSetState($btnAtkNow, $GUI_ENABLE)
			GetResources() ;Reads Resource Values

			If $Restart = True Then ExitLoop (2)

			If $TakeSS = 1 Then
				Local $Date = @MDAY & "." & @MON & "." & @YEAR
				Local $Time = @HOUR & "." & @MIN & "." & @SEC
				_CaptureRegion()
				_GDIPlus_ImageSaveToFile($hBitmap, @ScriptDir & "\AllTowns\" & $Date & " at " & $Time & ".png")
			EndIf


			; Attack instantly if Attack Now button pressed
			GUICtrlSetState($btnAtkNow, $GUI_DISABLE)
			If $AttackNow Then
				$AttackNow = False
				SetLog("~~~~~~~Attack Now Clicked!~~~~~~~", $COLOR_GREEN)
				ExitLoop
			EndIf

			If CompareResources() Then
				ExitLoop
			Else
				If $CommandStop = 0 Then Return
				_CaptureRegion()
				If _ColorCheck(_GetPixelColor(703, 520), Hex(0xD84400, 6), 20) Then
					Local $fDiffNow = TimerDiff($hTimerClickNext) - $fdiffReadGold  ;How long in attack prep mode
					if $fDiffNow < $speedBump + $icmbSearchsp * 1500 Then ; Wait accoridng to search speed + speedBump
						if _Sleep($speedBump + $icmbSearchsp * 1500 - $fDiffNow) Then ExitLoop (2)
					EndIf
					Click(750, 500) ;Click Next
					$hTimerClickNext = TimerInit()
					;Take time to do search
					If _Sleep(1000) Then ExitLoop (2)
					;$skippedVillages += 1
					GUICtrlSetData($lblresultvillagesskipped, GUICtrlRead($lblresultvillagesskipped) + 1)
					GUICtrlSetData($lblresultsearchcost, GUICtrlRead($lblresultsearchcost) + $SearchCost)
				ElseIf _ColorCheck(_GetPixelColor(71, 530), Hex(0xC00000, 6), 20) Then
					SetLog("Cannot locate Next button, try to return home...", $COLOR_RED)
					If $DebugMode = 1 Then _GDIPlus_ImageSaveToFile($hBitmap, $dirDebug & "NoNext-" & @HOUR & @MIN & @SEC & ".png")
					If $PushBulletEnabled = 1 Then
						_Push("Disconnected", "Your bot got disconnected while searching for enemy..")
					EndIf
					If _Sleep(500) Then Return
					ReturnHome(False, False) ;If End battle is available
					checkMainScreen()
					If _Sleep(1000) Then Return
					ZoomOut()
					If _Sleep(1000) Then Return
					checkMainScreen(False)
					If _Sleep(1000) Then Return
					PrepareSearch()
				Else
					SetLog("Cannot locate Next button & Surrender button, Restarting Bot", $COLOR_RED)
					If $DebugMode = 1 Then _GDIPlus_ImageSaveToFile($hBitmap, $dirDebug & "NoNextSurr-" & @HOUR & @MIN & @SEC & ".png")
					If $PushBulletEnabled = 1 Then
						_Push("Disconnected", "Your bot got disconnected while searching for enemy..")
					EndIf
					checkMainScreen()
					$Restart = True
					$DCattack = 1
					ExitLoop (2)
				EndIf
			EndIf
		WEnd
		GUICtrlSetData($lblresultvillagesattacked, GUICtrlRead($lblresultvillagesattacked) + 1)
		GUICtrlSetData($lblresultsearchcost, GUICtrlRead($lblresultsearchcost) + $SearchCost)
		If GUICtrlRead($chkAlertSearch) = $GUI_CHECKED Then
			TrayTip("Match Found!", "Gold: " & $searchGold & "; Elixir: " & $searchElixir & "; Dark: " & $searchDark & "; Trophy: " & $searchTrophy & "; Townhall: " & $searchTH & ", " & $THLoc, 0)
			If FileExists(@WindowsDir & "\media\Windows Exclamation.wav") Then
				SoundPlay(@WindowsDir & "\media\Windows Exclamation.wav", 1)
			Else
				SoundPlay(@WindowsDir & "\media\Festival\Windows Exclamation.wav", 1)
			EndIf
		EndIf
		If $PushBulletEnabled = 1 And $PushBulletmatchfound = 1 Then
			_Push("Match Found!", "[G]: " & _NumberFormat($searchGold) & "; [E]: " & _NumberFormat($searchElixir) & "; [D]: " & _NumberFormat($searchDark) & "; [T]: " & $searchTrophy & "; [TH Lvl]: " & $searchTH & ", Loc: " & $THLoc)
			SetLog("Push: Match Found", $COLOR_GREEN)
		EndIf
		SetLog("===============Searching Complete===============", $COLOR_BLUE)
		readConfig()
		_BlockInputEx(0, "", "", $HWnD)
		ExitLoop
	WEnd
EndFunc   ;==>VillageSearch
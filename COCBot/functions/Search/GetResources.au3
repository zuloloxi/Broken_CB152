;Uses the getGold,getElixir... functions and uses CompareResources until it meets conditions.
;Will wait ten seconds until getGold returns a value other than "", if longer than 10 seconds - calls checkNextButton
;-clicks next if checkNextButton returns true, otherwise will restart the bot.

Func GetResources() ;Reads resources
	While 1
		Local $i = 0
		Local $x = 0
		Local $txtDead = "Live"

		_CaptureRegion()
		While _ColorCheck(_GetPixelColor(35,70), Hex(0xF8F8AC, 6), 20) = False or _
			  _ColorCheck(_GetPixelColor(35,105), Hex(0xE052D6, 6), 20) = False or _
			  getGold(51, 66) = "" ; Loops until gold is readable, add check for gold & elixir icon to prevent false reading
			If _Sleep(500) Then ExitLoop (2)
			_CaptureRegion()
			$i += 1
			If $i >= 20 Then ; If gold cannot be read by 10 seconds
				If checkNextButton() And $x <= 20 Then ;Checks for Out of Sync or Connection Error during search
					If $DebugMode = 1 Then SetLog("Click Next Button, GetResources")
					Click(750, 500) ;Click Next
				$x += 1
				Else
					SetLog("Cannot locate Next button, Restarting Bot", $COLOR_RED)
					_CaptureRegion()
					Local $dummyX = 0
					Local $dummyY = 0
					If _ImageSearch(@ScriptDir & "\images\Client.bmp", 1, $dummyX, $dummyY, 50) = 1 Then
						If $dummyX > 290 and $dummyX < 310 and $dummyY > 325 and $dummyY < 340 Then
							$speedBump += 500
							If $speedBump > 5000 Then
								$speedBump=5000
								SetLog("Out of sync! Already searching slowly, not changing anything.", $COLOR_RED)
							Else
								SetLog("Out of sync! Slowing search speed by 0.5 secs.", $COLOR_RED)
							EndIf
						EndIf
					EndIf
					If _ImageSearch(@ScriptDir & "\images\Lost.bmp", 1, $dummyX, $dummyY, 50) = 1 Then
						If $dummyX > 320 and $dummyX < 350 and $dummyY > 330 and $dummyY < 350 Then
							$speedBump += 500
							If $speedBump > 5000 Then
								$speedBump=5000
								SetLog("Lost Connection! Already searching slowly, not changing anything.", $COLOR_RED)
							Else
								SetLog("Lost Connection! Slowing search speed by 0.5 secs.", $COLOR_RED)
							EndIf
						EndIf
					EndIf

					If $DebugMode = 1 Then
						_GDIPlus_ImageSaveToFile($hBitmap, $dirDebug & "NoNextRes-" & @HOUR & @MIN & @SEC & ".png")
					EndIf
					If $PushBulletEnabled = 1 Then
						_Push("Disconnected", "Your bot got disconnected while searching for enemy..")
					EndIf
					checkMainScreen()
					$Restart = True
					$DCattack = 1
					ExitLoop (2)
				EndIf
				$i = 0
			EndIf
		WEnd
		;Gold is readable, record time
		$fdiffReadGold = TimerDiff($hTimerClickNext)
		If _Sleep(300) Then ExitLoop (2)

		;do speedbump sleep smarter way, moved to VillageSearch.au3 before click next button with condition test
		;If _Sleep($speedBump) Then ExitLoop(2)

		$searchDead = checkDeadBase()
		$searchTH = checkTownhall()
		$searchGold = getGold(51, 66)
		$searchElixir = getElixir(51, 66 + 29)
		$searchTrophy = getTrophy(51, 66 + 90)

		If $searchDead Then $txtDead = "Dead"

		If $searchTrophy <> "" Then
			$searchDark = getDarkElixir(51, 66 + 57)
		Else
			$searchDark = 0
			$searchTrophy = getTrophy(51, 66 + 60)
		EndIf

		If $searchTH = "-" Then
			$THLoc = "-"
			$THquadrant = "-"
			$THx = 0
			$THy = 0
		Else
			$THquadrant = 0
			If $WideEdge = 1 Then
				If ((((85 - 389) / (528 - 131)) * ($THx - 131)) + 389 > $THy) Then
					$THquadrant = 1
				ElseIf ((((237 - 538) / (723 - 337)) * ($THx - 337)) + 538 > $THy) Then
					$THquadrant = 4
				Else
					$THquadrant = 7
				EndIf
				If ((((388 - 85) / (725 - 330)) * ($THx - 330)) + 85 > $THy) Then
					$THquadrant = $THquadrant + 2
				ElseIf ((((537 - 238) / (535 - 129)) * ($THx - 129)) + 238 > $THy) Then
					$THquadrant = $THquadrant + 1
				EndIf
			Else
				If ((((70 - 374) / (508 - 110)) * ($THx - 110)) + 374 > $THy) Then
					$THquadrant = 1
				ElseIf ((((252 - 552) / (742 - 358)) * ($THx - 358)) + 552 > $THy) Then
					$THquadrant = 4
				Else
					$THquadrant = 7
				EndIf
				If ((((373 - 70) / (744 - 350)) * ($THx - 350)) + 70 > $THy) Then
					$THquadrant = $THquadrant + 2
				ElseIf ((((552 - 253) / (516 - 108)) * ($THx - 108)) + 253 > $THy) Then
					$THquadrant = $THquadrant + 1
				EndIf
			EndIf
			If $THquadrant >= 1 And $THquadrant <= 4 Then $THLoc = "Out"
			If $THquadrant = 5 Then $THLoc = "In"
			If $THquadrant >= 6 And $THquadrant <= 9 Then $THLoc = "Out"
		EndIf

		$SearchCount += 1 ; Counter for number of searches
		SetLog("(" & $SearchCount & ") [G]: " & $searchGold & Tab($searchGold, 7) & "[E]: " & $searchElixir & Tab($searchElixir, 7) & "[D]: " & $searchDark & Tab($searchDark, 4) & "[T]: " & $searchTrophy & Tab($searchTrophy, 3) & "[TH]: " & $searchTH & (($searchTH <> "-") ? ("-Q" & $THquadrant) : ("")) & ", " & $THLoc & ", " & $txtDead, $COLOR_BLUE)
		ExitLoop
	WEnd
EndFunc   ;==>GetResources
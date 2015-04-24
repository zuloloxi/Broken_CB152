Func CheckFullSpellFactory()
	SetLog("Checking Spell Factory...", $COLOR_BLUE)

	If _Sleep(100) Then Return

	ClickP($TopLeftClient) ;Click Away

	If $SpellPos[0] = "" Then
		LocateSpellFactory()
		SaveConfig()
	Else
		If _Sleep(100) Then Return
		Click($SpellPos[0], $SpellPos[1]) ;Click Spell Factory
	EndIf

	If _Sleep(1000) Then Return ;Do a bit slower
	_CaptureRegion()
	Local $BSpellPos = _PixelSearch(214, 581, 368, 583, Hex(0x4084B8, 6), 5) ;Finds Info button
	If IsArray($BSpellPos) = False Then
		SetLog("Your Spell Factory is not available", $COLOR_RED)
		If $DebugMode = 2 Then _GDIPlus_ImageSaveToFile($hBitmap, $dirDebug & "SpellNA-" & @HOUR & @MIN & @SEC & ".png")
	EndIf
EndFunc   ;==>CheckSpellFactory
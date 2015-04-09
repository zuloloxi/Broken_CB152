

Func VillageReport()
	ClickP($TopLeftClient) ;Click Away
	If _Sleep(500) Then Return

	SetLog("Village Report", $COLOR_GREEN)

	$FreeBuilder = GetOther(324, 23, "Builder")
	Setlog("Num. of Free Builders: " & $FreeBuilder, $COLOR_GREEN)
	If $PushBulletEnabled = 1 And $PushBulletfreebuilder = 1 And $FreeBuilder > 0 And Not ($buildernotified) Then
		_Push("Free builder", "You have " & ($FreeBuilder = 1) ? ("a" : $FreeBuilder) & " builder" & ($FreeBuilder = 1) ? ("" : "s") & " available!")
		$buildernotified = True
		SetLog("Push: Free Builder", $COLOR_GREEN)
	Else
		$buildernotified = False
	EndIf

	$TrophyCountOld = GUICtrlRead($lblresulttrophynow)
	$TrophyCount = getOther(50, 74, "Trophy")

	If $FirstAttack = 1 Then
		GUICtrlSetData($lblresulttrophygain, $TrophyCount - $TrophyCountOld)
	EndIf

	SetLog("Opening Builder page to read Resources..", $COLOR_BLUE)
	Click(388, 30) ; Click Builder Button
	_CaptureRegion()
	Local $i = 0
	While _ColorCheck(_GetPixelColor(819, 39), Hex(0xF8FCFF, 6), 20) = False
		$i += 1
		If _Sleep(500) Then Return
		_CaptureRegion()
		If $i >= 20 Then ExitLoop
	WEnd
	If _ColorCheck(_GetPixelColor(318, 637), Hex(0xD854D0, 6), 20) Then
		$GoldCountOld = $GoldCount
		$ElixirCountOld = $ElixirCount
		$GoldCount = GetOther(356, 625, "Resource")
		$ElixirCount = GetOther(195, 625, "Resource")
		$GemCount = GetOther(543, 625, "Gems")
		SetLog("Resources: [G]: " & $GoldCount & " [E]: " & $ElixirCount & " [T]: " & $TrophyCount & " [GEM]: " & $GemCount, $COLOR_GREEN)
		If $FirstAttack = 1 Then
			$GoldGained += $GoldCount - $GoldCountOld
			$ElixirGained += $ElixirCount - $ElixirCountOld
			$TrophyGained += $TrophyCount - $TrophyCountOld
		EndIf
		If $PushBulletEnabled = 1 And $PushBulletvillagereport = 1 Then
			_Push("Village Report", "[G]: " & _NumberFormat($GoldCount) & " [E]: " & _NumberFormat($ElixirCount) & " [T]: " & $TrophyCount & " [GEM]: " & $GemCount & " [Attacked]: " & GUICtrlRead($lblresultvillagesattacked) & " [Skipped]: " & GUICtrlRead($lblresultvillagesskipped) & " [Wall Upgrade]: " & GUICtrlRead($lblwallupgradecount) & " [Run Time]: " & StringFormat("%02i:%02i:%02i", $hour, $min, $sec))
			SetLog("Push: Village Report", $COLOR_GREEN)
		EndIf
	Else
		$GoldCountOld = $GoldCount
		$ElixirCountOld = $ElixirCount
		$DarkCountOld = $DarkCount
		$GoldCount = GetOther(440, 625, "Resource")
		$ElixirCount = GetOther(282, 625, "Resource")
		$DarkCount = GetOther(125, 625, "Resource")
		$GemCount = GetOther(606, 625, "Gems")
		SetLog("Resources: [G]: " & $GoldCount & " [E]: " & $ElixirCount & " [D]: " & $DarkCount & " [T]: " & $TrophyCount & " [GEM]: " & $GemCount, $COLOR_GREEN)
		If $FirstAttack = 1 Then
			;$GoldGained += $GoldCount - $GoldCountOld
			;$ElixirGained += $ElixirCount - $ElixirCountOld
			;$DarkGained += $DarkCount - $DarkCountOld
			;$TrophyGained += $TrophyCount - $TrophyCountOld
			$GoldGained = $GoldCount - GUICtrlRead($lblresultgoldtstart)
			$ElixirGained = $ElixirCount - GUICtrlRead($lblresultelixirstart)
			$DarkGained = $DarkCount - GUICtrlRead($lblresultdestart)
			$TrophyGained = $TrophyCount - GUICtrlRead($lblresulttrophystart)
			If $PushBulletEnabled = 1 And $PushBulletvillagereport = 1 Then
				_Push("Village Report", "[G]: " & _NumberFormat($GoldCount) & " [E]: " & _NumberFormat($ElixirCount) & " [D]: " & _NumberFormat($DarkCount) & _
					" [T]: " & $TrophyCount & " [GEM]: " & $GemCount & " [Attacked]: " & GUICtrlRead($lblresultvillagesattacked) & _
					" [Skipped]: " & GUICtrlRead($lblresultvillagesskipped) & " [Wall Upgrade]: " & GUICtrlRead($lblwallupgradecount) & _
					" [Run Time]: " & StringFormat("%02i:%02i:%02i", $hour, $min, $sec))
				SetLog("Push: Village Report", $COLOR_GREEN)
			EndIf
		EndIf
		Click(820, 40) ; Close Builder/Shop
		If $FirstAttack = 0 Then
			GUICtrlSetData($lblresultgoldtstart, $GoldCount)
			GUICtrlSetData($lblresultelixirstart, $ElixirCount)
			GUICtrlSetData($lblresultdestart, $DarkCount)
			GUICtrlSetData($lblresulttrophystart, $TrophyCount)
		Else
			GUICtrlSetData($lblresultgoldgain, $GoldGained)
			GUICtrlSetData($lblresultelixirgain, $ElixirGained)
			GUICtrlSetData($lblresultdegain, $DarkGained)
			GUICtrlSetData($lblresulttrophygain, $TrophyGained)

			If $PushBulletEnabled = 1 And $Raid = 1 and $DCattack <> 1 Then  ;No report after bot disconnected
				If $PushBullettype = 1 Then
					If _Sleep(2000) Then Return
					_PushFile($FileName, "loots", "image/jpeg", "Last Raid", $FileName)
				EndIf
				if $PushBulletlastraid = 1 then
					_Push("Last Raid Report:", "Gain: \n[G]: " & _NumberFormat($GoldCount-$GoldCountold) & " [E]: " & _NumberFormat($ElixirCount-$ElixirCountOld) & _
						" [D]: " & _NumberFormat($DarkCount-$DarkCountOld) & " [T]: " & ($TrophyCount-$TrophyCountOld) & _
						"\nLoot: \n[G]: " & _NumberFormat($LastRaidGold) & " [E]: " & _NumberFormat($LastRaidElixir) & _
						" [D]: " & _NumberFormat($LastRaidDarkElixir) & " [T]: " & $LastRaidTrophy & _
						"\nVillage Report: \n[G]: " & _NumberFormat($GoldCount) & " [E]: " & _NumberFormat($ElixirCount) & _
						" [D]: " & _NumberFormat($DarkCount) & " [T]: " & $TrophyCount & " [GEM]: " & $GemCount & _
						" [Attacked]: " & GUICtrlRead($lblresultvillagesattacked) & " [Skipped]: " & GUICtrlRead($lblresultvillagesskipped) & _
						" [Wall Upgrade]: " & GUICtrlRead($lblwallupgradecount) )
					SetLog("Push: Last raid Report",$COLOR_GREEN)
				EndIf
				;$GoldGainedold = $GoldGained
				;$ElixirGainedOld = $ElixirGained
				;$DarkGainedOld = $DarkGained
				;$TrophyGainedOld = $TrophyGained
				$Raid = 0
			EndIf
		EndIf
	EndIf
	GUICtrlSetData($lblresultgoldnow, $GoldCount)
	GUICtrlSetData($lblresultelixirnow, $ElixirCount)
	GUICtrlSetData($lblresultdenow, $DarkCount)
	GUICtrlSetData($lblresulttrophynow, $TrophyCount)
	$FirstAttack = 1
EndFunc   ;==>VillageReport

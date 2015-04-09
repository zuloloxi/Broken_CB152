

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
			If $GoldCount >= $GoldCountOld Then
				$GoldGained += $GoldCount - $GoldCountOld
			EndIf
			If $ElixirCount >= $ElixirCountOld Then
				$ElixirGained += $ElixirCount - $ElixirCountOld
			EndIf
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
			$GoldGained += $GoldCount - $GoldCountOld
			$ElixirGained += $ElixirCount - $ElixirCountOld
			$DarkGained += $DarkCount - $DarkCountOld
			$TrophyGained += $TrophyCount - $TrophyCountOld
			If $PushBulletEnabled = 1 And $PushBulletvillagereport = 1 Then
				_Push("Village Report", "[G]: " & _NumberFormat($GoldCount) & " [E]: " & _NumberFormat($ElixirCount) & " [D]: " & _NumberFormat($DarkCount) & " [T]: " & $TrophyCount & " [GEM]: " & $GemCount & " [Attacked]: " & GUICtrlRead($lblresultvillagesattacked) & " [Skipped]: " & GUICtrlRead($lblresultvillagesskipped) & " [Wall Upgrade]: " & GUICtrlRead($lblwallupgradecount) & " [Run Time]: " & StringFormat("%02i:%02i:%02i", $hour, $min, $sec))
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

			If $PushBulletEnabled = 1 And $Raid = 1 Then
				If $PushBullettype = 1 Then
					If _Sleep(2000) Then Return
					_PushFile($FileName, "loots", "image/jpeg", "Last Raid", $FileName)
				EndIf
				if $PushBulletlastraid = 1 then
					_Push("Last Raid Report:", "Gain: \n[G]: " & _NumberFormat($GoldGained-$GoldGainedold) & " [E]: " & _NumberFormat($ElixirGained-$ElixirGainedOld) & _
						" [D]: " & _NumberFormat($DarkGained-$DarkGainedOld) & " [T]: " & ($TrophyGained-$TrophyGainedOld) & _
						"\nLoot: \n[G]: " & _NumberFormat($LastRaidGold) & " [E]: " & _NumberFormat($LastRaidElixir) & _
						" [D]: " & _NumberFormat($LastRaidDarkElixir) & " [T]: " & $LastRaidTrophy & _
						"\nVillage Report: \n[G]: " & _NumberFormat($GoldCount) & " [E]: " & _NumberFormat($ElixirCount) & _
						" [D]: " & _NumberFormat($DarkCount) & " [T]: " & $TrophyCount & " [GEM]: " & $GemCount & _
						" [Attacked]: " & GUICtrlRead($lblresultvillagesattacked) & " [Skipped]: " & GUICtrlRead($lblresultvillagesskipped))
					SetLog("Push: Last raid Report",$COLOR_GREEN)
				EndIf
				$GoldGainedold = $GoldGained
				$ElixirGainedOld = $ElixirGained
				$DarkGainedOld = $DarkGained
				$TrophyGainedOld = $TrophyGained
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

ScriptDir\COCBot\functions\Village\UpgradeWall.au3

Global $wallbuild
Global $walllowlevel

Func UpgradeWall ()
	If GUICtrlRead($chkWalls) <> $GUI_CHECKED Then
		; SetLog("Upgrade Wall option disabled, skipping upgrade ", $COLOR_RED)
		Return
	EndIf

	VillageReport()
	SetLog("Checking Upgrade Walls...")
	$itxtWallMinGold = GUICtrlRead($txtWallMinGold)
	$itxtWallMinElixir = GUICtrlRead($txtWallMinElixir)
	Local $MinWallGold = Number($GoldCount) > Number($itxtWallMinGold)
	Local $MinWallElixir = Number($ElixirCount) > Number($itxtWallMinElixir)

	If GUICtrlRead($UseGold) = $GUI_CHECKED Then
		$iUseStorage = 1
	ElseIf GUICtrlRead($UseElixir) = $GUI_CHECKED Then
		$iUseStorage = 2
	ElseIf GUICtrlRead($UseGoldElix) = $GUI_CHECKED Then
		$iUseStorage = 3
	EndIf

	Switch $iUseStorage
		Case 1
			if $MinWallGold Then
				SetLog("Upgrading walls using Gold", $COLOR_BLUE)
				UpgradeWallGold()
				Return True
			Else
				SetLog("Gold is lower than Minimum setting, skipping ugrade", $COLOR_RED)
			EndIf
		Case 2
			If $MinWallElixir Then
				Setlog ("Upgrading walls using Elixir", $COLOR_BLUE)
				UpgradeWallElix()
				Return True
			Else
				Setlog ("Elixir is lower than Minimum setting, skipping ugrade", $COLOR_BLUE)
			Endif
		Case 3
			If $MinWallGold Then
				SetLog("Upgrading walls using Gold", $COLOR_BLUE)
				UpgradeWallGold()
				If $wallbuild = 0 Then
					If $walllowlevel = 0 Then
						SetLog("Upgrade with Gold failed, trying upgrade using Elixir", $COLOR_BLUE)
						UpgradeWallElix()
					Else
						SetLog("Wall level lower than 8, skipping upgrade with Elixir", $COLOR_BLUE)
					EndIf
				EndIf
			Else
				SetLog("Gold is lower than Minimum setting, trying upgrade walls using Elixir", $COLOR_RED)
				If $MinWallElixir Then
					UpgradeWallElix()
				Else
					Setlog ("Elixir is lower than Minimum setting, skipping ugrade", $COLOR_BLUE)
				EndIf
			EndIf
	EndSwitch
EndFunc


Func UpgradeWallelix()
	If $FreeBuilder = 0 Then
		SetLog("No builders available", $COLOR_RED)
		Click(1, 1) ; Click Away
		Return
	EndIf

	checkWall()
	If $checkwalllogic = True Then
		Click(1, 1) ; Click Away
		_Sleep(600)
		Click($WallX, $WallY)
		_Sleep(600)
		_CaptureRegion()
		If _ColorCheck(_GetPixelColor(596, 570), Hex(0xFFFFFF, 6), 20) = False Then
			SetLog("Not enough Elixir or your Wall is lower than level 8 ", $COLOR_ORANGE)
		Else
			If _ColorCheck(_GetPixelColor(596, 570), Hex(0xFFFFFF, 6), 20) = True  or _ColorCheck(_GetPixelColor(583, 570), Hex(0xFFFFFF, 6), 20) = True Then
				Click(560, 599) ; Click Upgrade
				_Sleep(2000)
				Click(472, 482) ; Click Okay
				SetLog("Upgrading Done !!!", $COLOR_BLUE) ; Done upgrade
				$WallUpgrade += 1
				GUICtrlSetData($lblwallupgradecount, $WallUpgrade)
				_Sleep(1000)
			Else
				Click(1, 1) ; Click away
				_Sleep(1000)
			Endif
		EndIf
	EndIf
	Click(1, 1) ; Click Away
EndFunc


Func UpgradeWallGold()
	If $FreeBuilder = 0 Then
		SetLog("No builders available", $COLOR_RED)
		Click(1, 1) ; Click Away
		Return
	EndIf

	checkWall()
	If $checkwalllogic = True Then
		Click(1, 1) ; Click Away
		_Sleep(600)
		Click($WallX, $WallY)
		_Sleep(600)
		_CaptureRegion()
		If _ColorCheck(_GetPixelColor(523, 641), Hex(0x000000, 6), 20) = False Then  ; checking wall level high than level 8
			$walllowlevel = 0
			If _ColorCheck(_GetPixelColor(500, 570), Hex(0xE70A12, 6), 20) or  _ColorCheck(_GetPixelColor(496, 570), Hex(0xE70A12, 6), 20)  Then
				SetLog("Not enough Gold...", $COLOR_ORANGE)
				Click(1, 1) ; Click Away
				$wallbuild = 0
			Else
				If _ColorCheck(_GetPixelColor(500, 570), Hex(0xFFFFFF, 6), 20) = True  or _ColorCheck(_GetPixelColor(583, 570), Hex(0xFFFFFF, 6), 20) = True  Then
					Click(505, 596) ; Click Upgrade
					_Sleep(2000)
					Click(472, 482) ; Click Okay
					SetLog("Upgrading Done !!!", $COLOR_BLUE) ; Done upgrade
					GUICtrlSetData($lblwallupgradecount, GUICtrlRead($lblwallupgradecount)+ 1)
					_Sleep(1000)
				Else
					Click(1, 1) ; Click away
					_Sleep(1000)
				Endif
			EndIf
		Else ; check wall level lower than 8
			$walllowlevel=1
			If _ColorCheck(_GetPixelColor(549, 570), Hex(0xE70A12, 6), 20) or  _ColorCheck(_GetPixelColor(540, 570), Hex(0xE70A12, 6), 20)  Then
				SetLog("Not enough Gold...", $COLOR_ORANGE)
				Click(1, 1) ; Click Away
				$wallbuild = 0
			Else
				If _ColorCheck(_GetPixelColor(549, 570), Hex(0xFFFFFF, 6), 20) or  _ColorCheck(_GetPixelColor(540, 570), Hex(0xFFFFFF, 6), 20)  Then
					Click(505, 596) ; Click Upgrade
					_Sleep(2000)
					Click(472, 482) ; Click Okay
					SetLog("Upgrading Done !!!", $COLOR_BLUE) ; Done upgrade
					GUICtrlSetData($lblwallupgradecount, GUICtrlRead($lblwallupgradecount)+ 1)
					_Sleep(1000)
				Else
					Click(1, 1) ; Click away
					_Sleep(1000)
				EndIf
			EndIf
		EndIf
	EndIf
	Click(1, 1) ; Click Away
EndFunc


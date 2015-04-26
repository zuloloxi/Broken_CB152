;Saves all of the GUI values to the config.

Func saveConfig() ;Saves the controls settings to the config
	;Search Settings------------------------------------------------------------------------
	If GUICtrlRead($chkDeadActivate) = $GUI_CHECKED Then
		IniWrite($config, "search", "DeadActivate", 1)
	Else
		IniWrite($config, "search", "DeadActivate", 0)
	EndIf
	If GUICtrlRead($chkAnyActivate) = $GUI_CHECKED Then
		IniWrite($config, "search", "AnyActivate", 1)
	Else
		IniWrite($config, "search", "AnyActivate", 0)
	EndIf
	IniWrite($config, "search", "searchDeadGold", GUICtrlRead($txtDeadMinGold))
	IniWrite($config, "search", "searchDeadElixir", GUICtrlRead($txtDeadMinElixir))
	IniWrite($config, "search", "searchDeadDark", GUICtrlRead($txtDeadMinDarkElixir))
	IniWrite($config, "search", "searchDeadTrophy", GUICtrlRead($txtDeadMinTrophy))
	IniWrite($config, "search", "searchGold", GUICtrlRead($txtMinGold))
	IniWrite($config, "search", "searchElixir", GUICtrlRead($txtMinElixir))
	IniWrite($config, "search", "searchDark", GUICtrlRead($txtMinDarkElixir))
	IniWrite($config, "search", "searchTrophy", GUICtrlRead($txtMinTrophy))
	IniWrite($config, "search", "AnyAndOr", _GUICtrlComboBox_GetCurSel($cmbAny))
	IniWrite($config, "search", "DeadAndOr", _GUICtrlComboBox_GetCurSel($cmbDead))
	IniWrite($config, "search", "THLevel", _GUICtrlComboBox_GetCurSel($cmbTH))
	IniWrite($config, "search", "DeadTHLevel", _GUICtrlComboBox_GetCurSel($cmbDeadTH))

	If GUICtrlRead($chkDeadGE) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionDeadGoldElixir", 1)
	Else
		IniWrite($config, "search", "conditionDeadGoldElixir", 0)
	EndIf

	If GUICtrlRead($chkDeadMeetDE) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionDeadDark", 1)
	Else
		IniWrite($config, "search", "conditionDeadDark", 0)
	EndIf

	If GUICtrlRead($chkDeadMeetTrophy) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionDeadTrophy", 1)
	Else
		IniWrite($config, "search", "conditionDeadTrophy", 0)
	EndIf

	If GUICtrlRead($chkDeadMeetTH) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionDeadTHLevel", 1)
	Else
		IniWrite($config, "search", "conditionDeadTHLevel", 0)
	EndIf

	If GUICtrlRead($chkDeadMeetTHO) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionDeadTHOutside", 1)
	Else
		IniWrite($config, "search", "conditionDeadTHOutside", 0)
	EndIf

	If GUICtrlRead($chkDeadSnipe) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionDeadSnipe", 1)
	Else
		IniWrite($config, "search", "conditionDeadSnipe", 0)
	EndIf

	If GUICtrlRead($chkMeetGE) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionGoldElixir", 1)
	Else
		IniWrite($config, "search", "conditionGoldElixir", 0)
	EndIf

	If GUICtrlRead($chkMeetDE) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionDark", 1)
	Else
		IniWrite($config, "search", "conditionDark", 0)
	EndIf

	If GUICtrlRead($chkMeetTrophy) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionTrophy", 1)
	Else
		IniWrite($config, "search", "conditionTrophy", 0)
	EndIf

	If GUICtrlRead($chkMeetTH) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionTHLevel", 1)
	Else
		IniWrite($config, "search", "conditionTHLevel", 0)
	EndIf

	If GUICtrlRead($chkMeetTHO) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionTHOutside", 1)
	Else
		IniWrite($config, "search", "conditionTHOutside", 0)
	EndIf

	If GUICtrlRead($chkSnipe) = $GUI_CHECKED Then
		IniWrite($config, "search", "conditionSnipe", 1)
	Else
		IniWrite($config, "search", "conditionSnipe", 0)
	EndIf

	If GUICtrlRead($chkAlertSearch) = $GUI_CHECKED Then
		IniWrite($config, "search", "AlertBaseFound", 1)
	Else
		IniWrite($config, "search", "AlertBaseFound", 0)
	EndIf

	If GUICtrlRead($chkTakeLootSS) = $GUI_CHECKED Then
		IniWrite($config, "search", "TakeLootSnapShot", 1)
	Else
		IniWrite($config, "search", "TakeLootSnapShot", 0)
	EndIf

	If GUICtrlRead($chkTakeTownSS) = $GUI_CHECKED Then
		IniWrite($config, "search", "TakeAllTownSnapShot", 1)
	Else
		IniWrite($config, "search", "TakeAllTownSnapShot", 0)
	EndIf

	;Attack Settings-------------------------------------------------------------------------
	IniWrite($config, "other", "UnitD", _GUICtrlComboBox_GetCurSel($cmbUnitDelay))
	IniWrite($config, "other", "WaveD", _GUICtrlComboBox_GetCurSel($cmbWaveDelay))
	IniWrite($config, "other", "randomatk", GUICtrlRead($Randomspeedatk))
	IniWrite($config, "attack", "deploy-dead", _GUICtrlComboBox_GetCurSel($cmbDeadDeploy))
	IniWrite($config, "attack", "algorithm-dead", _GUICtrlComboBox_GetCurSel($cmbDeadAlgorithm))

	If GUICtrlRead($chkDeadUseKing) = $GUI_CHECKED Then
		IniWrite($config, "attack", "king-dead", 1)
	Else
		IniWrite($config, "attack", "king-dead", 0)
	EndIf

	If GUICtrlRead($chkDeadUseQueen) = $GUI_CHECKED Then
		IniWrite($config, "attack", "queen-dead", 1)
	Else
		IniWrite($config, "attack", "queen-dead", 0)
	EndIf

	If GUICtrlRead($chkDeadUseClanCastle) = $GUI_CHECKED Then
		IniWrite($config, "attack", "use-cc-dead", 1)
	Else
		IniWrite($config, "attack", "use-cc-dead", 0)
	EndIf

	IniWrite($config, "attack", "townhall-dead", _GUICtrlComboBox_GetCurSel($cmbDeadAttackTH))

	IniWrite($config, "attack", "deploy", _GUICtrlComboBox_GetCurSel($cmbDeploy))
	IniWrite($config, "attack", "algorithm", _GUICtrlComboBox_GetCurSel($cmbAlgorithm))

	If GUICtrlRead($chkUseKing) = $GUI_CHECKED Then
		IniWrite($config, "attack", "king-all", 1)
	Else
		IniWrite($config, "attack", "king-all", 0)
	EndIf

	If GUICtrlRead($chkUseQueen) = $GUI_CHECKED Then
		IniWrite($config, "attack", "queen-all", 1)
	Else
		IniWrite($config, "attack", "queen-all", 0)
	EndIf

	If GUICtrlRead($chkUseClanCastle) = $GUI_CHECKED Then
		IniWrite($config, "attack", "use-cc", 1)
	Else
		IniWrite($config, "attack", "use-cc", 0)
	EndIf

	IniWrite($config, "attack", "townhall", _GUICtrlComboBox_GetCurSel($cmbAttackTH))

	;Donate Settings-------------------------------------------------------------------------
	If GUICtrlRead($chkRequest) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkRequest", 1)
	Else
		IniWrite($config, "donate", "chkRequest", 0)
	EndIf
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	If GUICtrlRead($chkDonateAllBarbarians) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateAllBarbarians", 1)
	Else
		IniWrite($config, "donate", "chkDonateAllBarbarians", 0)
	EndIf

	If GUICtrlRead($chkDonateAllArchers) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateAllArchers", 1)
	Else
		IniWrite($config, "donate", "chkDonateAllArchers", 0)
	EndIf

	If GUICtrlRead($chkDonateAllGiants) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateAllGiants", 1)
	Else
		IniWrite($config, "donate", "chkDonateAllGiants", 0)
	EndIf
	;```````````````````````````````````````````````
	If GUICtrlRead($chkDonateBarbarians) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateBarbarians", 1)
	Else
		IniWrite($config, "donate", "chkDonateBarbarians", 0)
	EndIf

	If GUICtrlRead($chkDonateArchers) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateArchers", 1)
	Else
		IniWrite($config, "donate", "chkDonateArchers", 0)
	EndIf

	If GUICtrlRead($chkDonateGiants) = $GUI_CHECKED Then
		IniWrite($config, "donate", "chkDonateGiants", 1)
	Else
		IniWrite($config, "donate", "chkDonateGiants", 0)
	EndIf

	If GUICtrlRead($gtfo) = $GUI_CHECKED Then
        IniWrite($config, "donate", "gtfo", 1)
        Else
        IniWrite($config, "donate", "gtfo", 0)
        EndIf

	IniWrite($config, "donate", "xCCPos", $CCPos[0])
	IniWrite($config, "donate", "yCCPos", $CCPos[1])

	IniWrite($config, "donate", "txtRequest", GUICtrlRead($txtRequest))

	IniWrite($config, "donate", "txtDonateBarbarians", StringReplace(GUICtrlRead($txtDonateBarbarians), @CRLF, "|"))
	IniWrite($config, "donate", "txtDonateArchers", StringReplace(GUICtrlRead($txtDonateArchers), @CRLF, "|"))
	IniWrite($config, "donate", "txtDonateGiants", StringReplace(GUICtrlRead($txtDonateGiants), @CRLF, "|"))
	IniWrite($config, "donate", "donate1", GUICtrlRead($cmbDonateBarbarians))
	IniWrite($config, "donate", "donate2", GUICtrlRead($cmbDonateArchers))
	IniWrite($config, "donate", "donate3", GUICtrlRead($cmbDonateGiants))
	IniWrite($config, "donate", "amount1", GUICtrlRead($NoOfBarbarians))
	IniWrite($config, "donate", "amount2", GUICtrlRead($NoOfArchers))
	IniWrite($config, "donate", "amount3", GUICtrlRead($NoOfGiants))


	;Troop Settings--------------------------------------------------------------------------
	IniWrite($config, "troop", "raidcapacity", _GUICtrlComboBox_GetCurSel($cmbRaidcap))
	IniWrite($config, "troop", "composition", _GUICtrlComboBox_GetCurSel($cmbTroopComp))
	IniWrite($config, "troop", "capacity", GUICtrlRead($txtCapacity))
	Switch _GUICtrlComboBox_GetCurSel($cmbTroopComp)
		Case 3
			If (GUICtrlRead($txtBarbarians) + GUICtrlRead($txtArchers)) <> 100 Then
				$newBarb = Round((GUICtrlRead($txtBarbarians) / (GUICtrlRead($txtBarbarians) + GUICtrlRead($txtArchers))) * 100)
				$newArch = 100 - $newBarb
				GUICtrlSetData($txtBarbarians, $newBarb)
				GUICtrlSetData($txtArchers, $newArch)
				SetLog("Automatically adjusting troops : B-" & $newBarb & "%, A-" & $newArch & "%", $COLOR_RED)
			EndIf
		Case 4
			If (GUICtrlRead($txtBarbarians) + GUICtrlRead($txtArchers) + GUICtrlRead($txtGoblins)) <> 100 Then
				$newBarb = Round((GUICtrlRead($txtBarbarians) / (GUICtrlRead($txtBarbarians) + GUICtrlRead($txtArchers) + GUICtrlRead($txtGoblins))) * 100)
				$newArch = Round((GUICtrlRead($txtArchers) / (GUICtrlRead($txtBarbarians) + GUICtrlRead($txtArchers) + GUICtrlRead($txtGoblins))) * 100)
				$newGob = 100 - $newBarb - $newArch
				GUICtrlSetData($txtBarbarians, $newBarb)
				GUICtrlSetData($txtArchers, $newArch)
				GUICtrlSetData($txtGoblins, $newGob)
				SetLog("Automatically adjusting troops : B-" & $newBarb & "%, A-" & $newArch & "%, G-" & $newGob & "%", $COLOR_RED)
			EndIf
		Case 5
			If (GUICtrlRead($txtBarbarians) + GUICtrlRead($txtArchers)) <> 100 Then
				$newBarb = Round((GUICtrlRead($txtBarbarians) / (GUICtrlRead($txtBarbarians) + GUICtrlRead($txtArchers))) * 100)
				$newArch = 100 - $newBarb
				GUICtrlSetData($txtBarbarians, $newBarb)
				GUICtrlSetData($txtArchers, $newArch)
				SetLog("Automatically adjusting troops : B-" & $newBarb & "%, A-" & $newArch & "%", $COLOR_RED)
			EndIf
		Case 6
			If (GUICtrlRead($txtBarbarians) + GUICtrlRead($txtArchers) + GUICtrlRead($txtGoblins)) <> 100 Then
				$newBarb = Round((GUICtrlRead($txtBarbarians) / (GUICtrlRead($txtBarbarians) + GUICtrlRead($txtArchers) + GUICtrlRead($txtGoblins))) * 100)
				$newArch = Round((GUICtrlRead($txtArchers) / (GUICtrlRead($txtBarbarians) + GUICtrlRead($txtArchers) + GUICtrlRead($txtGoblins))) * 100)
				$newGob = 100 - $newBarb - $newArch
				GUICtrlSetData($txtBarbarians, $newBarb)
				GUICtrlSetData($txtArchers, $newArch)
				GUICtrlSetData($txtGoblins, $newGob)
				SetLog("Automatically adjusting troops : B-" & $newBarb & "%, A-" & $newArch & "%, G-" & $newGob & "%", $COLOR_RED)
			EndIf
		Case 7
			If (GUICtrlRead($txtBarbarians) + GUICtrlRead($txtArchers) + GUICtrlRead($txtGoblins)) <> 100 Then
				$newBarb = Round((GUICtrlRead($txtBarbarians) / (GUICtrlRead($txtBarbarians) + GUICtrlRead($txtArchers) + GUICtrlRead($txtGoblins))) * 100)
				$newArch = Round((GUICtrlRead($txtArchers) / (GUICtrlRead($txtBarbarians) + GUICtrlRead($txtArchers) + GUICtrlRead($txtGoblins))) * 100)
				$newGob = 100 - $newBarb - $newArch
				GUICtrlSetData($txtBarbarians, $newBarb)
				GUICtrlSetData($txtArchers, $newArch)
				GUICtrlSetData($txtGoblins, $newGob)
				SetLog("Automatically adjusting troops : B-" & $newBarb & "%, A-" & $newArch & "%, G-" & $newGob & "%", $COLOR_RED)
			EndIf
	EndSwitch
	IniWrite($config, "troop", "barbarian", GUICtrlRead($txtBarbarians))
	IniWrite($config, "troop", "archer", GUICtrlRead($txtArchers))
	IniWrite($config, "troop", "goblin", GUICtrlRead($txtGoblins))
	IniWrite($config, "troop", "giant", GUICtrlRead($txtNumGiants))
	IniWrite($config, "troop", "WB", GUICtrlRead($txtNumWallbreakers))
	IniWrite($config, "troop", "troop1", _GUICtrlComboBox_GetCurSel($cmbBarrack1))
	IniWrite($config, "troop", "troop2", _GUICtrlComboBox_GetCurSel($cmbBarrack2))
	IniWrite($config, "troop", "troop3", _GUICtrlComboBox_GetCurSel($cmbBarrack3))
	IniWrite($config, "troop", "troop4", _GUICtrlComboBox_GetCurSel($cmbBarrack4))

	;Custom Troop 2 Settings--------------------------------------------------------------------------
	IniWrite($config, "troop", "CustomRax1", GUICtrlRead($txtFirstTroop1))
	IniWrite($config, "troop", "CustomRax2", GUICtrlRead($txtFirstTroop2))
	IniWrite($config, "troop", "CustomRax3", GUICtrlRead($txtFirstTroop3))
	IniWrite($config, "troop", "CustomRax4", GUICtrlRead($txtFirstTroop4))
	IniWrite($config, "troop", "CustomtroopF1", _GUICtrlComboBox_GetCurSel($cmbFirstTroop1))
	IniWrite($config, "troop", "CustomtroopF2", _GUICtrlComboBox_GetCurSel($cmbFirstTroop2))
	IniWrite($config, "troop", "CustomtroopF3", _GUICtrlComboBox_GetCurSel($cmbFirstTroop3))
	IniWrite($config, "troop", "CustomtroopF4", _GUICtrlComboBox_GetCurSel($cmbFirstTroop4))
	IniWrite($config, "troop", "CustomtroopS1", _GUICtrlComboBox_GetCurSel($cmbSecondTroop1))
	IniWrite($config, "troop", "CustomtroopS2", _GUICtrlComboBox_GetCurSel($cmbSecondTroop2))
	IniWrite($config, "troop", "CustomtroopS3", _GUICtrlComboBox_GetCurSel($cmbSecondTroop3))
	IniWrite($config, "troop", "CustomtroopS4", _GUICtrlComboBox_GetCurSel($cmbSecondTroop4))

	;Other Settings--------------------------------------------------------------------------
	If GUICtrlRead($chkWalls) = $GUI_CHECKED Then
		IniWrite($config, "other", "auto-wall", 1)
	Else
		IniWrite($config, "other", "auto-wall", 0)
	EndIf
	IniWrite($config, "other", "walllvl", _GUICtrlComboBox_GetCurSel($cmbWalls))
	IniWrite($config, "other", "walltolerance", _GUICtrlComboBox_GetCurSel($cmbTolerance))

	If GUICtrlRead($UseGold) = $GUI_CHECKED Then
		IniWrite($config, "other", "use-storage", 0)
	ElseIf GUICtrlRead($UseElixir) = $GUI_CHECKED Then
		IniWrite($config, "other", "use-storage", 1)
	ElseIf GUICtrlRead($UseGoldElix) = $GUI_CHECKED Then
		IniWrite($config, "other", "use-storage", 2)
	EndIf

	IniWrite($config, "other", "minwallgold", GUICtrlRead($txtWallMinGold))
	IniWrite($config, "other", "minwallelixir", GUICtrlRead($txtWallMinElixir))

	;Dark Barracks
    	IniWrite($config, "other", "Darktroop1", _GUICtrlComboBox_GetCurSel($cmbDarkBarrack1))
	IniWrite($config, "other", "Darktroop2", _GUICtrlComboBox_GetCurSel($cmbDarkBarrack2))
	IniWrite($config, "other", "DarkRax1", GUICtrlRead($txtDarkBarrack1))
	IniWrite($config, "other", "DarkRax2", GUICtrlRead($txtDarkBarrack2))

	;Upgrade Building.......................................................................

	If GUICtrlRead($chkUpgrade1) = $GUI_CHECKED Then
		IniWrite($config, "upgrade", "auto-upgrade1", 1)
	Else
		IniWrite($config, "upgrade", "auto-upgrade1", 0)
	EndIf
	If GUICtrlRead($chkUpgrade2) = $GUI_CHECKED Then
		IniWrite($config, "upgrade", "auto-upgrade2", 1)
	Else
		IniWrite($config, "upgrade", "auto-upgrade2", 0)
	EndIf
	If GUICtrlRead($chkUpgrade3) = $GUI_CHECKED Then
		IniWrite($config, "upgrade", "auto-upgrade3", 1)
	Else
		IniWrite($config, "upgrade", "auto-upgrade3", 0)
	EndIf
	If GUICtrlRead($chkUpgrade4) = $GUI_CHECKED Then
		IniWrite($config, "upgrade", "auto-upgrade4", 1)
	Else
		IniWrite($config, "upgrade", "auto-upgrade4", 0)
	EndIf
	If GUICtrlRead($chkUpgrade5) = $GUI_CHECKED Then
		IniWrite($config, "upgrade", "auto-upgrade5", 1)
	Else
		IniWrite($config, "upgrade", "auto-upgrade5", 0)
	EndIf
	If GUICtrlRead($chkUpgrade6) = $GUI_CHECKED Then
		IniWrite($config, "upgrade", "auto-upgrade6", 1)
	Else
		IniWrite($config, "upgrade", "auto-upgrade6", 0)
	EndIf

	IniWrite($config, "upgrade", "PosX1", GUICtrlRead($txtUpgradeX1))
	IniWrite($config, "upgrade", "PosY2", GUICtrlRead($txtUpgradeY2))
	IniWrite($config, "upgrade", "PosX2", GUICtrlRead($txtUpgradeX2))
	IniWrite($config, "upgrade", "PosY3", GUICtrlRead($txtUpgradeY3))
	IniWrite($config, "upgrade", "PosX3", GUICtrlRead($txtUpgradeX3))
	IniWrite($config, "upgrade", "PosY4", GUICtrlRead($txtUpgradeY4))
	IniWrite($config, "upgrade", "PosX4", GUICtrlRead($txtUpgradeX4))
	IniWrite($config, "upgrade", "PosY5", GUICtrlRead($txtUpgradeY5))
	IniWrite($config, "upgrade", "PosX5", GUICtrlRead($txtUpgradeX5))
	IniWrite($config, "upgrade", "PosY6", GUICtrlRead($txtUpgradeY6))
	IniWrite($config, "upgrade", "PosX6", GUICtrlRead($txtUpgradeX6))

	;General Settings--------------------------------------------------------------------------
	Local $frmBotPos = WinGetPos($sBotTitle)
	IniWrite($config, "general", "frmBotPosX", $frmBotPos[0])
	IniWrite($config, "general", "frmBotPosY", $frmBotPos[1])
	IniWrite($config, "general", "MinTrophy", GUICtrlRead($txtMinimumTrophy))
	IniWrite($config, "general", "MaxTrophy", GUICtrlRead($txtMaxTrophy))
	;Misc Settings--------------------------------------------------------------------------
	If GUICtrlRead($chkAvoidEdge) = $GUI_CHECKED Then
		IniWrite($config, "misc", "AvoidEdge", 1)
	Else
		IniWrite($config, "misc", "AvoidEdge", 0)
	EndIf

	If GUICtrlRead($chkTakeAttackSS) = $GUI_CHECKED Then
		IniWrite($config, "misc", "TakeAttackSnapShot", 1)
	Else
		IniWrite($config, "misc", "TakeAttackSnapShot", 0)
	EndIf

	If GUICtrlRead($chkDebug) = $GUI_CHECKED Then
		IniWrite($config, "misc", "Debug", 1)
	Else
		IniWrite($config, "misc", "Debug", 0)
	EndIf

	If GUICtrlRead($chkCollect) = $GUI_CHECKED Then
		IniWrite($config, "misc", "Collect", 1)
	Else
		IniWrite($config, "misc", "Collect", 0)
	EndIf

	IniWrite($config, "misc", "reconnectdelay", GUICtrlRead($txtReconnect))
	IniWrite($config, "misc", "returnhomedelay", GUICtrlRead($txtReturnh))
	IniWrite($config, "misc", "kingskilldelay", GUICtrlRead($txtKingSkill))
	IniWrite($config, "misc", "queenskilldelay", GUICtrlRead($txtQueenSkill))
	IniWrite($config, "misc", "searchspd", _GUICtrlComboBox_GetCurSel($cmbSearchsp))
	IniWrite($config, "misc", "xTownHall", $TownHallPos[0])
	IniWrite($config, "misc", "yTownHall", $TownHallPos[1])
	IniWrite($config, "misc", "xArmy", $ArmyPos[0])
	IniWrite($config, "misc", "yArmy", $ArmyPos[1])
	IniWrite($config, "misc", "xSpell", $SpellPos[0])
	IniWrite($config, "misc", "ySpell", $SpellPos[1])
	IniWrite($config, "misc", "xKing", $KingPos[0])
	IniWrite($config, "misc", "yKing", $KingPos[1])
	IniWrite($config, "misc", "xQueen", $QueenPos[0])
	IniWrite($config, "misc", "yQueen", $QueenPos[1])

	If GUICtrlRead($chkWideEdge) = $GUI_CHECKED Then
		IniWrite($config, "misc", "WideEdge", 1)
	Else
		IniWrite($config, "misc", "WideEdge", 0)
	EndIf

	;Push Bullet--------------------------------------------------------------------------
	If GUICtrlRead($lblpushbulletenabled) = $GUI_CHECKED Then
		IniWrite($config, "notification", "pushbullet", 1)
	Else
		IniWrite($config, "notification", "pushbullet", 0)
	EndIf

	If GUICtrlRead($lblvillagereport) = $GUI_CHECKED Then
		IniWrite($config, "notification", "villagereport", 1)
	Else
		IniWrite($config, "notification", "villagereport", 0)
	EndIf

	If GUICtrlRead($lblmatchfound) = $GUI_CHECKED Then
		IniWrite($config, "notification", "matchfound", 1)
	Else
		IniWrite($config, "notification", "matchfound", 0)
	EndIf

	If GUICtrlRead($lbllastraid) = $GUI_CHECKED Then
		IniWrite($config, "notification", "lastraid", 1)
	Else
		IniWrite($config, "notification", "lastraid", 0)
	EndIf

	If GUICtrlRead($lblfreebuilder) = $GUI_CHECKED Then
		IniWrite($config, "notification", "freebuilder", 1)
	Else
		IniWrite($config, "notification", "freebuilder", 0)
	EndIf

	If GUICtrlRead($lblpushbulletdebug) = $GUI_CHECKED Then
		IniWrite($config, "notification", "debug", 1)
	Else
		IniWrite($config, "notification", "debug", 0)
	EndIf

	If GUICtrlRead($lblpushbulletremote) = $GUI_CHECKED Then
		IniWrite($config, "notification", "remote", 1)
	Else
		IniWrite($config, "notification", "remote", 0)
	EndIf

	If GUICtrlRead($lblpushbulletdelete) = $GUI_CHECKED Then
		IniWrite($config, "notification", "delete", 1)
	Else
		IniWrite($config, "notification", "delete", 0)
	EndIf

	IniWrite($config, "notification", "accounttoken", GUICtrlRead($pushbullettokenvalue))

	If GUICtrlRead($UseJPG) = $GUI_CHECKED Then
		IniWrite($config, "notification", "lastraidtype", 1)
	Else
		IniWrite($config, "notification", "lastraidtype", 0)
	EndIf

	If GUICtrlRead($UseAttackJPG) = $GUI_CHECKED Then
		IniWrite($config, "notification", "attackimage", 1)
	Else
		IniWrite($config, "notification", "attackimage", 0)
	EndIf


	For $i = 0 To 3 ;Covers all 4 Barracks
		IniWrite($config, "troop", "xBarrack" & $i + 1, $barrackPos[$i][0])
		IniWrite($config, "troop", "yBarrack" & $i + 1, $barrackPos[$i][1])
	Next

	;Spell Settings--------------------------------------------------------------------------
	If GUICtrlRead($chkMakeSpells) = $GUI_CHECKED Then
		IniWrite($config, "spells", "chkMakeSpells", 1)
	Else
		IniWrite($config, "spells", "chkMakeSpells", 0)
	EndIf
	IniWrite($config, "spells", "spellname", _GUICtrlComboBox_GetCurSel($cmbSpellCreate))
	IniWrite($config, "spells", "nukelimit", GUICtrlRead($txtDENukeLimit))
	IniWrite($config, "spells", "spellnumber", GUICtrlRead($txtSpellNumber))
	If GUICtrlRead($chkNukeAttacking) = $GUI_CHECKED Then
		IniWrite($config, "spells", "chkNukeAttacking", 1)
	Else
		IniWrite($config, "spells", "chkNukeAttacking", 0)
	EndIf
	If GUICtrlRead($chkNukeOnly) = $GUI_CHECKED Then
		IniWrite($config, "spells", "chkNukeOnly", 1)
	Else
		IniWrite($config, "spells", "chkNukeOnly", 0)
	EndIf
	If GUICtrlRead($chkNukeOnlyWithFullArmy) = $GUI_CHECKED Then
		IniWrite($config, "spells", "chkNukeOnlyWithFullArmy", 1)
	Else
		IniWrite($config, "spells", "chkNukeOnlyWithFullArmy", 0)
	EndIf
	IniWrite($config, "spells", "spellcap", GUICtrlRead($txtSpellCap))
	If GUICtrlRead($rdoMaybeSkip) = $GUI_CHECKED Then
		IniWrite($config, "spells", "DESearchAcc", 1)
	Else
		IniWrite($config, "spells", "DESearchAcc", 0)
	EndIf



	If GUICtrlRead($chkTrap) = $GUI_CHECKED Then
		IniWrite($config, "misc", "chkTrap", 1)
	Else
		IniWrite($config, "misc", "chkTrap", 0)
	EndIf

	If GUICtrlRead($chkBackground) = $GUI_CHECKED Then
		IniWrite($config, "general", "Background", 1)
	Else
		IniWrite($config, "general", "Background", 0)
	EndIf

	If GUICtrlRead($chkBotStop) = $GUI_CHECKED Then
		IniWrite($config, "general", "BotStop", 1)
	Else
		IniWrite($config, "general", "BotStop", 0)
	EndIf

	If GUICtrlRead($chkForceBS) = $GUI_CHECKED Then
		IniWrite($config, "general", "ForceBS", 1)
	Else
		IniWrite($config, "general", "ForceBS", 0)
	EndIf

	If GUICtrlRead($chkNoAttack) = $GUI_CHECKED Then
		IniWrite($config, "general", "NoAttack", 1)
	Else
		IniWrite($config, "general", "NoAttack", 0)
	EndIf

	If GUICtrlRead($chkDonateOnly) = $GUI_CHECKED Then
		IniWrite($config, "general", "DonateOnly", 1)
	Else
		IniWrite($config, "general", "DonateOnly", 0)
	EndIf

	IniWrite($config, "general", "Command", _GUICtrlComboBox_GetCurSel($cmbBotCommand))
	IniWrite($config, "general", "Cond", _GUICtrlComboBox_GetCurSel($cmbBotCond))

	;Update Settings--------------------------------------------------------------------------
	If GUICtrlRead($chkUpdate) = $GUI_CHECKED Then
		IniWrite($config, "general", "chkUpdate", 1)
	Else
		IniWrite($config, "general", "chkUpdate", 0)
	EndIf

	;Dark Barracks
	For $i = 0 To 1 ;Cover 2 Dark Barracks
		IniWrite($config, "other", "xDarkBarrack" & $i + 1, $DarkBarrackPos[$i][0])
		IniWrite($config, "other", "yDarkBarrack" & $i + 1, $DarkBarrackPos[$i][1])
	Next

	If GUICtrlRead($chkDarkTroop) = $GUI_CHECKED Then
		IniWrite($config, "other", "chkDarkTroop", 1)
	Else
		IniWrite($config, "other", "chkDarkTroop", 0)
	EndIf

	For $i = 0 To 16 ;Covers all Collectors
		IniWrite($config, "general", "xCollector" & $i + 1, $collectorPos[$i][0])
		IniWrite($config, "general", "yCollector" & $i + 1, $collectorPos[$i][1])
	Next

EndFunc   ;==>saveConfig

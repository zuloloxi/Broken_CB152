;Applies all of the  variable to the GUI

Func applyConfig() ;Applies the data from config to the controls in GUI
	;Search Settings------------------------------------------------------------------------
	If $ideadactivate = 1 Then
		GUICtrlSetState($chkDeadActivate, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDeadActivate, $GUI_UNCHECKED)
	EndIf
	If $ianyactivate = 1 Then
		GUICtrlSetState($chkAnyActivate, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAnyActivate, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($txtDeadMinGold, $MinDeadGold)
	GUICtrlSetData($txtDeadMinElixir, $MinDeadElixir)
	GUICtrlSetData($txtDeadMinDarkElixir, $MinDeadDark)
	GUICtrlSetData($txtDeadMinTrophy, $MinDeadTrophy)
	GUICtrlSetData($txtMinGold, $MinGold)
	GUICtrlSetData($txtMinElixir, $MinElixir)
	GUICtrlSetData($txtMinDarkElixir, $MinDark)
	GUICtrlSetData($txtMinTrophy, $MinTrophy)

	_GUICtrlComboBox_SetCurSel($cmbAny, $icmbAny)
	_GUICtrlComboBox_SetCurSel($cmbDead, $icmbDead)

	For $i = 0 To 4
		If $icmbTH = $i Then $MaxTH = $THText[$i]
		If $icmbDeadTH = $i Then $MaxDeadTH = $THText[$i]
	Next

	If $chkConditions[0] = 1 Then
		GUICtrlSetState($chkDeadGE, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDeadGE, $GUI_UNCHECKED)
	EndIf

	If $chkConditions[1] = 1 Then
		GUICtrlSetState($chkDeadMeetDE, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDeadMeetDE, $GUI_UNCHECKED)
	EndIf

	If $chkConditions[2] = 1 Then
		GUICtrlSetState($chkDeadMeetTrophy, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDeadMeetTrophy, $GUI_UNCHECKED)
	EndIf

	If $chkConditions[3] = 1 Then
		GUICtrlSetState($chkDeadMeetTH, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDeadMeetTH, $GUI_UNCHECKED)
	EndIf

	If $chkConditions[4] = 1 Then
		GUICtrlSetState($chkDeadMeetTHO, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDeadMeetTHO, $GUI_UNCHECKED)
	EndIf

	If $chkConditions[5] = 1 Then
		GUICtrlSetState($chkMeetGE, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkMeetGE, $GUI_UNCHECKED)
	EndIf

	If $chkConditions[6] = 1 Then
		GUICtrlSetState($chkMeetDE, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkMeetDE, $GUI_UNCHECKED)
	EndIf

	If $chkConditions[7] = 1 Then
		GUICtrlSetState($chkMeetTrophy, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkMeetTrophy, $GUI_UNCHECKED)
	EndIf

	If $chkConditions[8] = 1 Then
		GUICtrlSetState($chkMeetTH, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkMeetTH, $GUI_UNCHECKED)
	EndIf

	If $chkConditions[9] = 1 Then
		GUICtrlSetState($chkMeetTHO, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkMeetTHO, $GUI_UNCHECKED)
	EndIf

	If $chkConditions[10] = 1 Then
		GUICtrlSetState($chkDeadSnipe, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDeadSnipe, $GUI_UNCHECKED)
	EndIf

	If $chkConditions[11] = 1 Then
		GUICtrlSetState($chkSnipe, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkSnipe, $GUI_UNCHECKED)
	EndIf

	If $AlertBaseFound = 1 Then
		GUICtrlSetState($chkAlertSearch, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAlertSearch, $GUI_UNCHECKED)
	EndIf

	If $TakeLootSnapShot = 1 Then
		GUICtrlSetState($chkTakeLootSS, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTakeLootSS, $GUI_UNCHECKED)
	EndIf

	If $TakeAllTownSnapShot = 1 Then
		GUICtrlSetState($chkTakeTownSS, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTakeTownSS, $GUI_UNCHECKED)
	EndIf

	_GUICtrlComboBox_SetCurSel($cmbTH, $icmbTH)
	_GUICtrlComboBox_SetCurSel($cmbDeadTH, $icmbDeadTH)

	chkDeadActivate()
	chkAnyActivate()

	;Attack Settings-------------------------------------------------------------------------
	_GUICtrlComboBox_SetCurSel($cmbDeadDeploy, $deployDeadSettings)
	_GUICtrlComboBox_SetCurSel($cmbDeadAlgorithm, $icmbDeadAlgorithm)

	If $checkDeadUseKing = 1 Then
		GUICtrlSetState($chkDeadUseKing, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDeadUseKing, $GUI_UNCHECKED)
	EndIf

	If $checkDeadUseQueen = 1 Then
		GUICtrlSetState($chkDeadUseQueen, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDeadUseQueen, $GUI_UNCHECKED)
	EndIf

	If $checkDeadUseClanCastle = 1 Then
		GUICtrlSetState($chkDeadUseClanCastle, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDeadUseClanCastle, $GUI_UNCHECKED)
	EndIf

	_GUICtrlComboBox_SetCurSel($cmbDeadAttackTH, $icmbDeadAttackTH)

	_GUICtrlComboBox_SetCurSel($cmbDeploy, $deploySettings)
	_GUICtrlComboBox_SetCurSel($cmbAlgorithm, $icmbAlgorithm)

	If $checkUseKing = 1 Then
		GUICtrlSetState($chkUseKing, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkUseKing, $GUI_UNCHECKED)
	EndIf

	If $checkUseQueen = 1 Then
		GUICtrlSetState($chkUseQueen, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkUseQueen, $GUI_UNCHECKED)
	EndIf

	If $checkUseClanCastle = 1 Then
		GUICtrlSetState($chkUseClanCastle, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkUseClanCastle, $GUI_UNCHECKED)
	EndIf

	_GUICtrlComboBox_SetCurSel($cmbAttackTH, $icmbAttackTH)

	_GUICtrlComboBox_SetCurSel($cmbUnitDelay, $icmbUnitDelay)
	_GUICtrlComboBox_SetCurSel($cmbWaveDelay, $icmbWaveDelay)

	If $iRandomspeedatk = 1 Then
		GUICtrlSetState($Randomspeedatk, $GUI_CHECKED)
	Else
		GUICtrlSetState($Randomspeedatk, $GUI_UNCHECKED)
	EndIf
	Randomspeedatk()

	;Donate Settings-------------------------------------------------------------------------
	If $ichkRequest = 1 Then
		GUICtrlSetState($chkRequest, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkRequest, $GUI_UNCHECKED)
	EndIf

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	If $ichkDonateBarbarians = 1 Then
		GUICtrlSetState($chkDonateBarbarians, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateBarbarians, $GUI_UNCHECKED)
	EndIf
	If $ichkDonateAllBarbarians = 1 Then
		GUICtrlSetState($chkDonateAllBarbarians, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateAllBarbarians, $GUI_UNCHECKED)
	EndIf
	;````````````````````````````````````````````````
	If $ichkDonateArchers = 1 Then
		GUICtrlSetState($chkDonateArchers, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateArchers, $GUI_UNCHECKED)
	EndIf
	If $ichkDonateAllArchers = 1 Then
		GUICtrlSetState($chkDonateAllArchers, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateAllArchers, $GUI_UNCHECKED)
	EndIf
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	If $ichkDonateGiants = 1 Then
		GUICtrlSetState($chkDonateGiants, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateGiants, $GUI_UNCHECKED)
	EndIf
	If $ichkDonateAllGiants = 1 Then
		GUICtrlSetState($chkDonateAllGiants, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateAllGiants, $GUI_UNCHECKED)
	EndIf
	If IniRead($config, "donate", "gtfo", "0") = 1 Then
                GUICtrlSetState($gtfo, $GUI_CHECKED)
        Else
                GUICtrlSetState($gtfo, $GUI_UNCHECKED)
        EndIf


	GUICtrlSetData($txtDonateBarbarians, $itxtDonateBarbarians)
	GUICtrlSetData($txtDonateArchers, $itxtDonateArchers)
	GUICtrlSetData($txtDonateGiants, $itxtDonateGiants)

	GUICtrlSetData($txtRequest, $itxtRequest)
	GUICtrlSetData($cmbDonateBarbarians, IniRead($config, "donate", "donate1", "Barbarians"), "Barbarians")
	GUICtrlSetData($cmbDonateArchers, IniRead($config, "donate", "donate2", "Archers"), "Archers")
	GUICtrlSetData($cmbDonateGiants, IniRead($config, "donate", "donate3", "Giants"), "Giants")
	GUICtrlSetData($NoOfBarbarians, IniRead($config, "donate", "amount1", 5), 5)
	GUICtrlSetData($NoOfArchers, IniRead($config, "donate", "amount2", 5), 5)
	GUICtrlSetData($NoOfGiants, IniRead($config, "donate", "amount3", 5), 5)
	chkRequest()
	;Troop Settings--------------------------------------------------------------------------
	_GUICtrlComboBox_SetCurSel($cmbTroopComp, $icmbTroopComp)
	_GUICtrlComboBox_SetCurSel($cmbRaidcap, $icmbRaidcap)
	GUICtrlSetData($txtCapacity, $itxtcampCap)
	GUICtrlSetData($txtBarbarians, $BarbariansComp)
	GUICtrlSetData($txtArchers, $ArchersComp)
	GUICtrlSetData($txtNumGiants, $GiantsComp)
	GUICtrlSetData($txtGoblins, $GoblinsComp)
	GUICtrlSetData($txtNumWallbreakers, $GoblinsComp)
	SetComboTroopComp()

	_GUICtrlComboBox_SetCurSel($cmbBarrack1, $barrackTroop[0])
	_GUICtrlComboBox_SetCurSel($cmbBarrack2, $barrackTroop[1])
	_GUICtrlComboBox_SetCurSel($cmbBarrack3, $barrackTroop[2])
	_GUICtrlComboBox_SetCurSel($cmbBarrack4, $barrackTroop[3])

	;Custom Troop 2 Settings--------------------------------------------------------------------------
	GUICtrlSetData($txtFirstTroop1, $itxtFirstTroop[0])
	GUICtrlSetData($txtFirstTroop2, $itxtFirstTroop[1])
	GUICtrlSetData($txtFirstTroop3, $itxtFirstTroop[2])
	GUICtrlSetData($txtFirstTroop4, $itxtFirstTroop[3])
	_GUICtrlComboBox_SetCurSel($cmbFirstTroop1, $CustomTroopF[0])
	_GUICtrlComboBox_SetCurSel($cmbFirstTroop2, $CustomTroopF[1])
	_GUICtrlComboBox_SetCurSel($cmbFirstTroop3, $CustomTroopF[2])
	_GUICtrlComboBox_SetCurSel($cmbFirstTroop4, $CustomTroopF[3])

	_GUICtrlComboBox_SetCurSel($cmbSecondTroop1, $CustomTroopS[0])
	_GUICtrlComboBox_SetCurSel($cmbSecondTroop2, $CustomTroopS[1])
	_GUICtrlComboBox_SetCurSel($cmbSecondTroop3, $CustomTroopS[2])
	_GUICtrlComboBox_SetCurSel($cmbSecondTroop4, $CustomTroopS[3])
	
	;Other Settings--------------------------------------------------------------------------
	If $ichkWalls = 1 Then
		GUICtrlSetState($chkWalls, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkWalls, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbWalls, $icmbWalls)
	_GUICtrlComboBox_SetCurSel($cmbTolerance, $icmbTolerance)

	Switch $iUseStorage
		Case 0
			GUICtrlSetState($UseGold, $GUI_CHECKED)
		Case 1
			GUICtrlSetState($UseElixir, $GUI_CHECKED)
		Case 2
			GUICtrlSetState($UseGoldElix, $GUI_CHECKED)
	EndSwitch

	GUICtrlSetData($txtWallMinGold, $itxtWallMinGold)
	GUICtrlSetData($txtWallMinElixir, $itxtWallMinElixir)

	;Dark Troops---------------------------------------------
	If $ichkDarkTroop = 1 Then
		GUICtrlSetState($chkDarkTroop, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDarkTroop, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbDarkBarrack1, $DarkBarrackTroop[0])
	_GUICtrlComboBox_SetCurSel($cmbDarkBarrack2, $DarkBarrackTroop[1])
	GUICtrlSetData($txtDarkBarrack1, $itxtDarkBarrack1)
	GUICtrlSetData($txtDarkBarrack2, $itxtDarkBarrack2)

	;Spell Settings--------------------------------------------------------------------------
	If $ichkMakeSpells = 1 Then
		GUICtrlSetState($chkMakeSpells, $GUI_CHECKED)
		GUICtrlSetState($cmbSpellCreate, $GUI_ENABLE)
		GUICtrlSetState($txtDENukeLimit, $GUI_ENABLE)
		GUICtrlSetState($txtSpellNumber, $GUI_ENABLE)
		GUICtrlSetState($chkNukeAttacking, $GUI_ENABLE)
		GUICtrlSetState($chkNukeOnly, $GUI_ENABLE)
		GUICtrlSetState($chkNukeOnlyWithFullArmy, $GUI_ENABLE)
	Else
		GUICtrlSetState($chkMakeSpells, $GUI_UNCHECKED)
		GUICtrlSetState($cmbSpellCreate, $GUI_DISABLE)
		GUICtrlSetState($txtDENukeLimit, $GUI_DISABLE)
		GUICtrlSetState($txtSpellNumber, $GUI_DISABLE)
		GUICtrlSetState($chkNukeAttacking, $GUI_DISABLE)
		GUICtrlSetState($chkNukeOnly, $GUI_DISABLE)
		GUICtrlSetState($chkNukeOnlyWithFullArmy, $GUI_DISABLE)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbSpellCreate, $iSpellSelection)
	GUICtrlSetData($txtDENukeLimit, $iNukeLimit)
	GUICtrlSetData($txtSpellNumber, $iSpellNumber)
	If $ichkNukeAttacking = 1 Then
		GUICtrlSetState($chkNukeAttacking, $GUI_CHECKED)
		GUICtrlSetState($txtSpellNumber, $GUI_ENABLE)
	Else
		GUICtrlSetState($chkNukeAttacking, $GUI_UNCHECKED)
		GUICtrlSetState($txtSpellNumber, $GUI_DISABLE)
	EndIf
	If $ichkNukeOnly = 1 Then
		GUICtrlSetState($chkNukeOnly, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkNukeOnly, $GUI_UNCHECKED)
	EndIf
	If $ichkNukeOnlyWithFullArmy = 1 Then
		GUICtrlSetState($chkNukeOnlyWithFullArmy, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkNukeOnlyWithFullArmy, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($txtSpellCap, $itxtspellCap)
	If $DESearchMode = 1 Then
		GUICtrlSetState($rdoMaybeSkip, $GUI_CHECKED)
		GUICtrlSetState($rdoFalsePositive, $GUI_UNCHECKED)
	Else
		GUICtrlSetState($rdoMaybeSkip, $GUI_UNCHECKED)
		GUICtrlSetState($rdoFalsePositive, $GUI_CHECKED)
	EndIf

	;General Settings--------------------------------------------------------------------------
	If $frmBotPosX <> -32000 Then WinMove($sBotTitle, "", $frmBotPosX, $frmBotPosY)
	GUICtrlSetData($txtMinimumTrophy, $itxtMinTrophy)
	GUICtrlSetData($txtMaxTrophy, $itxtMaxTrophy)
	;Misc Settings--------------------------------------------------------------------------
	If $ichkCollect = 1 Then
		GUICtrlSetState($chkCollect, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkCollect, $GUI_UNCHECKED)
	EndIf
	If $ichkAvoidEdge = 1 Then
		GUICtrlSetState($chkAvoidEdge, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAvoidEdge, $GUI_UNCHECKED)
	EndIf
	If $TakeAttackSnapShot = 1 Then
		GUICtrlSetState($chkTakeAttackSS, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTakeAttackSS, $GUI_UNCHECKED)
	EndIf
	If $DebugMode = 1 Then
		GUICtrlSetState($chkDebug, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDebug, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($txtReconnect, $itxtReconnect)
	GUICtrlSetData($txtReturnh, $itxtReturnh)
	GUICtrlSetData($txtKingSkill, $itxtKingSkill)
	GUICtrlSetData($txtQueenSkill, $itxtQueenSkill)
	_GUICtrlComboBox_SetCurSel($cmbSearchsp, $icmbSearchsp)
	If $ichkTrap = 1 Then
		GUICtrlSetState($chkTrap, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTrap, $GUI_UNCHECKED)
	EndIf
	If $WideEdge = 1 Then
		GUICtrlSetState($chkWideEdge, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkWideEdge, $GUI_UNCHECKED)
	EndIf

	If $ichkBackground = 1 Then
		GUICtrlSetState($chkBackground, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkBackground, $GUI_UNCHECKED)
	EndIf
	chkBackground() ;Applies it to hidden button

	If $ichkBotStop = 1 Then
		GUICtrlSetState($chkBotStop, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkBotStop, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbBotCommand, $icmbBotCommand)
	_GUICtrlComboBox_SetCurSel($cmbBotCond, $icmbBotCond)

	If $ichkForceBS = 1 Then
		GUICtrlSetState($chkForceBS, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkForceBS, $GUI_UNCHECKED)
	EndIf

	;Push Bullet
	If $PushBulletEnabled = 1 Then
		GUICtrlSetState($lblpushbulletenabled, $GUI_CHECKED)
	Else
		GUICtrlSetState($lblpushbulletenabled, $GUI_UNCHECKED)
	EndIf

	GUICtrlSetData($pushbullettokenvalue, $PushBullettoken)

	If $PushBulletvillagereport = 1 Then
		GUICtrlSetState($lblvillagereport, $GUI_CHECKED)
	Else
		GUICtrlSetState($lblvillagereport, $GUI_UNCHECKED)
	EndIf

	If $PushBulletmatchfound = 1 Then
		GUICtrlSetState($lblmatchfound, $GUI_CHECKED)
	Else
		GUICtrlSetState($lblmatchfound, $GUI_UNCHECKED)
	EndIf

	If $PushBulletlastraid = 1 Then
		GUICtrlSetState($lbllastraid, $GUI_CHECKED)
	Else
		GUICtrlSetState($lbllastraid, $GUI_UNCHECKED)
	EndIf

	If $PushBulletdebug = 1 Then
		GUICtrlSetState($lblpushbulletdebug, $GUI_CHECKED)
	Else
		GUICtrlSetState($lblpushbulletdebug, $GUI_UNCHECKED)
	EndIf

	If $PushBulletremote = 1 Then
		GUICtrlSetState($lblpushbulletremote, $GUI_CHECKED)
	Else
		GUICtrlSetState($lblpushbulletremote, $GUI_UNCHECKED)
	EndIf

	If $PushBulletdelete = 1 Then
		GUICtrlSetState($lblpushbulletdelete, $GUI_CHECKED)
	Else
		GUICtrlSetState($lblpushbulletdelete, $GUI_UNCHECKED)
	EndIf

	If $PushBulletfreebuilder = 1 Then
		GUICtrlSetState($lblfreebuilder, $GUI_CHECKED)
	Else
		GUICtrlSetState($lblfreebuilder, $GUI_UNCHECKED)
	EndIf

	If $PushBullettype = 1 Then
		GUICtrlSetState($UseJPG, $GUI_CHECKED)
	Else
		GUICtrlSetState($UseJPG, $GUI_UNCHECKED)
	EndIf

	If $PushBulletattacktype = 1 Then
		GUICtrlSetState($UseAttackJPG, $GUI_CHECKED)
	Else
		GUICtrlSetState($UseAttackJPG, $GUI_UNCHECKED)
	EndIf

	lblpushbulletenabled()

	If $ichkNoAttack = 1 Then
		GUICtrlSetState($chkNoAttack, $GUI_CHECKED)
		GUICtrlSetState($chkAnyActivate, $GUI_UNCHECKED)
		GUICtrlSetState($chkDeadActivate, $GUI_UNCHECKED)
		GUICtrlSetState($chkAnyActivate, $GUI_DISABLE)
		GUICtrlSetState($chkDeadActivate, $GUI_DISABLE)
		GUICtrlSetState($lblpushbulletenabled, $GUI_UNCHECKED)
		GUICtrlSetState($lblpushbulletenabled, $GUI_DISABLE)
		chkDeadActivate()
		chkAnyActivate()
		lblpushbulletenabled()
	Else
		GUICtrlSetState($chkNoAttack, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateOnly = 1 Then
		GUICtrlSetState($chkDonateOnly, $GUI_CHECKED)
		GUICtrlSetState($chkAnyActivate, $GUI_UNCHECKED)
		GUICtrlSetState($chkDeadActivate, $GUI_UNCHECKED)
		GUICtrlSetState($chkAnyActivate, $GUI_DISABLE)
		GUICtrlSetState($chkDeadActivate, $GUI_DISABLE)
		GUICtrlSetState($lblpushbulletenabled, $GUI_UNCHECKED)
		GUICtrlSetState($lblpushbulletenabled, $GUI_DISABLE)
		chkDeadActivate()
		chkAnyActivate()
		lblpushbulletenabled()
	Else
		GUICtrlSetState($chkDonateOnly, $GUI_UNCHECKED)
	EndIf

	If $ichkUpdate = 1 Then
		GUICtrlSetState($chkUpdate, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkUpdate, $GUI_UNCHECKED)
	EndIf
EndFunc   ;==>applyConfig

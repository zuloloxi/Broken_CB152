Opt("GUIOnEventMode", 1)
Opt("MouseClickDelay", 10)
Opt("MouseClickDownDelay", 10)
Opt("TrayMenuMode", 3)

_GDIPlus_Startup()

Global Const $64Bit = StringInStr(@OSArch, "64") > 0
Global Const $DEFAULT_HEIGHT = 720
Global Const $DEFAULT_WIDTH = 860
Global $Initiate = 0
Global Const $REGISTRY_KEY_DIRECTORY = "HKEY_LOCAL_MACHINE\SOFTWARE\BlueStacks\Guests\Android\FrameBuffer\0"

Func GUIControl($hWind, $iMsg, $wParam, $lParam)
	Local $nNotifyCode = BitShift($wParam, 16)
	Local $nID = BitAND($wParam, 0x0000FFFF)
	Local $hCtrl = $lParam
	#forceref $hWind, $iMsg, $wParam, $lParam
	Switch $iMsg
		Case 273
			Switch $nID
				Case $GUI_EVENT_CLOSE
					SetLog("Exiting !!!", $COLOR_ORANGE)
					_GDIPlus_Shutdown()
					_GUICtrlRichEdit_Destroy($txtLog)
					SaveConfig()
					Exit
				Case $btnStop
					If $RunState Then btnStop()
				Case $btnAtkNow
					If $RunState Then btnAtkNow()
				Case $btnHide
					If $RunState Then btnHide()
				Case $cmbTroopComp
					cmbTroopComp()
				Case $chkRequest
					chkRequest()
				Case $chkMakeSpells
					chkMakeSpells()
				Case $chkNukeAttacking
					chkNukeAttacking()
				Case $chkNukeOnly
					chkNukeOnly()
				Case $chkNukeOnlyWithFullArmy
					chkNukeOnlyWithFullArmy()
				Case $cmbSpellCreate
					cmbSpellCreate()
				Case $tabMain
					tabMain()
				Case $Randomspeedatk
					Randomspeedatk()
				Case $chkNoAttack
					If GUICtrlRead($chkNoAttack) = $GUI_CHECKED Then
						If GUICtrlRead($lblpushbulletenabled) = $GUI_CHECKED Then
							SetLog("PushBullet is disabled !!!", $COLOR_RED)
						EndIf
						GUICtrlSetState($chkDonateOnly, $GUI_UNCHECKED)
						GUICtrlSetState($expMode, $GUI_UNCHECKED)
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
						GUICtrlSetState($chkAnyActivate, $GUI_ENABLE)
						GUICtrlSetState($chkDeadActivate, $GUI_ENABLE)
						GUICtrlSetState($lblpushbulletenabled, $GUI_ENABLE)
					EndIf
				Case $chkDonateOnly
					If GUICtrlRead($chkDonateOnly) = $GUI_CHECKED Then
						If GUICtrlRead($lblpushbulletenabled) = $GUI_CHECKED Then
							SetLog("PushBullet is disabled !!!", $COLOR_RED)
						EndIf
						GUICtrlSetState($chkNoAttack, $GUI_UNCHECKED)
						GUICtrlSetState($expMode, $GUI_UNCHECKED)
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
						GUICtrlSetState($chkAnyActivate, $GUI_ENABLE)
						GUICtrlSetState($chkDeadActivate, $GUI_ENABLE)
						GUICtrlSetState($lblpushbulletenabled, $GUI_ENABLE)
					EndIf
			    Case $expMode
					If GUICtrlRead($expMode) = $GUI_CHECKED Then
						If GUICtrlRead($lblpushbulletenabled) = $GUI_CHECKED Then
							SetLog("PushBullet is disabled !!!", $COLOR_RED)
						EndIf
						GUICtrlSetState($chkNoAttack, $GUI_UNCHECKED)
						GUICtrlSetState($chkDonateOnly, $GUI_UNCHECKED)
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
						GUICtrlSetState($chkAnyActivate, $GUI_ENABLE)
						GUICtrlSetState($chkDeadActivate, $GUI_ENABLE)
						GUICtrlSetState($lblpushbulletenabled, $GUI_ENABLE)
					EndIf
				Case $chkUpgrade1
					chkUpgrade1()
				Case $chkUpgrade2
					chkUpgrade2()
				Case $chkUpgrade3
					chkUpgrade3()
				Case $chkUpgrade4
					chkUpgrade4()
				Case $chkUpgrade5
					chkUpgrade5()
				Case $chkUpgrade6
					chkUpgrade6()
				Case $UseJPG
					UseJPG()
				Case $UseAttackJPG
					UseAttackJPG()
				Case $chkDeadActivate
					chkDeadActivate()
				Case $chkAnyActivate
					chkAnyActivate()
				Case $lblpushbulletenabled
					lblpushbulletenabled()
				Case $rdoMaybeSkip
					rdoMaybeSkip()
				Case $rdoFalsePositive
					rdoMaybeSkip()
				Case $btnGitHub
					ShellExecute("https://github.com/cool7su/Broken_Clashbot/issues")
				Case $btnCloseBR
					GUISetState(@SW_ENABLE, $frmBot)
					GUISetState(@SW_HIDE, $frmBugReport)
					WinActivate($frmBot)
				Case $imgLogo
					openWebsite()
			EndSwitch
		Case 274
			Switch $wParam
				Case 0xf060
					SetLog("Exiting !!!", $COLOR_ORANGE)
					_GDIPlus_Shutdown()
					_GUICtrlRichEdit_Destroy($txtLog)
					SaveConfig()
					Exit
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>GUIControl

Func SetTime()
	Local $time = _TicksToTime(Int(TimerDiff($sTimer)), $hour, $min, $sec)
	If _GUICtrlTab_GetCurSel($tabMain) = 10 Then GUICtrlSetData($lblresultruntime, StringFormat("%02i:%02i:%02i", $hour, $min, $sec))
	;SetLOG(StringFormat("%02i:%02i:%02i", $hour, $min, $sec))
	If GUICtrlRead($lblpushbulletremote) = $GUI_CHECKED Then
		If StringFormat("%02i", $sec) = "50" Then
			_RemoteControl()
		EndIf
	EndIf
EndFunc   ;==>SetTime

Func Initiate()
	If IsArray(ControlGetPos($Title, "_ctl.Window", "[CLASS:BlueStacksApp; INSTANCE:1]")) Then
		Local $BSsize = [ControlGetPos($Title, "_ctl.Window", "[CLASS:BlueStacksApp; INSTANCE:1]")[2], ControlGetPos($Title, "_ctl.Window", "[CLASS:BlueStacksApp; INSTANCE:1]")[3]]
		Local $fullScreenRegistryData = RegRead($REGISTRY_KEY_DIRECTORY, "FullScreen")
		Local $guestHeightRegistryData = RegRead($REGISTRY_KEY_DIRECTORY, "GuestHeight")
		Local $guestWidthRegistryData = RegRead($REGISTRY_KEY_DIRECTORY, "GuestWidth")
		Local $windowHeightRegistryData = RegRead($REGISTRY_KEY_DIRECTORY, "WindowHeight")
		Local $windowWidthRegistryData = RegRead($REGISTRY_KEY_DIRECTORY, "WindowWidth")

		Local $BSx = ($BSsize[0] > $BSsize[1]) ? $BSsize[0] : $BSsize[1]
		Local $BSy = ($BSsize[0] > $BSsize[1]) ? $BSsize[1] : $BSsize[0]

		$RunState = True

		If $BSx <> 860 Or $BSy <> 720 Then
			RegWrite($REGISTRY_KEY_DIRECTORY, "FullScreen", "REG_DWORD", "0")
			RegWrite($REGISTRY_KEY_DIRECTORY, "GuestHeight", "REG_DWORD", $DEFAULT_HEIGHT)
			RegWrite($REGISTRY_KEY_DIRECTORY, "GuestWidth", "REG_DWORD", $DEFAULT_WIDTH)
			RegWrite($REGISTRY_KEY_DIRECTORY, "WindowHeight", "REG_DWORD", $DEFAULT_HEIGHT)
			RegWrite($REGISTRY_KEY_DIRECTORY, "WindowWidth", "REG_DWORD", $DEFAULT_WIDTH)
			SetLog("Please restart your computer for the applied changes to take effect.", $COLOR_ORANGE)
			_Sleep(3000)
			$MsgRet = MsgBox(BitOR($MB_OKCANCEL, $MB_SYSTEMMODAL), "Restart Computer", "Restart your computer for the applied changes to take effect." & @CRLF & "If your BlueStacks is the correct size  (860 x 720), click OK.", 10)
			If $MsgRet <> $IDOK Then
				btnStop()
				Return
			EndIf
		EndIf

		WinActivate($Title)

		SetLog("~~~~Welcome to " & $sBotTitle & "!~~~~", $COLOR_PURPLE)
		SetLog($Compiled & " running on " & @OSArch & " OS", $COLOR_GREEN)
		SetLog("Bot is starting...", $COLOR_ORANGE)

		If GUICtrlRead($lblpushbulletenabled) = $GUI_CHECKED And GUICtrlRead($lblpushbulletdelete) = $GUI_CHECKED Then
			_DeletePush()
		EndIf

		$AttackNow = False
		$FirstStart = True
		$Checkrearm = True
		GUICtrlSetState($cmbBoostBarracks, $GUI_DISABLE)
		GUICtrlSetState($btnLocateDarkBarracks, $GUI_DISABLE)
		GUICtrlSetState($btnLocateBarracks, $GUI_DISABLE)
		GUICtrlSetState($btnLocateCamp, $GUI_DISABLE)
		GUICtrlSetState($btnFindWall, $GUI_DISABLE)
		GUICtrlSetState($btnSearchMode, $GUI_DISABLE)
		GUICtrlSetState($cmbTroopComp, $GUI_DISABLE)
		GUICtrlSetState($chkBackground, $GUI_DISABLE)
		GUICtrlSetState($chkNoAttack, $GUI_DISABLE)
		GUICtrlSetState($chkDonateOnly, $GUI_DISABLE)
		GUICtrlSetState($chkForceBS, $GUI_DISABLE)
		GUICtrlSetState($txtCapacity, $GUI_DISABLE)
		GUICtrlSetState($cmbRaidcap, $GUI_DISABLE)
		GUICtrlSetState($btnLocateClanCastle, $GUI_DISABLE)
		GUICtrlSetState($btnLocateTownHall, $GUI_DISABLE)
		GUICtrlSetState($btnLocateKingAltar, $GUI_DISABLE)
		GUICtrlSetState($btnLocateQueenAltar, $GUI_DISABLE)
		GUICtrlSetState($btnLoad, $GUI_DISABLE)
		GUICtrlSetState($btnSave, $GUI_DISABLE)
		GUICtrlSetState($btnLocateClanCastle2, $GUI_DISABLE)
		GUICtrlSetState($btnLocateSFactory, $GUI_DISABLE)
		GUICtrlSetState($cmbDeadAttackTH, $GUI_DISABLE)
		GUICtrlSetState($cmbAttackTH, $GUI_DISABLE)
		$sTimer = TimerInit()
		AdlibRegister("SetTime", 1000)
		runBot()
	Else
		SetLog("Not in Game!", $COLOR_RED)
		btnStop()
	EndIf
EndFunc   ;==>Initiate

Func Open()
	If $64Bit Then ;If 64-Bit
		ShellExecute("C:\Program Files (x86)\BlueStacks\HD-StartLauncher.exe")
		SetLog("Starting BlueStacks", $COLOR_GREEN)
		Sleep(290)
		SetLog("Waiting for BlueStacks to initiate...", $COLOR_GREEN)
		Check()
	Else ;If 32-Bit
		ShellExecute("C:\Program Files\BlueStacks\HD-StartLauncher.exe")
		SetLog("Starting BlueStacks", $COLOR_GREEN)
		Sleep(290)
		SetLog("Waiting for BlueStacks to initiate...", $COLOR_GREEN)
		Check()
	EndIf
EndFunc   ;==>Open

Func Check()
	If IsArray(ControlGetPos($Title, "_ctl.Window", "[CLASS:BlueStacksApp; INSTANCE:1]")) Then
		SetLog("BlueStacks Loaded, took " & ($Initiate) & " seconds to begin.", $COLOR_GREEN)
		Initiate()
	Else
		Sleep(1000)
		$Initiate = $Initiate + 1

		Check()
	EndIf
EndFunc   ;==>Check

Func btnStart()
	GUICtrlSetState($btnStart, $GUI_HIDE)
	GUICtrlSetState($btnStop, $GUI_SHOW)
	$FirstAttack = 0

	CreateLogFile()

	SaveConfig()
	readConfig()
	applyConfig()

	_GUICtrlEdit_SetText($txtLog, "")

	If WinExists($Title) Then
		DisableBS($HWnD, $SC_MINIMIZE)
		DisableBS($HWnD, $SC_CLOSE)
		Initiate()
	Else
		Open()
	EndIf
EndFunc   ;==>btnStart

Func btnStop()
	If $RunState Then
		$Raid = 0
		$PauseBot = False
		$RunState = False
		$AttackNow = False
		EnableBS($HWnD, $SC_MINIMIZE)
		EnableBS($HWnD, $SC_CLOSE)
		GUICtrlSetState($btnLocateBarracks, $GUI_ENABLE)
		GUICtrlSetState($btnLocateDarkBarracks, $GUI_ENABLE)
		GUICtrlSetState($btnSearchMode, $GUI_ENABLE)
		GUICtrlSetState($cmbTroopComp, $GUI_ENABLE)
		;GUICtrlSetState($btnLocateCollectors, $GUI_ENABLE)
		GUICtrlSetState($btnLocateSFactory, $GUI_ENABLE)
		GUICtrlSetState($btnLocateClanCastle, $GUI_ENABLE)
		GUICtrlSetState($btnLocateTownHall, $GUI_ENABLE)
		GUICtrlSetState($btnLocateKingAltar, $GUI_ENABLE)
		GUICtrlSetState($btnLocateQueenAltar, $GUI_ENABLE)
		GUICtrlSetState($btnLocateCamp, $GUI_ENABLE)
		GUICtrlSetState($btnFindWall, $GUI_ENABLE)
		GUICtrlSetState($chkBackground, $GUI_ENABLE)
		GUICtrlSetState($chkNoAttack, $GUI_ENABLE)
		GUICtrlSetState($chkDonateOnly, $GUI_ENABLE)
		GUICtrlSetState($chkForceBS, $GUI_ENABLE)
		GUICtrlSetState($txtCapacity, $GUI_ENABLE)
		GUICtrlSetState($cmbRaidcap, $GUI_ENABLE)
		GUICtrlSetState($cmbDeadAttackTH, $GUI_ENABLE)
		GUICtrlSetState($cmbAttackTH, $GUI_ENABLE)
		GUICtrlSetState($btnLocateClanCastle2, $GUI_ENABLE)
		GUICtrlSetState($chkBackground, $GUI_ENABLE)
		GUICtrlSetState($cmbBoostBarracks, $GUI_ENABLE)
		GUICtrlSetState($btnAtkNow, $GUI_DISABLE)
		GUICtrlSetState($btnStart, $GUI_SHOW)
		GUICtrlSetState($btnStop, $GUI_HIDE)
		GUICtrlSetState($btnLoad, $GUI_ENABLE)
		GUICtrlSetState($btnSave, $GUI_ENABLE)

		;AdlibUnRegister("SetTime")
		_BlockInputEx(0, "", "", $HWnD)

		FileClose($hLogFileHandle)
		SetLog("ClashBot has stopped", $COLOR_ORANGE)
	EndIf
EndFunc   ;==>btnStop

Func btnAtkNow()
	$AttackNow = True
	GUICtrlSetState($btnAtkNow, $GUI_DISABLE)
EndFunc   ;==>btnAtkNow

Func btnLocateBarracks()
	$RunState = True
	While 1
		ZoomOut()
		LocateBarrack()
		ExitLoop
	WEnd
	$RunState = False
EndFunc   ;==>btnLocateBarracks

Func btnLocateDarkBarracks()
	$RunState = True
	While 1
		ZoomOut()
		LocateDarkBarrack()
		ExitLoop
	WEnd
	$RunState = False
EndFunc   ;==>btnLocateDarkBarracks

Func btnLocateSFactory()
	$RunState = True
	While 1
		ZoomOut()
		LocateSpellFactory()
		ExitLoop
	WEnd
	$RunState = False
EndFunc   ;==>btnLocateSFactory

Func btnLocateClanCastle()
	$RunState = True
	While 1
		ZoomOut()
		LocateClanCastle()
		ExitLoop
	WEnd
	$RunState = False
EndFunc   ;==>btnLocateClanCastle

Func btnLocateTownHall()
	$RunState = True
	While 1
		ZoomOut()
		LocateTownHall()
		ExitLoop
	WEnd
	$RunState = False
EndFunc   ;==>btnLocateTownHall

Func btnLocateKingAltar()
	$RunState = True
	While 1
		ZoomOut()
		LocateKingAltar()
		ExitLoop
	WEnd
	$RunState = False
EndFunc   ;==>btnLocateKingAltar

Func btnLocateQueenAltar()
	$RunState = True
	While 1
		ZoomOut()
		LocateQueenAltar()
		ExitLoop
	WEnd
	$RunState = False
EndFunc   ;==>btnLocateQueenAltar

Func btnLocatelist()
	$RunState = True
	ZoomOut()
	LocateBuilding()
	$RunState = False
EndFunc   ;==>btnLocatelist
Func btnLocateUp1()
	$RunState = True
	While 1
		ZoomOut()
		LocateUpgrade1()
		ExitLoop
	WEnd
	$RunState = False
EndFunc   ;==>btnLocateUp1

Func btnLocateUp2()
	$RunState = True
	While 1
		ZoomOut()
		LocateUpgrade2()
		ExitLoop
	WEnd
	$RunState = False
EndFunc   ;==>btnLocateUp2

Func btnLocateUp3()
	$RunState = True
	While 1
		ZoomOut()
		LocateUpgrade3()
		ExitLoop
	WEnd
	$RunState = False
EndFunc   ;==>btnLocateUp3
Func btnLocateUp4()
	$RunState = True
	While 1
		ZoomOut()
		LocateUpgrade4()
		ExitLoop
	WEnd
	$RunState = False
EndFunc   ;==>btnLocateUp4

Func btnLocateUp5()
	$RunState = True
	While 1
		ZoomOut()
		LocateUpgrade5()
		ExitLoop
	WEnd
	$RunState = False
EndFunc   ;==>btnLocateUp5

Func btnLocateUp6()
	$RunState = True
	While 1
		ZoomOut()
		LocateUpgrade6()
		ExitLoop
	WEnd
	$RunState = False
EndFunc   ;==>btnLocateUp6

Func btnFindWall()
	$RunState = True
	GUICtrlSetState($chkWalls, $GUI_DISABLE)
	GUICtrlSetState($UseGold, $GUI_DISABLE)
	GUICtrlSetState($UseElixir, $GUI_DISABLE)
	GUICtrlSetState($UseGoldElix, $GUI_DISABLE)
	While 1
		SaveConfig()
		readConfig()
		applyConfig()
		ZoomOut()
		FindWall()
		ExitLoop
	WEnd
	GUICtrlSetState($chkWalls, $GUI_ENABLE)
	GUICtrlSetState($UseGold, $GUI_ENABLE)
	GUICtrlSetState($UseElixir, $GUI_ENABLE)
	GUICtrlSetState($UseGoldElix, $GUI_ENABLE)
	$RunState = False
EndFunc   ;==>btnFindWall

Func btnLocateCamp()
	$RunState = True
	While 1
		ZoomOut()
		Locatecamp()
		ExitLoop
	WEnd
	$RunState = False
EndFunc   ;==>btnLocateCamp

Func btnDeletelist()
	DeleteList()
EndFunc   ;==>btnDeletelist

Func btnSearchMode()
	While 1
		GUICtrlSetState($btnStart, $GUI_HIDE)
		GUICtrlSetState($btnStop, $GUI_SHOW)

		GUICtrlSetState($btnLocateBarracks, $GUI_DISABLE)
		GUICtrlSetState($btnLocateDarkBarracks, $GUI_DISABLE)
		GUICtrlSetState($btnSearchMode, $GUI_DISABLE)
		GUICtrlSetState($cmbTroopComp, $GUI_DISABLE)
		GUICtrlSetState($chkBackground, $GUI_DISABLE)
		;GUICtrlSetState($btnLocateCollectors, $GUI_DISABLE)

		$RunState = True
		VillageSearch($TakeAllTownSnapShot)
		$RunState = False

		GUICtrlSetState($btnStart, $GUI_SHOW)
		GUICtrlSetState($btnStop, $GUI_HIDE)

		GUICtrlSetState($btnLocateBarracks, $GUI_ENABLE)
		GUICtrlSetState($btnLocateDarkBarracks, $GUI_ENABLE)
		GUICtrlSetState($btnSearchMode, $GUI_ENABLE)
		GUICtrlSetState($cmbTroopComp, $GUI_ENABLE)
		GUICtrlSetState($chkBackground, $GUI_ENABLE)
		;GUICtrlSetState($btnLocateCollectors, $GUI_ENABLE)
		ExitLoop
	WEnd
EndFunc   ;==>btnSearchMode

Func btnHide()
	If $Hide = False Then
		GUICtrlSetData($btnHide, "Show BS")
		$botPos[0] = WinGetPos($Title)[0]
		$botPos[1] = WinGetPos($Title)[1]
		WinMove($Title, "", -32000, -32000)
		$Hide = True
	Else
		GUICtrlSetData($btnHide, "Hide BS")

		If $botPos[0] = -32000 Then
			WinMove($Title, "", 0, 0)
		Else
			WinMove($Title, "", $botPos[0], $botPos[1])
			WinActivate($Title)
		EndIf
		$Hide = False
	EndIf
EndFunc   ;==>btnHide

Func cmbTroopComp()
	If _GUICtrlComboBox_GetCurSel($cmbTroopComp) <> $icmbTroopComp Then
		$icmbTroopComp = _GUICtrlComboBox_GetCurSel($cmbTroopComp)
		$ArmyComp = 0
		$CurArch = 1
		$CurBarb = 1
		$CurGoblin = 1
		$CurGiant = 1
		$CurWB = 1
		SetComboTroopComp()
		_GUICtrlComboBox_SetCurSel($cmbAlgorithm, $icmbTroopComp)
		_GUICtrlComboBox_SetCurSel($cmbDeadAlgorithm, $icmbTroopComp)
	EndIf
EndFunc   ;==>cmbTroopComp

Func SetComboTroopComp()
	Switch _GUICtrlComboBox_GetCurSel($cmbTroopComp)
		Case 0
			GUICtrlSetState($cmbBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack2, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack3, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack4, $GUI_DISABLE)
			;			GUICtrlSetState($txtCapacity, $GUI_ENABLE)
			GUICtrlSetState($txtBarbarians, $GUI_DISABLE)
			GUICtrlSetState($txtArchers, $GUI_DISABLE)
			GUICtrlSetState($txtGoblins, $GUI_DISABLE)
			GUICtrlSetState($txtNumGiants, $GUI_DISABLE)
			GUICtrlSetState($txtNumWallbreakers, $GUI_DISABLE)

			GUICtrlSetState($chkDarkTroop, $GUI_UNCHECKED)
			GUICtrlSetState($chkDarkTroop, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack2, $GUI_DISABLE)
			GUICtrlSetState($txtDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($txtDarkBarrack2, $GUI_DISABLE)

			; Begin Section - Allow composition change
			GUICtrlSetData($txtBarbarians, $BarbariansComp)
			GUICtrlSetData($txtArchers, $ArchersComp)
			GUICtrlSetData($txtNumGiants, $GiantsComp)
			GUICtrlSetData($txtGoblins, $GoblinsComp)
			GUICtrlSetData($txtNumWallbreakers, $GoblinsComp)
			GUICtrlSetData($txtBarbarians, "0")
			GUICtrlSetData($txtArchers, "100")
			GUICtrlSetData($txtGoblins, "0")

			GUICtrlSetData($txtNumGiants, "0")
			GUICtrlSetData($txtNumWallbreakers, "0")

			GUICtrlSetState($txtFirstTroop1, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop2, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop3, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop4, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop1, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop2, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop3, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop4, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop1, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop2, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop3, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop4, $GUI_DISABLE)
			; End Section - Allow composition chagne
		Case 1
			GUICtrlSetState($cmbBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack2, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack3, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack4, $GUI_DISABLE)
			;			GUICtrlSetState($txtCapacity, $GUI_ENABLE)
			GUICtrlSetState($txtBarbarians, $GUI_DISABLE)
			GUICtrlSetState($txtArchers, $GUI_DISABLE)
			GUICtrlSetState($txtGoblins, $GUI_DISABLE)
			GUICtrlSetState($txtNumGiants, $GUI_DISABLE)
			GUICtrlSetState($txtNumWallbreakers, $GUI_DISABLE)

			GUICtrlSetState($chkDarkTroop, $GUI_UNCHECKED)
			GUICtrlSetState($chkDarkTroop, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack2, $GUI_DISABLE)
			GUICtrlSetState($txtDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($txtDarkBarrack2, $GUI_DISABLE)

			GUICtrlSetData($txtBarbarians, "100")
			GUICtrlSetData($txtArchers, "0")
			GUICtrlSetData($txtGoblins, "0")

			GUICtrlSetData($txtNumGiants, "0")
			GUICtrlSetData($txtNumWallbreakers, "0")

			GUICtrlSetState($txtFirstTroop1, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop2, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop3, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop4, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop1, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop2, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop3, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop4, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop1, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop2, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop3, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop4, $GUI_DISABLE)
		Case 2
			GUICtrlSetState($cmbBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack2, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack3, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack4, $GUI_DISABLE)
			;			GUICtrlSetState($txtCapacity, $GUI_ENABLE)
			GUICtrlSetState($txtBarbarians, $GUI_DISABLE)
			GUICtrlSetState($txtArchers, $GUI_DISABLE)
			GUICtrlSetState($txtGoblins, $GUI_DISABLE)
			GUICtrlSetState($txtNumGiants, $GUI_DISABLE)
			GUICtrlSetState($txtNumWallbreakers, $GUI_DISABLE)

			GUICtrlSetState($chkDarkTroop, $GUI_UNCHECKED)
			GUICtrlSetState($chkDarkTroop, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack2, $GUI_DISABLE)
			GUICtrlSetState($txtDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($txtDarkBarrack2, $GUI_DISABLE)

			GUICtrlSetData($txtBarbarians, "0")
			GUICtrlSetData($txtArchers, "0")
			GUICtrlSetData($txtGoblins, "100")

			GUICtrlSetData($txtNumGiants, "0")
			GUICtrlSetData($txtNumWallbreakers, "0")

			GUICtrlSetState($txtFirstTroop1, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop2, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop3, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop4, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop1, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop2, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop3, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop4, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop1, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop2, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop3, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop4, $GUI_DISABLE)
		Case 3
			GUICtrlSetState($cmbBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack2, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack3, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack4, $GUI_DISABLE)
			;			GUICtrlSetState($txtCapacity, $GUI_ENABLE)
			GUICtrlSetState($txtBarbarians, $GUI_ENABLE)
			GUICtrlSetState($txtArchers, $GUI_ENABLE)
			GUICtrlSetState($txtGoblins, $GUI_DISABLE)
			GUICtrlSetState($txtNumGiants, $GUI_DISABLE)
			GUICtrlSetState($txtNumWallbreakers, $GUI_DISABLE)

			GUICtrlSetState($chkDarkTroop, $GUI_UNCHECKED)
			GUICtrlSetState($chkDarkTroop, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack2, $GUI_DISABLE)
			GUICtrlSetState($txtDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($txtDarkBarrack2, $GUI_DISABLE)

			GUICtrlSetData($txtBarbarians, $BarbariansComp)
			GUICtrlSetData($txtArchers, $ArchersComp)
			GUICtrlSetData($txtGoblins, "0")

			GUICtrlSetData($txtNumGiants, "0")
			GUICtrlSetData($txtNumWallbreakers, "0")

			GUICtrlSetState($txtFirstTroop1, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop2, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop3, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop4, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop1, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop2, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop3, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop4, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop1, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop2, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop3, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop4, $GUI_DISABLE)
		Case 4
			GUICtrlSetState($cmbBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack2, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack3, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack4, $GUI_DISABLE)
			;			GUICtrlSetState($txtCapacity, $GUI_ENABLE)
			GUICtrlSetState($txtBarbarians, $GUI_ENABLE)
			GUICtrlSetState($txtArchers, $GUI_ENABLE)
			GUICtrlSetState($txtGoblins, $GUI_ENABLE)
			GUICtrlSetState($txtNumGiants, $GUI_ENABLE)
			GUICtrlSetState($txtNumWallbreakers, $GUI_DISABLE)

			GUICtrlSetState($chkDarkTroop, $GUI_UNCHECKED)
			GUICtrlSetState($chkDarkTroop, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack2, $GUI_DISABLE)
			GUICtrlSetState($txtDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($txtDarkBarrack2, $GUI_DISABLE)

			GUICtrlSetData($txtBarbarians, $BarbariansComp)
			GUICtrlSetData($txtArchers, $ArchersComp)
			GUICtrlSetData($txtGoblins, $GoblinsComp)

			GUICtrlSetData($txtNumGiants, $GiantsComp)
			GUICtrlSetData($txtNumWallbreakers, "0")

			GUICtrlSetState($txtFirstTroop1, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop2, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop3, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop4, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop1, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop2, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop3, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop4, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop1, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop2, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop3, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop4, $GUI_DISABLE)
		Case 5
			GUICtrlSetState($cmbBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack2, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack3, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack4, $GUI_DISABLE)
			;			GUICtrlSetState($txtCapacity, $GUI_ENABLE)
			GUICtrlSetState($txtBarbarians, $GUI_ENABLE)
			GUICtrlSetState($txtArchers, $GUI_ENABLE)
			GUICtrlSetState($txtGoblins, $GUI_DISABLE)
			GUICtrlSetState($txtNumGiants, $GUI_ENABLE)
			GUICtrlSetState($txtNumWallbreakers, $GUI_DISABLE)

			GUICtrlSetState($chkDarkTroop, $GUI_UNCHECKED)
			GUICtrlSetState($chkDarkTroop, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack2, $GUI_DISABLE)
			GUICtrlSetState($txtDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($txtDarkBarrack2, $GUI_DISABLE)

			GUICtrlSetData($txtBarbarians, $BarbariansComp)
			GUICtrlSetData($txtArchers, $ArchersComp)
			GUICtrlSetData($txtGoblins, "0")

			GUICtrlSetData($txtNumGiants, $GiantsComp)
			GUICtrlSetData($txtNumWallbreakers, "0")

			GUICtrlSetState($txtFirstTroop1, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop2, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop3, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop4, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop1, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop2, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop3, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop4, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop1, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop2, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop3, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop4, $GUI_DISABLE)
		Case 6
			GUICtrlSetState($cmbBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack2, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack3, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack4, $GUI_DISABLE)
			;			GUICtrlSetState($txtCapacity, $GUI_ENABLE)
			GUICtrlSetState($txtBarbarians, $GUI_ENABLE)
			GUICtrlSetState($txtArchers, $GUI_ENABLE)
			GUICtrlSetState($txtGoblins, $GUI_ENABLE)
			GUICtrlSetState($txtNumGiants, $GUI_DISABLE)
			GUICtrlSetState($txtNumWallbreakers, $GUI_DISABLE)

			GUICtrlSetState($chkDarkTroop, $GUI_UNCHECKED)
			GUICtrlSetState($chkDarkTroop, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack2, $GUI_DISABLE)
			GUICtrlSetState($txtDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($txtDarkBarrack2, $GUI_DISABLE)

			GUICtrlSetData($txtBarbarians, $BarbariansComp)
			GUICtrlSetData($txtArchers, $ArchersComp)
			GUICtrlSetData($txtGoblins, $GoblinsComp)

			GUICtrlSetData($txtNumGiants, "0")
			GUICtrlSetData($txtNumWallbreakers, "0")

			GUICtrlSetState($txtFirstTroop1, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop2, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop3, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop4, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop1, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop2, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop3, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop4, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop1, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop2, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop3, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop4, $GUI_DISABLE)
		Case 7
			GUICtrlSetState($cmbBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack2, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack3, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack4, $GUI_DISABLE)
			;			GUICtrlSetState($txtCapacity, $GUI_ENABLE)
			GUICtrlSetState($txtBarbarians, $GUI_ENABLE)
			GUICtrlSetState($txtArchers, $GUI_ENABLE)
			GUICtrlSetState($txtGoblins, $GUI_ENABLE)
			GUICtrlSetState($txtNumGiants, $GUI_ENABLE)
			GUICtrlSetState($txtNumWallbreakers, $GUI_ENABLE)

			GUICtrlSetState($chkDarkTroop, $GUI_UNCHECKED)
			GUICtrlSetState($chkDarkTroop, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack2, $GUI_DISABLE)
			GUICtrlSetState($txtDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($txtDarkBarrack2, $GUI_DISABLE)

			GUICtrlSetData($txtBarbarians, $BarbariansComp)
			GUICtrlSetData($txtArchers, $ArchersComp)
			GUICtrlSetData($txtGoblins, $GoblinsComp)

			GUICtrlSetData($txtNumGiants, $GiantsComp)
			GUICtrlSetData($txtNumWallbreakers, $WBComp)

			GUICtrlSetState($txtFirstTroop1, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop2, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop3, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop4, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop1, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop2, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop3, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop4, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop1, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop2, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop3, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop4, $GUI_DISABLE)
		Case 8
			GUICtrlSetState($cmbBarrack1, $GUI_ENABLE)
			GUICtrlSetState($cmbBarrack2, $GUI_ENABLE)
			GUICtrlSetState($cmbBarrack3, $GUI_ENABLE)
			GUICtrlSetState($cmbBarrack4, $GUI_ENABLE)
			;			GUICtrlSetState($txtCapacity, $GUI_DISABLE)
			GUICtrlSetState($txtBarbarians, $GUI_DISABLE)
			GUICtrlSetState($txtArchers, $GUI_DISABLE)
			GUICtrlSetState($txtGoblins, $GUI_DISABLE)
			GUICtrlSetState($txtNumGiants, $GUI_DISABLE)
			GUICtrlSetState($txtNumWallbreakers, $GUI_DISABLE)

			GUICtrlSetState($chkDarkTroop, $GUI_ENABLE)
			GUICtrlSetState($cmbDarkBarrack1, $GUI_ENABLE)
			GUICtrlSetState($cmbDarkBarrack2, $GUI_ENABLE)
			GUICtrlSetState($txtDarkBarrack1, $GUI_ENABLE)
			GUICtrlSetState($txtDarkBarrack2, $GUI_ENABLE)

			GUICtrlSetState($txtFirstTroop1, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop2, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop3, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop4, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop1, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop2, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop3, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop4, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop1, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop2, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop3, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop4, $GUI_DISABLE)

		Case 9
			GUICtrlSetState($cmbBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack2, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack3, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack4, $GUI_DISABLE)
			;			GUICtrlSetState($txtCapacity, $GUI_ENABLE)
			GUICtrlSetState($txtBarbarians, $GUI_ENABLE)
			GUICtrlSetState($txtArchers, $GUI_ENABLE)
			GUICtrlSetState($txtGoblins, $GUI_ENABLE)
			GUICtrlSetState($txtNumGiants, $GUI_ENABLE)
			GUICtrlSetState($txtNumWallbreakers, $GUI_ENABLE)

			GUICtrlSetState($chkDarkTroop, $GUI_UNCHECKED)
			GUICtrlSetState($chkDarkTroop, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbDarkBarrack2, $GUI_DISABLE)
			GUICtrlSetState($txtDarkBarrack1, $GUI_DISABLE)
			GUICtrlSetState($txtDarkBarrack2, $GUI_DISABLE)

			GUICtrlSetData($txtBarbarians, $BarbariansComp)
			GUICtrlSetData($txtArchers, $ArchersComp)
			GUICtrlSetData($txtGoblins, $GoblinsComp)

			GUICtrlSetData($txtNumGiants, $GiantsComp)
			GUICtrlSetData($txtNumWallbreakers, $WBComp)
			GUICtrlSetState($txtFirstTroop1, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop2, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop3, $GUI_DISABLE)
			GUICtrlSetState($txtFirstTroop4, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop1, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop2, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop3, $GUI_DISABLE)
			GUICtrlSetState($cmbFirstTroop4, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop1, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop2, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop3, $GUI_DISABLE)
			GUICtrlSetState($cmbSecondTroop4, $GUI_DISABLE)

		 Case 10
			GUICtrlSetState($cmbBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack2, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack3, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack4, $GUI_DISABLE)
			GUICtrlSetState($txtBarbarians, $GUI_DISABLE)
			GUICtrlSetState($txtArchers, $GUI_DISABLE)
			GUICtrlSetState($txtGoblins, $GUI_DISABLE)
			GUICtrlSetState($txtNumGiants, $GUI_DISABLE)
			GUICtrlSetState($txtNumWallbreakers, $GUI_DISABLE)
			GUICtrlSetState($chkDarkTroop, $GUI_ENABLE)
			GUICtrlSetState($cmbDarkBarrack1, $GUI_ENABLE)
			GUICtrlSetState($cmbDarkBarrack2, $GUI_ENABLE)
			GUICtrlSetState($txtDarkBarrack1, $GUI_ENABLE)
			GUICtrlSetState($txtDarkBarrack2, $GUI_ENABLE)
			GUICtrlSetState($txtFirstTroop1, $GUI_ENABLE)
			GUICtrlSetState($txtFirstTroop2, $GUI_ENABLE)
			GUICtrlSetState($txtFirstTroop3, $GUI_ENABLE)
			GUICtrlSetState($txtFirstTroop4, $GUI_ENABLE)
			GUICtrlSetState($cmbFirstTroop1, $GUI_ENABLE)
			GUICtrlSetState($cmbFirstTroop2, $GUI_ENABLE)
			GUICtrlSetState($cmbFirstTroop3, $GUI_ENABLE)
			GUICtrlSetState($cmbFirstTroop4, $GUI_ENABLE)
			GUICtrlSetState($cmbSecondTroop1, $GUI_ENABLE)
			GUICtrlSetState($cmbSecondTroop2, $GUI_ENABLE)
			GUICtrlSetState($cmbSecondTroop3, $GUI_ENABLE)
			GUICtrlSetState($cmbSecondTroop4, $GUI_ENABLE)
	EndSwitch
EndFunc   ;==>SetComboTroopComp

Func chkBackground()
	If GUICtrlRead($chkBackground) = $GUI_CHECKED Then
		$ichkBackground = 1
		GUICtrlSetState($btnHide, $GUI_ENABLE)
	Else
		$ichkBackground = 0
		GUICtrlSetState($btnHide, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkBackground

Func chkNoAttack()
	If GUICtrlRead($chkNoAttack) = $GUI_CHECKED Then
		$CommandStop = 0
		SetLog("~~~Donate / Train Only Activated~~~", $COLOR_PURPLE)
	ElseIf GUICtrlRead($chkDonateOnly) = $GUI_CHECKED Then
		If GUICtrlRead($lblpushbulletenabled) = $GUI_CHECKED Then
			SetLog("PushBullet is disabled !!!", $COLOR_RED)
		EndIf
		$CommandStop = 3
		SetLog("~~~Donate Only Activated~~~", $COLOR_PURPLE)
     ElseIf GUICtrlRead($expMode) = $GUI_CHECKED Then
		If GUICtrlRead($lblpushbulletenabled) = $GUI_CHECKED Then
            SetLog("PushBullet is disabled !!!", $COLOR_RED)
		EndIf
		$CommandStop = 4
		SetLog("~~~Goblin Mode Activated~~~", $COLOR_PURPLE)
	Else
		$CommandStop = -1
	EndIf
EndFunc   ;==>chkNoAttack

Func chkRequest()
	If GUICtrlRead($chkRequest) = $GUI_CHECKED Then
		$ichkRequest = 1
		GUICtrlSetState($txtRequest, $GUI_ENABLE)
	Else
		$ichkRequest = 0
		GUICtrlSetState($txtRequest, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkRequest

Func chkMakeSpells()
	If GUICtrlRead($chkMakeSpells) = $GUI_CHECKED Then
		$ichkMakeSpells = 1
		GUICtrlSetState($cmbSpellCreate, $GUI_ENABLE)
		GUICtrlSetState($txtDENukeLimit, $GUI_ENABLE)
		GUICtrlSetState($txtSpellNumber, $GUI_ENABLE)
		GUICtrlSetState($chkNukeAttacking, $GUI_ENABLE)
		GUICtrlSetState($chkNukeOnly, $GUI_ENABLE)
		GUICtrlSetState($chkNukeOnlyWithFullArmy, $GUI_ENABLE)
	Else
		$ichkMakeSpells = 0
		GUICtrlSetState($cmbSpellCreate, $GUI_DISABLE)
		GUICtrlSetState($txtDENukeLimit, $GUI_DISABLE)
		GUICtrlSetState($txtSpellNumber, $GUI_DISABLE)
		GUICtrlSetState($chkNukeAttacking, $GUI_DISABLE)
		GUICtrlSetState($chkNukeOnly, $GUI_DISABLE)
		GUICtrlSetState($chkNukeOnlyWithFullArmy, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkMakeSpells

Func chkNukeAttacking()
	If GUICtrlRead($chkNukeAttacking) = $GUI_CHECKED Then
		$ichkNukeAttacking = 1
		GUICtrlSetState($txtSpellNumber, $GUI_ENABLE)
	Else
		$ichkNukeAttacking = 0
		GUICtrlSetState($txtSpellNumber, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkNukeAttacking

Func chkNukeOnly()
	If GUICtrlRead($chkNukeOnly) = $GUI_CHECKED Then
		$ichkNukeOnly = 1
	Else
		$ichkNukeOnly = 0
	EndIf
EndFunc   ;==>chkNukeOnly

Func chkNukeOnlyWithFullArmy()
	If GUICtrlRead($chkNukeOnlyWithFullArmy) = $GUI_CHECKED Then
		$ichkNukeOnlyWithFullArmy = 1
	Else
		$ichkNukeOnlyWithFullArmy = 0
	EndIf
EndFunc   ;==>chkNukeOnlyWithFullArmy

Func cmbSpellCreate()
	If _GUICtrlComboBox_GetCurSel($cmbSpellCreate) <> 0 Then
		GUICtrlSetState($txtDENukeLimit, $GUI_DISABLE)
		GUICtrlSetState($txtSpellNumber, $GUI_DISABLE)
		GUICtrlSetState($chkNukeAttacking, $GUI_DISABLE + $GUI_UNCHECKED)
		GUICtrlSetState($chkNukeOnly, $GUI_DISABLE + $GUI_UNCHECKED)
		GUICtrlSetState($chkNukeOnlyWithFullArmy, $GUI_DISABLE + $GUI_UNCHECKED)
	Else
		GUICtrlSetState($txtDENukeLimit, $GUI_ENABLE)
		GUICtrlSetState($txtSpellNumber, $GUI_ENABLE)
		GUICtrlSetState($chkNukeAttacking, $GUI_ENABLE)
		GUICtrlSetState($chkNukeOnly, $GUI_ENABLE)
		GUICtrlSetState($chkNukeOnlyWithFullArmy, $GUI_ENABLE)
	EndIf
EndFunc   ;==>cmbSpellCreate

Func Randomspeedatk()
	If GUICtrlRead($Randomspeedatk) = $GUI_CHECKED Then
		$iRandomspeedatk = 1
		GUICtrlSetState($cmbUnitDelay, $GUI_DISABLE)
		GUICtrlSetState($cmbWaveDelay, $GUI_DISABLE)
	Else
		$iRandomspeedatk = 0
		GUICtrlSetState($cmbUnitDelay, $GUI_ENABLE)
		GUICtrlSetState($cmbWaveDelay, $GUI_ENABLE)
	EndIf
EndFunc   ;==>Randomspeedatk

Func tabMain()
	If _GUICtrlTab_GetCurSel($tabMain) = 0 Then
		ControlShow("", "", $txtLog)
	Else
		ControlHide("", "", $txtLog)
	EndIf
EndFunc   ;==>tabMain

Func DisableBS($HWnD, $iButton)
	ConsoleWrite('+ Window Handle: ' & $HWnD & @CRLF)
	$hSysMenu = _GUICtrlMenu_GetSystemMenu($HWnD, 0)
	_GUICtrlMenu_RemoveMenu($hSysMenu, $iButton, False)
	_GUICtrlMenu_DrawMenuBar($HWnD)
EndFunc   ;==>DisableBS

Func EnableBS($HWnD, $iButton)
	ConsoleWrite('+ Window Handle: ' & $HWnD & @CRLF)
	$hSysMenu = _GUICtrlMenu_GetSystemMenu($HWnD, 1)
	_GUICtrlMenu_RemoveMenu($hSysMenu, $iButton, False)
	_GUICtrlMenu_DrawMenuBar($HWnD)
EndFunc   ;==>EnableBS

Func btnLoad($configfile)
	Local $sFileOpenDialog = FileOpenDialog("Open config", @ScriptDir & "\", "Config (*.ini;)", $FD_FILEMUSTEXIST)
	If @error Then
		MsgBox($MB_SYSTEMMODAL, "", "Error opening file!")
		FileChangeDir(@ScriptDir)
	Else
		FileChangeDir(@ScriptDir)
		$sFileOpenDialog = StringReplace($sFileOpenDialog, "|", @CRLF)
		$config = $sFileOpenDialog
		readConfig()
		applyConfig()
		saveConfig()
		MsgBox($MB_SYSTEMMODAL, "", "Config loaded successfully!" & @CRLF & $sFileOpenDialog)
		GUICtrlSetData($lblConfig, getfilename($config))
	EndIf
EndFunc   ;==>btnLoad

Func btnSave($configfile)
	Local $sFileSaveDialog = FileSaveDialog("Save current config as..", "::{450D8FBA-AD25-11D0-98A8-0800361B1103}", "Config (*.ini)", $FD_PATHMUSTEXIST)
	If @error Then
		MsgBox($MB_SYSTEMMODAL, "", "Config save failed!")
	Else
		Local $sFileName = StringTrimLeft($sFileSaveDialog, StringInStr($sFileSaveDialog, "\", $STR_NOCASESENSE, -1))

		Local $iExtension = StringInStr($sFileName, ".", $STR_NOCASESENSE)

		If $iExtension Then
			If Not (StringTrimLeft($sFileName, $iExtension - 1) = ".ini") Then $sFileSaveDialog &= ".ini"
		Else
			$sFileSaveDialog &= ".ini"
		EndIf
		$config = $sFileSaveDialog
		saveConfig()
		MsgBox($MB_SYSTEMMODAL, "", "Successfully saved the current configuration!" & @CRLF & $sFileSaveDialog)
		GUICtrlSetData($lblConfig, getfilename($config))
	EndIf
EndFunc   ;==>btnSave

Func chkUpgrade1()
	If GUICtrlRead($chkUpgrade1) = $GUI_CHECKED Then
		GUICtrlSetState($btnLocateUp1, $GUI_ENABLE)
	Else
		GUICtrlSetState($btnLocateUp1, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkUpgrade1

Func chkUpgrade2()
	If GUICtrlRead($chkUpgrade2) = $GUI_CHECKED Then
		GUICtrlSetState($btnLocateUp2, $GUI_ENABLE)
	Else
		GUICtrlSetState($btnLocateUp2, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkUpgrade2

Func chkUpgrade3()
	If GUICtrlRead($chkUpgrade3) = $GUI_CHECKED Then
		GUICtrlSetState($btnLocateUp3, $GUI_ENABLE)
	Else
		GUICtrlSetState($btnLocateUp3, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkUpgrade3

Func chkUpgrade4()
	If GUICtrlRead($chkUpgrade4) = $GUI_CHECKED Then
		GUICtrlSetState($btnLocateUp4, $GUI_ENABLE)
	Else
		GUICtrlSetState($btnLocateUp4, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkUpgrade4

Func chkUpgrade5()
	If GUICtrlRead($chkUpgrade5) = $GUI_CHECKED Then
		GUICtrlSetState($btnLocateUp5, $GUI_ENABLE)
	Else
		GUICtrlSetState($btnLocateUp5, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkUpgrade5

Func chkUpgrade6()
	If GUICtrlRead($chkUpgrade6) = $GUI_CHECKED Then
		GUICtrlSetState($btnLocateUp6, $GUI_ENABLE)
	Else
		GUICtrlSetState($btnLocateUp6, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkUpgrade6

Func UseJPG()
	If (GUICtrlRead($UseJPG) = $GUI_CHECKED) And (GUICtrlRead($chkTakeLootSS) = $GUI_UNCHECKED) Then
		GUICtrlSetState($chkTakeLootSS, $GUI_CHECKED)
	EndIf
EndFunc   ;==>UseJPG

Func UseAttackJPG()
	If (GUICtrlRead($UseAttackJPG) = $GUI_CHECKED) And (GUICtrlRead($chkTakeAttackSS) = $GUI_UNCHECKED) Then
		GUICtrlSetState($chkTakeAttackSS, $GUI_CHECKED)
	EndIf
EndFunc   ;==>UseAttackJPG

Func chkDeadActivate()
	If GUICtrlRead($chkDeadActivate) = $GUI_CHECKED Then
		GUICtrlSetState($chkDeadGE, $GUI_ENABLE)
		GUICtrlSetState($txtDeadMinGold, $GUI_ENABLE)
		GUICtrlSetState($cmbDead, $GUI_ENABLE)
		GUICtrlSetState($txtDeadMinElixir, $GUI_ENABLE)
		GUICtrlSetState($chkDeadMeetDE, $GUI_ENABLE)
		GUICtrlSetState($txtDeadMinDarkElixir, $GUI_ENABLE)
		GUICtrlSetState($chkDeadMeetTrophy, $GUI_ENABLE)
		GUICtrlSetState($txtDeadMinTrophy, $GUI_ENABLE)
		GUICtrlSetState($chkDeadMeetTH, $GUI_ENABLE)
		GUICtrlSetState($cmbDeadTH, $GUI_ENABLE)
		GUICtrlSetState($chkDeadMeetTHO, $GUI_ENABLE)
		GUICtrlSetState($chkDeadSnipe, $GUI_ENABLE)
		GUICtrlSetState($btnSearchMode, $GUI_ENABLE)
	Else
		GUICtrlSetState($chkDeadGE, $GUI_DISABLE)
		GUICtrlSetState($txtDeadMinGold, $GUI_DISABLE)
		GUICtrlSetState($cmbDead, $GUI_DISABLE)
		GUICtrlSetState($txtDeadMinElixir, $GUI_DISABLE)
		GUICtrlSetState($chkDeadMeetDE, $GUI_DISABLE)
		GUICtrlSetState($txtDeadMinDarkElixir, $GUI_DISABLE)
		GUICtrlSetState($chkDeadMeetTrophy, $GUI_DISABLE)
		GUICtrlSetState($txtDeadMinTrophy, $GUI_DISABLE)
		GUICtrlSetState($chkDeadMeetTH, $GUI_DISABLE)
		GUICtrlSetState($cmbDeadTH, $GUI_DISABLE)
		GUICtrlSetState($chkDeadMeetTHO, $GUI_DISABLE)
		GUICtrlSetState($chkDeadSnipe, $GUI_DISABLE)
		If GUICtrlRead($chkAnyActivate) = $GUI_UNCHECKED Then
			GUICtrlSetState($btnSearchMode, $GUI_DISABLE)
		EndIf
	EndIf
EndFunc   ;==>chkDeadActivate

Func chkAnyActivate()
	If GUICtrlRead($chkAnyActivate) = $GUI_CHECKED Then
		GUICtrlSetState($chkMeetGE, $GUI_ENABLE)
		GUICtrlSetState($txtMinGold, $GUI_ENABLE)
		GUICtrlSetState($cmbAny, $GUI_ENABLE)
		GUICtrlSetState($txtMinElixir, $GUI_ENABLE)
		GUICtrlSetState($chkMeetDE, $GUI_ENABLE)
		GUICtrlSetState($txtMinDarkElixir, $GUI_ENABLE)
		GUICtrlSetState($chkMeetTrophy, $GUI_ENABLE)
		GUICtrlSetState($txtMinTrophy, $GUI_ENABLE)
		GUICtrlSetState($chkMeetTH, $GUI_ENABLE)
		GUICtrlSetState($cmbTH, $GUI_ENABLE)
		GUICtrlSetState($chkMeetTHO, $GUI_ENABLE)
		GUICtrlSetState($chkSnipe, $GUI_ENABLE)
		GUICtrlSetState($btnSearchMode, $GUI_ENABLE)
	Else
		GUICtrlSetState($chkMeetGE, $GUI_DISABLE)
		GUICtrlSetState($txtMinGold, $GUI_DISABLE)
		GUICtrlSetState($cmbAny, $GUI_DISABLE)
		GUICtrlSetState($txtMinElixir, $GUI_DISABLE)
		GUICtrlSetState($chkMeetDE, $GUI_DISABLE)
		GUICtrlSetState($txtMinDarkElixir, $GUI_DISABLE)
		GUICtrlSetState($chkMeetTrophy, $GUI_DISABLE)
		GUICtrlSetState($txtMinTrophy, $GUI_DISABLE)
		GUICtrlSetState($chkMeetTH, $GUI_DISABLE)
		GUICtrlSetState($cmbTH, $GUI_DISABLE)
		GUICtrlSetState($chkSnipe, $GUI_DISABLE)
		GUICtrlSetState($chkMeetTHO, $GUI_DISABLE)
		If GUICtrlRead($chkDeadActivate) = $GUI_UNCHECKED Then
			GUICtrlSetState($btnSearchMode, $GUI_DISABLE)
		EndIf
	EndIf
EndFunc   ;==>chkAnyActivate

Func lblpushbulletenabled()
	If GUICtrlRead($lblpushbulletenabled) = $GUI_CHECKED Then
		GUICtrlSetState($pushbullettokenvalue, $GUI_ENABLE)
		GUICtrlSetState($lblpushbulletdebug, $GUI_ENABLE)
		GUICtrlSetState($lblpushbulletremote, $GUI_ENABLE)
		GUICtrlSetState($lblpushbulletdelete, $GUI_ENABLE)
		GUICtrlSetState($lblvillagereport, $GUI_ENABLE)
		GUICtrlSetState($lblmatchfound, $GUI_ENABLE)
		GUICtrlSetState($lbllastraid, $GUI_ENABLE)
		GUICtrlSetState($UseJPG, $GUI_ENABLE)
	Else
		GUICtrlSetState($pushbullettokenvalue, $GUI_DISABLE)
		GUICtrlSetState($lblpushbulletdebug, $GUI_DISABLE)
		GUICtrlSetState($lblpushbulletremote, $GUI_DISABLE)
		GUICtrlSetState($lblpushbulletdelete, $GUI_DISABLE)
		GUICtrlSetState($lblvillagereport, $GUI_DISABLE)
		GUICtrlSetState($lblmatchfound, $GUI_DISABLE)
		GUICtrlSetState($lbllastraid, $GUI_DISABLE)
		GUICtrlSetState($UseJPG, $GUI_DISABLE)
	EndIf
EndFunc   ;==>lblpushbulletenabled

Func rdoMaybeSkip()
	If GUICtrlRead($rdoMaybeSkip) = $GUI_CHECKED Then
		GUICtrlSetState($rdoMaybeSkip, $GUI_CHECKED)
		GUICtrlSetState($rdoFalsePositive, $GUI_UNCHECKED)
	Else
		GUICtrlSetState($rdoMaybeSkip, $GUI_UNCHECKED)
		GUICtrlSetState($rdoFalsePositive, $GUI_CHECKED)
	EndIf
EndFunc   ;==>rdoMaybeSkip

Func getfilename($psFilename)
	Local $szDrive, $szDir, $szFName, $szExt
	_PathSplit($psFilename, $szDrive, $szDir, $szFName, $szExt)
	Return $szFName & $szExt
EndFunc   ;==>getfilename

Func btnBugRep()

	$iLines = _GUICtrlRichEdit_GetLineCount($txtLog)
	$iLines = $iLines - 100
	If $iLines < 1 Then $iLines = 1
	For $dummy = $iLines to _GUICtrlRichEdit_GetLineCount($txtLog)
		if $dummy > $iLines Then
			GUICtrlSetData($inpLog, GUICtrlRead($inpLog) & @CRLF & _GUICtrlRichEdit_GetTextInLine($txtLog,$dummy))
		Else
			GUICtrlSetData($inpLog, _GUICtrlRichEdit_GetTextInLine($txtLog,$dummy))
		EndIf
	Next

	GUICtrlSetData($inpSettings, "")
	$firstLine=True
	If FileExists($config) Then
		$hConfig = FileOpen($config)
		While True
			$strNextLine = FileReadLine($hConfig)
			if @error Then ExitLoop
			if StringInStr($strNextLine, "accounttoken=") Then
				$strNextLine = "accounttoken=REDACTED"
			EndIf
			If Not $firstLine Then
				GUICtrlSetData($inpSettings, GUICtrlRead($inpSettings) & @CRLF & $strNextLine)
			Else
				$firstLine = False
				GUICtrlSetData($inpSettings, $strNextLine)
			EndIf
		WEnd
	Else
		GUICtrlSetData($inpSettings, "No log file found")
	EndIf

	GUISetState(@SW_DISABLE, $frmBot)
	GUISetState(@SW_SHOW, $frmBugReport)

EndFunc

func openWebsite()
	ShellExecute("http://www.brokenbot.org") 
EndFunc

;---------------------------------------------------
If FileExists($config) Then
	readConfig()
	applyConfig()
EndIf
checkupdate()

GUIRegisterMsg($WM_COMMAND, "GUIControl")
GUIRegisterMsg($WM_SYSCOMMAND, "GUIControl")
;---------------------------------------------------



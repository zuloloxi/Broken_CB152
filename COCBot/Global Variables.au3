#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <FileConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <GUIEdit.au3>
#include <GUIComboBox.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#include <WinAPIProc.au3>
#include <ScreenCapture.au3>
#include <Date.au3>
#include <Misc.au3>
#include <File.au3>
#include <TrayConstants.au3>
#include <GUIMenu.au3>
#include <ColorConstants.au3>
#include <GDIPlus.au3>
#include <GuiRichEdit.au3>
#include <GuiTab.au3>

Global Const $COLOR_ORANGE = 0xFFA500

Global $Compiled
If @Compiled Then
	$Compiled = "Executable"
Else
	$Compiled = "Au3 Script"
EndIf

Global $hBitmap; Image for pixel functions
Global $hHBitmap; Handle Image for pixel functions
Global $hAttackBitmap
Global $Pen

Global $Title = "BlueStacks App Player" ; Name of the Window
Global $HWnD = WinGetHandle($Title) ;Handle for Bluestacks window

Global $config = @ScriptDir & "\config\default.ini"
Global $dirLogs = @ScriptDir & "\logs\"
Global $dirLoots = @ScriptDir & "\Loots\"
Global $dirAttack = @ScriptDir & "\Attacks\"
Global $dirDebug = @ScriptDir & "\Debug\"
Global $dirAllTowns = @ScriptDir & "\AllTowns\"
Global $dirConfigs = @ScriptDir & "\config\"
Global $config = @ScriptDir & "\config\default.ini"
Global $sLogPath ; `Will create a new log file every time the start button is pressed
Global $hLogFileHandle
Global $Restart = False
Global $RunState = False
Global $AttackNow = False
Global $AlertBaseFound = False
Global $TakeLootSnapShot = True
Global $TakeAllTownSnapShot = False
Global $TakeAttackSnapShot = 0
Global $DebugMode = 0
Global $shift
Global $ReqText
Global $brerror[4]
$brerror[0] = False
$brerror[1] = False
$brerror[2] = False
$brerror[3] = False
$needzoomout = False
Global $cmbTroopComp ;For Event change on ComboBox Troop Compositions
Global $iCollectCounter = 0 ; Collect counter, when reaches $COLLECTATCOUNT, it will collect
Global $COLLECTATCOUNT = 8 ; Run Collect() after this amount of times before actually collect
;---------------------------------------------------------------------------------------------------
Global $BSpos[2] ; Inside BlueStacks positions relative to the screen
;---------------------------------------------------------------------------------------------------
;Search Settings
Global $searchGold, $searchElixir, $searchDark, $searchTrophy, $searchDead, $searchTH ; Resources of bases when searching
Global $MinDeadGold, $MinDeadElixir, $MinDeadDark, $MinDeadTrophy, $MaxDeadTH, $MinGold, $MinElixir, $MinDark, $MinTrophy, $MaxTH ; Minimum Resources conditions
Global $chkConditions[12] ;Conditions (meet gold...)
Global $icmbTH, $icmbDeadTH, $icmbAny, $icmbDead, $ideadactivate, $ianyactivate, $icmbDeadAttackTH, $icmbAttackTH
Global $chkDeadSnipe, $chkSnipe, $cmbDeadAttackTH, $cmbAttackTH
Global $THLocation
Global $FixTrain = False
Global $NukeAttack = False
Global $Tolerance1 = 80
Global $THx = 0, $THy = 0
Global $DEx = 0, $DEy = 0
Global $THText[5] ; Text of each Townhall level
$THText[0] = "4-6"
$THText[1] = "7"
$THText[2] = "8"
$THText[3] = "9"
$THText[4] = "10"
Global $SearchCount = 0 ;Number of searches
Global $THaddtiles, $THside, $THi

;Search speed control
Global $speedBump = 0
Global $hTimerClickNext, $fdiffReadGold

;Troop types
Global Enum $eBarbarian, $eArcher, $eGiant, $eGoblin, $eWallbreaker, $eMinion, $eHog, $eValkyrie, $eKing, $eQueen, $eCastle, $eLSpell

;Attack Settings
; Shift outer corners 1 pixel for more random drop space
Global $TopLeft[5][2] = [[78, 280], [169, 204], [233, 161], [295, 114], [367, 65]]
Global $TopRight[5][2] = [[481, 62], [541, 103], [590, 145], [656, 189], [780, 277]]
Global $BottomLeft[5][2] = [[78, 343], [141, 390], [209, 447], [275, 493], [338, 540]]
Global $BottomRight[5][2] = [[524, 538], [596, 485], [655, 441], [716, 394], [780, 345]]
Global $FurthestTopLeft[5][2] = [[28, 314], [0, 0], [0, 0], [0, 0], [430, 9]]
Global $FurthestTopRight[5][2] = [[430, 9], [0, 0], [0, 0], [0, 0], [820, 313]]
Global $FurthestBottomLeft[5][2] = [[28, 314], [0, 0], [0, 0], [0, 0], [440, 612]]
Global $FurthestBottomRight[5][2] = [[440, 612], [0, 0], [0, 0], [0, 0], [820, 313]]
Global $Edges[4] = [$BottomRight, $TopLeft, $BottomLeft, $TopRight]

;Red border finding
Global $numEdges = 81
Global $EdgeColors[81][3] = [[218, 116, 44], [207, 97, 37], [199, 104, 41], [201, 119, 45], [193, 130, 47], _
		[203, 134, 55], [208, 138, 55], [211, 143, 59], [196, 128, 50], [195, 159, 38], [199, 143, 57], _
		[173, 124, 50], [214, 108, 40], [193, 101, 38], [211, 111, 44], [203, 112, 42], [123, 73, 26], _
		[143, 89, 31], [157, 100, 41], [180, 116, 45], [133, 82, 32], [125, 65, 20], [172, 117, 48], _
		[120, 92, 36], [106, 76, 30], [159, 105, 42], [172, 103, 40], [193, 124, 44], [189, 119, 46], _
		[206, 155, 64], [190, 137, 46], [187, 138, 56], [192, 155, 58], [203, 131, 47], [196, 147, 52], _
		[199, 140, 53], [193, 135, 52], [195, 159, 58], [196, 128, 50], [193, 136, 53], [211, 143, 59], _
		[203, 131, 47], [215, 142, 50], [205, 145, 53], [187, 129, 53], [151, 85, 34], [154, 75, 26], _
		[168, 80, 32], [105, 68, 20], [172, 117, 46], [193, 119, 47], [192, 111, 45], [126, 88, 34], _
		[165, 88, 29], [158, 71, 25], [166, 91, 34], [127, 59, 23], [212, 119, 47], [206, 119, 42], _
		[211, 119, 45], [200, 112, 41], [202, 108, 40], [180, 113, 39], [211, 119, 45], [202, 127, 49], _
		[168, 126, 46], [126, 50, 16], [165, 81, 27], [163, 74, 26], [207, 129, 53], [183, 129, 44], _
		[196, 139, 52], [180, 126, 48], [156, 81, 31], [142, 77, 28], [160, 104, 37], _
		[157, 83, 29], [128, 71, 25], [157, 80, 37], [158, 93, 33], [198, 115, 43]]
Global $Grid[43][43][3]
$Grid[0][0][0] = 35
$Grid[0][0][1] = 314
$Grid[42][0][0] = 429
$Grid[42][0][1] = 610
$Grid[0][42][0] = 429
$Grid[0][42][1] = 18
$Grid[42][42][0] = 824
$Grid[42][42][1] = 314
For $i = 1 To 41
	$Grid[$i][0][0] = ($Grid[$i - 1][0][0] + (($Grid[42][0][0] - $Grid[0][0][0]) / 42))
	$Grid[$i][0][1] = ($Grid[$i - 1][0][1] + (($Grid[42][0][1] - $Grid[0][0][1]) / 42))
	$Grid[$i][42][0] = ($Grid[$i - 1][42][0] + (($Grid[42][42][0] - $Grid[0][42][0]) / 42))
	$Grid[$i][42][1] = ($Grid[$i - 1][42][1] + (($Grid[42][42][1] - $Grid[0][42][1]) / 42))
Next
For $i = 0 To 42
	For $j = 1 To 41
		$Grid[$i][$j][0] = ($Grid[$i][0][0] + $j * (($Grid[$i][42][0] - $Grid[$i][0][0]) / 42))
		$Grid[$i][$j][1] = ($Grid[$i][0][1] + $j * (($Grid[$i][42][1] - $Grid[$i][0][1]) / 42))
	Next
Next
For $j = 0 To 42
	For $i = 0 To 42
		$Grid[$j][$i][0] = Round($Grid[$j][$i][0])
		$Grid[$j][$i][1] = Round($Grid[$j][$i][1])
	Next
Next
$EdgeLevel = 1
$AimCenter = 1
$AimTH = 2

Global $atkTroops[9][2] ;9 Slots of troops -  Name, Amount
Global $fullArmy ;Check for full army or not
Global $fullSpellFactory ;Check for full spell factory or not
Global $spellsstarted

Global $deployDeadSettings ;Method of deploy found in attack settings
Global $icmbDeadAlgorithm ;Algorithm to use when attacking
Global $checkDeadUseKing ;King attack settings
Global $checkDeadUseQueen ;Queen attack settings
Global $checkDeadUseClanCastle ; Use Clan Castle settings
Global $checkDeadAttackTH ; Attack Outside Townhall settings

Global $deploySettings ;Method of deploy found in attack settings
Global $icmbAlgorithm ;Algorithm to use when attacking
Global $checkUseKing ;King attack settings
Global $checkUseQueen ;Queen attack settings
Global $checkUseClanCastle ; Use Clan Castle settings
Global $checkAttackTH ; Attack Outside Townhall settings
Global $icmbUnitDelay, $icmbWaveDelay, $iRandomspeedatk

Global $checkKPower = False ; Check for King activate power
Global $checkQPower = False ; Check for Queen activate power
;Global $delayActivateKQ = 10000 ;Delay before activating KQ

Global $THLoc
Global $THquadrant

Global $Buffer
Global $pBarbarian, $pArcher, $pGoblin, $pGiant, $pWallB, $pLightning, $pKing, $pQueen, $pCC

Global $King, $Queen, $CC, $Barb, $Arch, $Minion, $Hog, $Valkyrie
Global $LeftTHx, $RightTHx, $BottomTHy, $TopTHy
Global $AtkTroopTH
Global $GetTHLoc

;Misc Settings
Global $itxtReconnect
Global $itxtReturnh
Global $icmbSearchsp
Global $ichkTrap
Global $itxtKingSkill ;Delay before activating King Skill
Global $itxtQueenSkill ;Delay before activating Queen Skill
Global $WideEdge, $chkWideEdge
Global $ichkAvoidEdge, $chkAvoidEdge
Global $chkCollect, $ichkCollect

;Boosts Settings
Global $BoostAll
Global $remainingBoosts = 0 ;  remaining boost to active during session
Global $boostsEnabled = 1 ; is this function enabled
Global $chkBoostKing
Global $chkBoostQueen
Global $chkBoostRax1
Global $chkBoostRax2
Global $chkBoostRax3
Global $chkBoostRax4
Global $chkBoostSpell
Global $chkBoostDB1
Global $chkBoostDB2

;Donate Settings
Global $CCPos[2] = [-1, -1] ;Position of clan castle

Global $ichkRequest = 0 ;Checkbox for Request box
Global $itxtRequest = "" ;Request textbox

Global $ichkDonateAllBarbarians = 0
Global $ichkDonateBarbarians = 0
Global $itxtDonateBarbarians = ""

Global $ichkDonateAllArchers = 0
Global $ichkDonateArchers = 0
Global $itxtDonateArchers = ""

Global $ichkDonateAllGiants = 0
Global $ichkDonateGiants = 0
Global $itxtDonateGiants = ""

;Troop Settings
Global $icmbRaidcap
Global $icmbTroopComp ;Troop Composition
Global $itxtcampCap
Global $itxtspellCap
Global $BarbariansComp
Global $ArchersComp
Global $GiantsComp
Global $GoblinsComp
Global $WBComp
Global $CurBarb
Global $CurArch
Global $CurGiant
Global $CurGoblin
Global $CurWB
Global $ArmyComp
Global $TownHallPos[2] = [-1, -1] ;Position of TownHall
Global $barrackPos[4][2] ;Positions of each barracks
Global $barrackTroop[10] ;Barrack troop set

Global $CustomTroopF[4]
Global $CustomTroopS[4]
Global $itxtFirstTroop[4]

Global $ArmyPos[2]
Global $SpellPos[2]
Global $KingPos[2]
Global $QueenPos[2]
Global $BuildPos1[2]
Global $BuildPos2[2]
Global $BuildPos3[2]

;Other Settings
Global $CurMinion, $CurHog, $CurValkyrie
Global $ichkWalls
Global $icmbWalls
Global $iUseStorage
Global $itxtWallMinGold
Global $itxtWallMinElixir
Global $icmbTolerance
Global $itxtReconnect
Global $DarkBarrackPos[2][2]
Global $DarkBarrackTroop[2]
Global $itxtDarkBarrack1, $itxtDarkBarrack2
Global $ichkDarkTroop
Global $iTimeTroops = 0
Global $iTimeGiant = 120
Global $iTimeWall = 120
Global $iTimeArch = 25
Global $iTimeGoblin = 35
Global $iTimeBarba = 20

;upgrade Settings
Global $ichkUpgrade1
Global $ichkUpgrade2
Global $ichkUpgrade3
Global $ichkUpgrade4
Global $ichkUpgrade5
Global $ichkUpgrade6
Global $itxtUpgradeX1
Global $itxtUpgradeY1
Global $itxtUpgradeX2
Global $itxtUpgradeY2
Global $itxtUpgradeX3
Global $itxtUpgradeY3
Global $itxtUpgradeX4
Global $itxtUpgradeY4
Global $itxtUpgradeX5
Global $itxtUpgradeY5
Global $itxtUpgradeX6
Global $itxtUpgradeY6

;Spell Settings
Global $chkMakeSpells
Global $cmbSpellCreate
Global $txtDENukeLimit
Global $txtSpellNumber
Global $txtSpellCap
Global $chkNukeAttacking
Global $chkNukeOnly
Global $chkNukeOnlyWithFullArmy
Global $ichkMakeSpells
Global $iSpellSelection
Global $iNukeLimit
Global $iSpellNumber
Global $ichkNukeAttacking
Global $ichkNukeOnly
Global $ichkNukeOnlyWithFullArmy
Global $rdoMaybeSkip
Global $rdoFalsePositive
Global $DESearchMode

;General Settings
Global $botPos[2] ; Position of bot used for Hide function
Global $frmBotPosX ; Position X of the GUI
Global $frmBotPosY ; Position Y of the GUI
Global $Hide = False ; If hidden or not

Global $firstrun = True
Global $chkUpdate
Global $ichkUpdate
Global $btnBugRep

Global $ichkBotStop, $icmbBotCommand, $icmbBotCond, $icmbHoursStop
Global $CommandStop = -1
Global $MeetCondStop = False
Global $UseTimeStop = -1
Global $TimeToStop = -1

Global $itxtMinTrophy ; Trophy after drop
Global $itxtMaxTrophy ; Max trophy before drop trophy
Global $ichkBackground ; Background mode enabled disabled
Global $ichkForceBS = 0
Global $ichkNoAttack = 0, $ichkDonateOnly = 0
Global $collectorPos[17][2] ;Positions of each collectors

Global $break = @ScriptDir & "\images\break.bmp"
Global $device = @ScriptDir & "\images\device.bmp"

Global $GoldCount = 0, $ElixirCount = 0, $DarkCount = 0, $GemCount = 0, $FreeBuilder = 0
Global $GoldGained = 0, $ElixirGained = 0, $DarkGained = 0, $TrophyGained = 0
;Global $GoldGainedOld = 0, $ElixirGainedOld = 0, $DarkGainedOld = 0, $TrophyGainedOld = 0
Global $GoldCountOld = 0, $ElixirCountOld = 0, $DarkCountOld = 0, $TrophyOld = 0
Global $WallUpgrade = 0
Global $resArmy = 0
Global $FirstAttack = 0
Global $CurTrophy = 0
Global $sTimer, $hour, $min, $sec
Global $CurCamp, $TotalCamp = 0
Global $NoLeague
Global $FirstStart = True
Global $DCattack = 0
Global $Checkrearm = True
Global $FirstDarkTrain = True
Global $FirstTrain = True

;PushBullet
Global $PushBulletEnabled = 0
Global $PushBullettoken = ""
Global $PushBullettype = 0
Global $PushBulletattacktype = 0
Global $FileName = ""
Global $PushBulletvillagereport = 0
Global $PushBulletmatchfound = 0
Global $PushBulletlastraid = 0
Global $PushBullettotalgain = 0
Global $PushBulletdebug = 0
Global $PushBulletremote = 0
Global $PushBulletdelete = 0
Global $PushBulletfreebuilder = 0
Global $sLogFileName
Global $Raid = 0
Global $buildernotified = False

;GoldCostPerSearch
Global $SearchCost = 0

;Remote Control
Global $sTimerRC
Global $PauseBot = False

;Last Raid
Global $LastRaidGold = 0
Global $LastRaidElixir = 0
Global $LastRaidDarkElixir = 0
Global $LastRaidTrophy = 0

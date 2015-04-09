Global $upgradebuild
Global $checkupgradelogic
Func UpgradeToBuilding1()

If GUICtrlRead($chkUpgrade1) <> $GUI_CHECKED Then
		; SetLog("Upgrade Building 1 option disabled, skipping upgrade ", $COLOR_RED)
		Return
	 EndIf
	 VillageReport()
If $FreeBuilder = 0 Then
		SetLog("No builders available", $COLOR_RED)
		Click(1, 1) ; Click Away
		Return
	 EndIf
	 _Sleep(1000)
	  Click(GUICtrlRead($txtUpgradeX1), GUICtrlRead($txtUpgradeY1));, _ ;settings
	  _Sleep(1000)
	 _CaptureRegion()

	 If _ColorCheck(_GetPixelColor(501, 571), Hex(0xE70A12, 6), 20) or  _ColorCheck(_GetPixelColor(492, 570), Hex(0xE70A12, 6), 20)  Then
				SetLog("Not enough Gold or Elixir...", $COLOR_ORANGE)
				Click(1, 1) ; Click Away
				$upgradebuild = 0
				Else
	 If _ColorCheck(_GetPixelColor(501, 571), Hex(0xFFFFFF, 6), 20) = True  or _ColorCheck(_GetPixelColor(486, 569), Hex(0xFFFFFF, 6), 20) = True  Then

		   SetLog("Upgrade Building 1 Pos X:Y "& GUICtrlRead($txtUpgradeX1) &":" & GUICtrlRead($txtUpgradeY1) , $COLOR_BLUE) ; Done upgrade
		   _Sleep(1000)
		   ;checkButtonUpgrade()
      _Sleep(1000)
	   Click(456, 602)
	   _Sleep(1000)
   Click(472, 482)
   _Sleep(1000)
$upgradebuild = 1
   SetLog("Upgrade Building 1 Done !!!", $COLOR_BLUE) ; Done upgrade
								   Sleep(500)
Else
					Click(1, 1) ; Click away
					_Sleep(1000)
				Endif
			EndIf


EndFunc

Func UpgradeToBuilding2()

If GUICtrlRead($chkUpgrade2) <> $GUI_CHECKED Then
		; SetLog("Upgrade Building 2 option disabled, skipping upgrade ", $COLOR_RED)
		Return
	 EndIf
	 VillageReport()
If $FreeBuilder = 0 Then
		SetLog("No builders available", $COLOR_RED)
		Click(1, 1) ; Click Away
		Return
	 EndIf
	 _Sleep(1000)
	  Click(GUICtrlRead($txtUpgradeX2), GUICtrlRead($txtUpgradeY2))
	  _Sleep(1000)
	 _CaptureRegion()

	 If _ColorCheck(_GetPixelColor(501, 571), Hex(0xE70A12, 6), 20) or  _ColorCheck(_GetPixelColor(492, 570), Hex(0xE70A12, 6), 20)  Then
				SetLog("Not enough Gold or Elixir...", $COLOR_ORANGE)
				Click(1, 1) ; Click Away
				$upgradebuild = 0
				Else
	 If _ColorCheck(_GetPixelColor(501, 571), Hex(0xFFFFFF, 6), 20) = True  or _ColorCheck(_GetPixelColor(486, 569), Hex(0xFFFFFF, 6), 20) = True  Then

		   SetLog("Upgrade Building 2 Pos X:Y "& GUICtrlRead($txtUpgradeX2) &":" & GUICtrlRead($txtUpgradeY2) , $COLOR_BLUE) ; Done upgrade
		   _Sleep(1000)
		   ;checkButtonUpgrade()

      _Sleep(1000)
	   Click(456, 602)
	   _Sleep(1000)
   Click(472, 482)
   _Sleep(1000)
    SetLog("Upgrade Building 2 Done !!!", $COLOR_BLUE) ; Done upgrade
		   Sleep(500)
Else
					Click(1, 1) ; Click away
					_Sleep(1000)
				Endif
			EndIf



EndFunc
Func UpgradeToBuilding3()

If GUICtrlRead($chkUpgrade3) <> $GUI_CHECKED Then
		; SetLog("Upgrade Building 3 option disabled, skipping upgrade ", $COLOR_RED)
		Return
	 EndIf
	 VillageReport()

If $FreeBuilder = 0 Then
		SetLog("No builders available", $COLOR_RED)
		Click(1, 1) ; Click Away
		Return
	 EndIf

	 _Sleep(1000)
	  Click(GUICtrlRead($txtUpgradeX3), GUICtrlRead($txtUpgradeY3))
	  	  _Sleep(1000)
	 _CaptureRegion()

	 If _ColorCheck(_GetPixelColor(501, 571), Hex(0xE70A12, 6), 20) or  _ColorCheck(_GetPixelColor(492, 570), Hex(0xE70A12, 6), 20)  Then
				SetLog("Not enough Gold or Elixir...", $COLOR_ORANGE)
				Click(1, 1) ; Click Away
				$upgradebuild = 0
				Else
	 If _ColorCheck(_GetPixelColor(501, 571), Hex(0xFFFFFF, 6), 20) = True  or _ColorCheck(_GetPixelColor(486, 569), Hex(0xFFFFFF, 6), 20) = True  Then
		   ;Click(GUICtrlRead($txtUpgradeX3), GUICtrlRead($txtUpgradeY3))
		   SetLog("Upgrade Building 3 Pos X:Y "& GUICtrlRead($txtUpgradeX3) &":" & GUICtrlRead($txtUpgradeY3) , $COLOR_BLUE) ; Done upgrade
		   _Sleep(1000)
		   ;checkButtonUpgrade()
  ;Click(GUICtrlRead($txtUpgradeX2),  GUICtrlRead($txtUpgradeY2))
      _Sleep(1000)
	   Click(456, 602)
	   _Sleep(1000)
   Click(472, 482)
   _Sleep(1000)


               SetLog("Upgrade Building 3 Done !!!", $COLOR_BLUE) ; Done upgrade
								     Sleep(500)
Else
					Click(1, 1) ; Click away
					_Sleep(1000)
				Endif
			EndIf


EndFunc

Func UpgradeToBuilding4()

If GUICtrlRead($chkUpgrade4) <> $GUI_CHECKED Then
		; SetLog("Upgrade Building 4 option disabled, skipping upgrade ", $COLOR_RED)
		Return
	 EndIf
	 VillageReport()
;If $FreeBuilder = 0 Then
		;SetLog("No builders available", $COLOR_RED)
		;Click(1, 1) ; Click Away
		;Return
	; EndIf
	 _Sleep(1000)
	  Click(GUICtrlRead($txtUpgradeX4), GUICtrlRead($txtUpgradeY4));
	  	 				_Sleep(1000)
	 _CaptureRegion()

	 If _ColorCheck(_GetPixelColor(549, 569), Hex(0xE70A12, 6), 20) or  _ColorCheck(_GetPixelColor(464, 442), Hex(0xE70A12, 6), 20)  Then
				SetLog("Not enough Gold or Elixir...", $COLOR_ORANGE)
				Click(1, 1) ; Click Away
				$upgradebuild = 0
				Else
	 If _ColorCheck(_GetPixelColor(549, 570), Hex(0xFFFFFF, 6), 20) = True  or _ColorCheck(_GetPixelColor(540, 570), Hex(0xFFFFFF, 6), 20) = True  Then

		   SetLog("Upgrade Building 4 Pos X:Y "& GUICtrlRead($txtUpgradeX4) &":" & GUICtrlRead($txtUpgradeY4) , $COLOR_BLUE) ;
		   _Sleep(1000)
		   ;checkButtonUpgrade()

      _Sleep(1000)
	   Click(516, 587)
	   _Sleep(1000)
   Click(472, 482)
   _Sleep(1000)
                  SetLog("Upgrade Building 4 Done !!!", $COLOR_BLUE) ; Done upgrade
								   Sleep(500)
Else
					Click(1, 1) ; Click away
					_Sleep(1000)
				Endif
			EndIf
EndFunc
Func UpgradeToBuilding5()

If GUICtrlRead($chkUpgrade5) <> $GUI_CHECKED Then
		; SetLog("Upgrade Building 5 option disabled, skipping upgrade ", $COLOR_RED)
		Return
	 EndIf
	  VillageReport()
If $FreeBuilder = 0 Then
		SetLog("No builders available", $COLOR_RED)
		Click(1, 1) ; Click Away
		Return
	EndIf
	 _Sleep(1000)
	  Click(GUICtrlRead($txtUpgradeX5), GUICtrlRead($txtUpgradeY5));,
	  	  _Sleep(1000)

	 _CaptureRegion()

	 If _ColorCheck(_GetPixelColor(549, 569), Hex(0xE70A12, 6), 20) or  _ColorCheck(_GetPixelColor(464, 442), Hex(0xE70A12, 6), 20)  Then
				SetLog("Not enough Gold or Elixir...", $COLOR_ORANGE)
				Click(1, 1) ; Click Away
				$upgradebuild = 0
				Else
	 If _ColorCheck(_GetPixelColor(549, 570), Hex(0xFFFFFF, 6), 20) = True  or _ColorCheck(_GetPixelColor(540, 570), Hex(0xFFFFFF, 6), 20) = True  Then

		   SetLog("Upgrade Building 5 Pos X:Y "& GUICtrlRead($txtUpgradeX5) &":" & GUICtrlRead($txtUpgradeY5) , $COLOR_BLUE) ;
		   _Sleep(1000)
		   ;checkButtonUpgrade()

      _Sleep(1000)
	  Click(516, 587)
	   _Sleep(1000)
   Click(472, 482)
   _Sleep(1000)
                 SetLog("Upgrade Building 5 Done !!!", $COLOR_BLUE) ; Done upgrade
								   Sleep(500)
Else
					Click(1, 1) ; Click away
					_Sleep(1000)
				Endif
			EndIf
EndFunc
Func UpgradeToBuilding6()

If GUICtrlRead($chkUpgrade6) <> $GUI_CHECKED Then
		; SetLog("Upgrade Building 6 option disabled, skipping upgrade ", $COLOR_RED)
		Return
	 EndIf
	  VillageReport()
If $FreeBuilder = 0 Then
		SetLog("No builders available", $COLOR_RED)
		Click(1, 1) ; Click Away
		Return
	 EndIf
	 _Sleep(1000)
	  Click(GUICtrlRead($txtUpgradeX6), GUICtrlRead($txtUpgradeY6))
	  	  _Sleep(1000)
	 _CaptureRegion()

	 If _ColorCheck(_GetPixelColor(549, 569), Hex(0xE70A12, 6), 20) or  _ColorCheck(_GetPixelColor(464, 442), Hex(0xE70A12, 6), 20)  Then
				SetLog("Not enough Gold or Elixir...", $COLOR_ORANGE)
				Click(1, 1) ; Click Away
				$upgradebuild = 0
				Else
	 If _ColorCheck(_GetPixelColor(549, 570), Hex(0xFFFFFF, 6), 20) = True  or _ColorCheck(_GetPixelColor(540, 570), Hex(0xFFFFFF, 6), 20) = True  Then

		   SetLog("Upgrade Building 6 Pos X:Y "& GUICtrlRead($txtUpgradeX6) &":" & GUICtrlRead($txtUpgradeY6) , $COLOR_BLUE) ;
		   _Sleep(1000)
		   ;checkButtonUpgrade()

      _Sleep(1000)
	 Click(516, 587)
	   _Sleep(1000)
   Click(472, 482)
   _Sleep(1000)
                 SetLog("Upgrade Building 6 Done !!!", $COLOR_BLUE) ; Done upgrade
								   Sleep(500)
Else
					Click(1, 1) ; Click away
					_Sleep(1000)
				Endif
			EndIf
EndFunc
#cs
Func UpgradeToBuildingCustom()


		   Click(GUICtrlRead($txtUpgradeX3), GUICtrlRead($txtUpgradeY3));, _ ;settings
		   SetLog("Upgrade Building 3 Pos X:Y "& GUICtrlRead($txtUpgradeX3) &":" & GUICtrlRead($txtUpgradeY3) , $COLOR_BLUE) ; Done upgrade
		   _Sleep(1000)
		   ;checkButtonUpgrade()
  ;Click(GUICtrlRead($txtUpgradeX2),  GUICtrlRead($txtUpgradeY2));, _ ;choose language
      _Sleep(1000)
	   Click(456, 602)
	   _Sleep(1000)
   Click(472, 482)
   _Sleep(1000)
   Click(1, 1)
   _Sleep(1000)

               SetLog("Upgrade Building 3 Done !!!", $COLOR_BLUE) ; Done upgrade
								   Sleep(500)

EndFunc
#ce
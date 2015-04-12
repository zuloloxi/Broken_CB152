;Drops Clan Castle troops, given the slot and x, y coordinates.

Func dropCC($x, $y, $slot, $CenterLoc = 1) ;Drop clan castle
	Local $useCastle = ($searchDead) ? $checkDeadUseClanCastle : $checkUseClanCastle
	If $slot <> -1 And $useCastle = 1 Then
		SetLog("Dropping Clan Castle", $COLOR_BLUE)
		Click(68 + (72 * $slot), 595)
		If _Sleep(500) Then Return
		Click($x, $y, 1, 500, $CenterLoc, 30)
		_GDIPlus_GraphicsDrawEllipse($Buffer, $x - 4, $y - 4, 8, 8, $pCC)
	EndIf
EndFunc   ;==>dropCC

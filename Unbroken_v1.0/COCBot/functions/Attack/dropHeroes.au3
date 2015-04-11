;Will drop heroes in a specific coordinates, only if slot is not -1
;Only drops when option is clicked.

Func dropHeroes($x, $y, $KingSlot = -1, $QueenSlot = -1, $CenterLoc = 1) ;Drops for king and queen
	While 1
		If _Sleep(2000) Then ExitLoop

		Local $useKing = ($searchDead) ? $checkDeadUseKing : $checkUseKing
		Local $useQueen = ($searchDead) ? $checkDeadUseQueen : $checkUseQueen

		If $KingSlot <> -1 And $useKing = 1 Then
			SetLog("Dropping King", $COLOR_BLUE)
			Click(68 + (72 * $KingSlot), 595) ;Select King
			If _Sleep(500) Then Return
			Click($x, $y, 1, 0, $CenterLoc, 30)
			_GDIPlus_GraphicsDrawEllipse($Buffer, $x - 6, $y - 6, 12, 12, $pKing)
			$checkKPower = True
		EndIf

		If _Sleep(1000) Then ExitLoop

		If $QueenSlot <> -1 And $useQueen = 1 Then
			SetLog("Dropping Queen", $COLOR_BLUE)
			Click(68 + (72 * $QueenSlot), 595) ;Select Queen
			If _Sleep(500) Then Return
			Click($x, $y, 1, 0, $CenterLoc, 30)
			_GDIPlus_GraphicsDrawEllipse($Buffer, $x - 5, $y - 5, 10, 10, $pQueen)
			$checkQPower = True
		EndIf

		ExitLoop
	WEnd
EndFunc   ;==>dropHeroes

Func checkupdate()
	If $ichkUpdate=1 Then
		Local $sFilePath = @TempDir & "\update.dat"

		Local $hMasterVersion = InetGet("https://github.com/cool7su/Broken_Clashbot/blob/master/COC%20Bot.au3", $sFilePath, 3)

		if $hMasterVersion = 0 Then
			SetLog("Failed to check updated version info.")
		Else
			$hReadFile = FileOpen($sFilePath)
			While True
				$strReadLine = FileReadLine($hReadFile)
				If @error Then ExitLoop
				if StringInStr($strReadLine, "$sBotVersion") Then
					$split = StringSplit($strReadLine, "&quot;", 1)
					SetLog("Version of master branch online: " & $split[2])
					If Number($sBotVersion) < Number($split[2]) Then
						SetLog("Update needed.")
						If MsgBox($MB_OKCANCEL, "Update needed!", "There is a newer version available online." & @CRLF & @CRLF & "Press OK to open GitHub website and shutdown bot." & @CRLF & "You will need to install and compile the new version." & @CRLF & @CRLF & "Or click cancel to skip.", 0, $frmBot) = $IDOK Then
							ShellExecute("https://github.com/cool7su/Broken_Clashbot")
							_GDIPlus_Shutdown()
							_GUICtrlRichEdit_Destroy($txtLog)
							Exit
						EndIf
					ElseIf Number($sBotVersion) > Number($split[2]) Then
						SetLog("You appear to be ahead of master.")
					Else
						SetLog("No update needed.")
					EndIf
					FileClose($hReadFile)
					FileDelete($sFilePath)
					Return
				EndIf
			WEnd
			SetLog("Failed to check updated version info.")
			FileClose($hReadFile)
			FileDelete($sFilePath)
		EndIf
	EndIf
EndFunc
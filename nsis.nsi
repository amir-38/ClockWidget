!include MUI2.nsh

Name "ClockWidget"
OutFile "ClockWidgetSetup.exe"
InstallDir "$PROGRAMFILES\ClockWidget"

!define MUI_STARTMENUPAGE_DEFAULTFOLDER "ClockWidget"
!define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\Readme.txt"

Section
    SetOutPath $INSTDIR
    File /r "dist\*.*"

SectionEnd

Section "Desktop Shortcut"
    SetShellVarContext all
    CreateShortcut "$DESKTOP\ClockWidget.lnk" "$INSTDIR\win-unpacked\clock.exe"
SectionEnd

Section "Start Menu Shortcut"
    SetShellVarContext all
    CreateShortcut "$SMPROGRAMS\ClockWidget.lnk" "$INSTDIR\win-unpacked\clock.exe"
SectionEnd

!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_LANGUAGE English

@ECHO OFF

if not exist "%~dp0dfu-programmer.exe" (
	echo Cannot find dfu-programmer.exe. Please run this .bat script in the same directory where dfu-programmer.exe is saved.
	pause > nul
	exit
)

if not exist "%~dp0Chameleon-RevG.eep" (
	echo Cannot find Chameleon-RevG.eep. Please run this .bat script in the same directory where Chameleon-RevG.eep and Chameleon-RevG.hex are saved.
	pause > nul
	exit
)

if not exist "%~dp0Chameleon-RevG.hex" (
	echo Cannot find Chameleon-RevG.hex. Please run this .bat script in the same directory where Chameleon-RevG.eep and Chameleon-RevG.hex are saved.
	pause > nul
	exit
)

"%~dp0dfu-programmer.exe" atxmega128a4u erase

IF %ERRORLEVEL% NEQ 0 (
	echo There was an error with executing this command. Maybe your ChameleonMini is not in bootloader mode?
	pause > nul
	exit
)

"%~dp0dfu-programmer.exe" atxmega128a4u flash-eeprom "%~dp0Chameleon-RevG.eep" --force

IF %ERRORLEVEL% NEQ 0 (
	echo There was an error with executing this command. Maybe your ChameleonMini is not in bootloader mode?
	pause > nul
	exit
)

"%~dp0dfu-programmer.exe" atxmega128a4u flash "%~dp0Chameleon-RevG.hex"

IF %ERRORLEVEL% NEQ 0 (
	echo There was an error with executing this command. Maybe your ChameleonMini is not in bootloader mode?
	pause > nul
	exit
)

"%~dp0dfu-programmer.exe" atxmega128a4u launch

echo Flashing the firmware to your ChameleonMini is finished now.
pause > nul
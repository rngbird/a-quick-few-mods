setlocal enabledelayedexpansion

if not exist "mods" (
  mkdir mods
)

if not exist "tools" (
  mkdir tools
)

if not exist "scripts" (
  mkdir scripts
)

if not exist "tools\ump.csx" (
  powershell -Command "Invoke-WebRequest -Uri 'https://github.com/nhaar/UMP/releases/download/v4.1.1/ump.csx' -OutFile 'tools\ump.csx'"
)

if not exist "tools\utmt" (
  powershell -Command "Invoke-WebRequest -Uri 'https://github.com/UnderminersTeam/UndertaleModTool/releases/download/0.8.3.0/UTMT_CLI_v0.8.3.0-Windows.zip' -OutFile 'tools\utmt.zip'"
  powershell -Command "Expand-Archive -Path 'tools\utmt.zip' -DestinationPath 'tools\utmt'"
  del "tools\utmt.zip"
)

if not exist "original_data.win" (
  copy "..\data.win" "original_data.win"
)

if exist "..\data.win" (
  del "..\data.win"
)
copy "original_data.win" "..\data.win"

cd ../

set "SCRIPT_LIST="
for %%f in ("modmanager\scripts\*.csx") do (
    set "SCRIPT_LIST=!SCRIPT_LIST! "%%~f""
)

"modmanager\tools\utmt\UndertaleModCli.exe" load "data.win" --scripts !SCRIPT_LIST! "modmanager\src\main.csx" --output "data.win"

pause

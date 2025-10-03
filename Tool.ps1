#######################
# Version 1
#######################

#######################
#                     #
# Made by             #
# SercretProgrammer   #
#  On Github          #
#                     #
#######################

net session
cls
write-host "###################"
write-host "#Project Made by  #"
write-host "#SercretProgrammer#"
write-host "#On Github        #"
write-host "###################"
write-host ""
write-host "About This Project: This Project allows you to Open tweakers"
write-host "version: 1 - FIRST VERSION EVER!"
write-host "Credits: "
write-host "ChrisTitusTech - Chris Titus Tool"
write-host "Sergey Tkachenko - Winaero Tweaker"
write-host ""
if (-not ($LASTEXITCODE -eq 0)) {
write-host "your are not running as Administrator, you can still use it but features are limited / may fail"
} else {
write-host "Great, you are running as Administrator, You can use more Features!"
}
winget --version
write-host "Error code: $LASTEXITCODE"
if ($LASTEXITCODE -eq 0) {
write-host "Most Features uses WinGet in this project and you have it Great!"
} else {
write-host "[Warning]: Most Features uses winget But you do not have it" -ForegroundColor Black -BackgroundColor Yellow
write-host "Please Install it at https://apps.microsoft.com/store/detail/app-installer/9NBLGGH4NNS1"
write-host "Press Any key to Open the browser and start the link"
Pause
Start-Process "https://apps.microsoft.com/store/detail/app-installer/9NBLGGH4NNS1"
}

Write-host "Press Any key to start"
Pause
Clear

function Open-AppMenu { 
write-host "EVERY APP [Only Microsoft Store Ones] REQUIRES WinGet TO INSTALL FROM HERE!"
write-host "1. Windows Terminal - ID Microsoft.WindowsTerminal"
write-host "2. Lively Wallpaper - ID rocksdanister.LivelyWallpaper"
write-host "3. Microsoft Power Toys - ID Microsoft.PowerToys"
write-host "4. TranslucentTB - CharlesMilette.TranslucentTB"
write-host "5. TaskbarX - https://github.com/ChrisAnd1998/TaskbarX"
$AppChoice = Read-Host "Choose One"

Open-AppMenuChoice

}

function Download-Zip {
param (
[string]$URL,
[string]$OUTZIP
)
$INSTALLDIR = Read-Host "where do you want the exe to be? [Example: D:\Path\To\location]"
if (Test-Path $INSTALLDIR) {
$zipPath = Join-Path $INSTALLDIR $OUTZIP
Invoke-WebRequest -Uri $URL -OutFile $zipPath
Expand-Archive -Path $zipPath -DestinationPath $INSTALLDIR -Force
} else {
Write-Host "ERROR: The Path Does Not Exist"
}
}
function Install-TaskbarX {

switch ($env:PROCESSOR_ARCHITECTURE) {
AMD64 {Download-Zip https://github.com/ChrisAnd1998/TaskbarX/releases/download/1.7.8.0/TaskbarX_1.7.8.0_x64.zip TaskbarX.zip}
ARM {Download-Zip https://github.com/ChrisAnd1998/TaskbarX/releases/download/1.7.8.0/TaskbarX_1.7.8.0_arm.zip TaskbarX.zip}
X86 {Download-Zip https://github.com/ChrisAnd1998/TaskbarX/releases/download/1.7.8.0/TaskbarX_1.7.8.0_x86.zip TaskbarX.zip}
}

}

function Open-AppMenuChoice {

switch ($AppChoice) {
 1 {winget install Microsoft.WindowsTerminal}
 2 {winget install rocksdanister.LivelyWallpaper}
 3 {winget install Microsoft.PowerToys}
 4 {winget install CharlesMilette.TranslucentTB}
 5 {Install-TaskbarX
   Start-Process (Get-ChildItem -Path $INSTALLDIR -Filter "TaskbarX.exe" | Select-Object -First 1).FullName}
}

}

function Open-GodMode {
$TempFolder = Get-Random -Maximum 1000000
cd $env:TEMP
mkdir $TempFolder
cd $TempFolder
mkdir "GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}"
Start-Process -FilePath "GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}"
}

function Start-Winaerotweaker {
$INSTALLDIR = Read-Host "where do you want the exe to be? [Example: D:\Path\To\location]"
if (Test-Path $INSTALLDIR) {
Invoke-WebRequest -Uri "https://winaerotweaker.com/download/winaerotweaker.zip" -OutFile (Join-Path $INSTALLDIR "winaerotweaker.zip")
$zipFile = Join-Path $INSTALLDIR "winaerotweaker.zip"
Expand-Archive -Path $zipFile -DestinationPath $INSTALLDIR -Force
Pause
Start-Process (Get-ChildItem -Path $INSTALLDIR -Filter "WinaeroTweaker*.exe" | Select-Object -First 1).FullName -Wait
write-host "Note: You have to manualling install it, then run it, easy right"
} else {
Write-Host "ERROR: The Path Does Not Exist"
}
}

function Open-MenuTip {
Write-Host "Tools Rating: "
Write-Host "Green: Safe" -ForegroundColor Black -BackgroundColor Green
Write-host "Blue: Dangerous If Misuse" -ForegroundColor White -BackgroundColor Blue
Write-host "Black: Can Easily be Dangerous, Only Power/Advenced Users" -ForegroundColor White -BackgroundColor Black
write-host ""
Write-Host "Tools are rated with Colors! awesome right?"
Pause
}
function Open-Menu {
Clear
Write-Host "1. Winaero Tweaker" -ForegroundColor White -BackgroundColor Blue
Write-Host "2. Chris titus tool" -ForegroundColor White -BackgroundColor Black
Write-Host "3. Install QoL Programs" -ForegroundColor White -BackgroundColor Blue
Write-Host "4. Windows God Mode Folder" -ForegroundColor White -BackgroundColor Blue
}

function Start-MenuChoice {
$choice = Read-Host "Choose One"
write-host "$choice"

switch ($choice) {
1 {Start-Winaerotweaker}
2 {iwr -useb https://christitus.com/win | iex}
3 {Open-AppMenu}
4 {Open-GodMode}
}

}

open-MenuTip
while ($true) {
clear
Open-Menu
Start-MenuChoice
}

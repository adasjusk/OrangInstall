@echo off
::Coded By TheAdas
::START
::Updated 2024/06/15
cls
title Orange Booster
::Menu
:menu 
cls
echo +-------------------------------------------+
echo +         Programs Installer 2.0            +
echo +-------------------------------------------+
echo  0. Wiew Windows Version
echo  1. Brave Browser
echo  2. Chrome Browser
echo  3. Discord
echo  4. Viber
echo  5. OBS Studio
echo  6. Epic games
echo  7. Steam
echo  8. Minecraft (Legacy)
echo  9. Minecraft (Windows 11/10) 
echo  10.SkLauncher (Cracked Minecraft)
echo  11.Java Eclipse Temurin JDK 21 (dependency For SkLauncher)
echo  12.VoiceMod
echo  13.AMD Drivers
echo  14.NVIDIA Drivers NVCleanstall
echo  15.Visual Studio Code
echo  16.Malwarebytes Antivirus
echo  17.WinRar
echo  18.Everything Search
echo  19.Orange Booster {BOOST PC FOR FREE!!!}
echo  20.PDF Reader (Adobe Acrobat Reader)
echo  21.Notepad ++
echo  22.Visual C++ 2015-2022
echo +-------------------------------------------+
echo +           Diagnostics for PC              +
echo +-------------------------------------------+
echo  23.CPU-Z
echo  24.GPU-Z
echo  25.AIDA64
echo  26.Speccy
echo +-------------------------------------------+
set /p choice=choose from (1 to 26):

::Main 
if "%choice%"=="0" goto winver
if "%choice%"=="1" goto br
if "%choice%"=="2" goto cb
if "%choice%"=="3" goto dc
if "%choice%"=="4" goto vb
if "%choice%"=="5" goto obs
if "%choice%"=="6" goto eg
if "%choice%"=="7" goto st
if "%choice%"=="8" goto mcl
if "%choice%"=="9" goto mcw
if "%choice%"=="10" goto skl
if "%choice%"=="11" goto java
if "%choice%"=="12" goto vcm
if "%choice%"=="13" goto amd
if "%choice%"=="14" goto nv
 if "%choice%"=="15" goto vsc
 if "%choice%"=="16" goto mb
 if "%choice%"=="17" goto winr
 if "%choice%"=="18" goto evr
 if "%choice%"=="19" goto ob
 if "%choice%"=="20" goto pdf
 if "%choice%"=="21" goto np
 if "%choice%"=="22" goto vc++
 if "%choice%"=="23" goto cpuz
 if "%choice%"=="24" goto gpuz
 if "%choice%"=="25" goto aida64
 if "%choice%"=="26" goto speccy


:winver
winver
cls
goto menu

:br
bitsadmin /transfer Installer /download /priority normal https://laptop-updates.brave.com/download/BRV002?bitness=64 %USERPROFILE%\AppData\Local\Temp\BraveBrowserSetup-BRV002.exe
%USERPROFILE%\AppData\Local\Temp\BraveBrowserSetup-BRV002.exe
cls
goto menu

:cb
bitsadmin /transfer Installer /download /priority normal https://www.google.com/chrome/next-steps.html?installdataindex=empty&statcb=0&defaultbrowser=0# %USERPROFILE%\AppData\Local\Temp\ChromeSetup.exe
%USERPROFILE%\AppData\Local\Temp\ChromeSetup.exe
cls
goto menu

:dc
bitsadmin /transfer Installer /download /priority normal https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x64 %USERPROFILE%\AppData\Local\Temp\DiscordSetup.exe
cmd /k %USERPROFILE%\AppData\Local\Temp\DiscordSetup.exe
cls
goto menu

:vb
bitsadmin /transfer Installer /download /priority normal https://download.cdn.viber.com/desktop/windows/ViberSetup.exe %USERPROFILE%\AppData\Local\Temp\ViberSetup.exe
%USERPROFILE%\AppData\Local\Temp\ViberSetup.exe
cls
goto menu

:obs
bitsadmin /transfer Installer /download /priority normal https://cdn-fastly.obsproject.com/downloads/OBS-Studio-30.1.2-Full-Installer-x64.exe %USERPROFILE%\AppData\Local\Temp\OBS-Studio-30.1.2-Full-Installer-x64.exe
%USERPROFILE%\AppData\Local\Temp\OBS-Studio-30.1.2-Full-Installer-x64.exe
 cls
goto menu

:eg
bitsadmin /transfer Installer /download /priority normal https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi %USERPROFILE%\AppData\Local\Temp\EpicGamesLauncherInstaller.msi
%USERPROFILE%\AppData\Local\Temp\EpicGamesLauncherInstaller.msi
cls
 goto menu

:st
bitsadmin /transfer Installer /download /priority normal https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe %USERPROFILE%\AppData\Local\Temp\SteamSetup.exe
%USERPROFILE%\AppData\Local\Temp\SteamSetup.exe
cls
goto menu

:mcl
bitsadmin /transfer Installer /download /priority normal https://launcher.mojang.com/download/MinecraftInstaller.msi?ref=mcnet %USERPROFILE%\AppData\Local\Temp\MinecraftInstaller.msi
%USERPROFILE%\AppData\Local\Temp\MinecraftInstaller.msi
cls
goto menu

:mcw
bitsadmin /transfer Installer /download /priority normal https://launcher.mojang.com/download/MinecraftInstaller.exe?ref=mcnet %USERPROFILE%\AppData\Local\Temp\MinecraftInstaller.exe
%USERPROFILE%\AppData\Local\Temp\MinecraftInstaller.exe
cls
goto menu

:skl
bitsadmin /transfer Installer /download /priority normal https://skmedix.pl/binaries/skl/3.2.8/x64/SKlauncher-3.2.exe %USERPROFILE%\Desktop\SKlauncher.exe
%USERPROFILE%\Desktop\SKlauncher.exe
cls
goto menu

:java
bitsadmin /transfer Installer /download /priority normal https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.3%2B9/OpenJDK21U-jre_x64_windows_hotspot_21.0.3_9.msi %USERPROFILE%\AppData\Local\Temp\OpenJDK21U-jre_x64_windows_hotspot_21.0.3_9.msi
%USERPROFILE%\AppData\Local\Temp\OpenJDK21U-jre_x64_windows_hotspot_21.0.3_9.msi
cls
goto menu

:vcm
bitsadmin /transfer Installer /download /priority normal https://www.voicemod.net/b2c/v2/VoicemodSetup_2.48.4.0.exe %USERPROFILE%\AppData\Local\Temp\VoicemodSetup_2.48.4.0.exe
%USERPROFILE%\AppData\Local\Temp\VoicemodSetup_2.48.4.0.exe
 cls
goto menu

:amd
bitsadmin /transfer Installer /download /priority normal https://drivers.amd.com/drivers/installer/23.40/whql/amd-software-adrenalin-edition-24.5.1-minimalsetup-240514_web.exe %USERPROFILE%\AppData\Local\Temp\amd-software-adrenalin-edition-24.5.1-minimalsetup-240514_web.exe
%USERPROFILE%\AppData\Local\Temp\amd-software-adrenalin-edition-24.5.1-minimalsetup-240514_web.exe
cls
 goto menu

:nv
bitsadmin /transfer Installer /download /priority normal https://de1-dl.techpowerup.com/files/fL-CCcW4Uk326dsd3Alf0Q/1718346506/NVCleanstall_1.16.0.exe %USERPROFILE%\AppData\Local\Temp\NVCleanstall_1.16.0.exe
%USERPROFILE%\AppData\Local\Temp\NVCleanstall_1.16.0.exe
cls
goto menu

:vsc
bitsadmin /transfer Installer /download /priority normal https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user %USERPROFILE%\AppData\Local\Temp\VSCodeUserSetup-x64-1.90.1.exe
%USERPROFILE%\AppData\Local\Temp\VSCodeUserSetup-x64-1.90.1.exe
cls
goto menu

:mb
bitsadmin /transfer Installer /download /priority normal https://www.malwarebytes.com/api/downloads/mb-windows?filename=MBSetup.exe&t=1718303406922 %USERPROFILE%\AppData\Local\Temp\MBSetup.exe
%USERPROFILE%\AppData\Local\Temp\MBSetup.exe
cls
goto menu

:winr
bitsadmin /transfer Installer /download /priority normal https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-701.exe %USERPROFILE%\AppData\Local\Temp\winrar-x64-701.exe
%USERPROFILE%\AppData\Local\Temp\winrar-x64-701.exe
cls
goto menu

:evr
bitsadmin /transfer Installer /download /priority normal https://www.voidtools.com/Everything-1.4.1.1024.x86-Setup.exe %USERPROFILE%\AppData\Local\Temp\Everything-1.4.1.1024.x86-Setup.exe
%USERPROFILE%\AppData\Local\Temp\Everything-1.4.1.1024.x86-Setup.exe
cls
goto menu

:ob
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "Start-Process powershell.exe -verb runas -ArgumentList 'irm https://raw.githubusercontent.com/adasjusk/Orange-Booster/main/get.ps1 | iex'
cls
goto menu

:pdf
bitsadmin /transfer Installer /download /priority normal https://get.adobe.com/reader/download?os=Windows+10&name=Reader+2024.002.20759+English+Windows%2864Bit%29&lang=en&nativeOs=Windows+10&accepted=cr&declined=mss&preInstalled=&site=landing %USERPROFILE%\AppData\Local\Temp\Reader_en_install.exe
%USERPROFILE%\AppData\Local\Temp\Reader_en_install.exe
cls
goto menu

:np
bitsadmin /transfer Installer /download /priority normal https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.6.6/npp.8.6.6.Installer.x64.exe %USERPROFILE%\AppData\Local\Temp\npp.8.6.6.Installer.x64.exe
%USERPROFILE%\AppData\Local\Temp\npp.8.6.6.Installer.x64.exe
cls
goto menu

:vc++
bitsadmin /transfer Installer /download /priority normal https://aka.ms/vs/17/release/vc_redist.x64.exe %USERPROFILE%\AppData\Local\Temp\vc_redist.x64.exe
%USERPROFILE%\AppData\Local\Temp\vc_redist.x64.exe
cls
goto menu

:cpuz
bitsadmin /transfer Installer /download /priority normal https://www.cpuid.com/downloads/cpu-z/cpu-z_2.09-en.exe %USERPROFILE%\AppData\Local\Temp\cpu-z_2.09-en.exe
%USERPROFILE%\AppData\Local\Temp\cpu-z_2.09-en.exe
cls
goto menu

:gpuz
bitsadmin /transfer Installer /download /priority normal https://de1-dl.techpowerup.com/files/EiTeDWws8GQiujEdAk5WQw/1718411455/GPU-Z.2.59.0.exe %USERPROFILE%\AppData\Local\Temp\GPU-Z.2.59.0.exe
%USERPROFILE%\AppData\Local\Temp\GPU-Z.2.59.0.exe
 cls
 goto menu

:aida64
bitsadmin /transfer Installer /download /priority normal https://download.aida64.com/aida64extreme730.exe %USERPROFILE%\AppData\Local\Temp\aida64extreme730.exe
%USERPROFILE%\AppData\Local\Temp\aida64extreme730.exe
cls
goto menu

:speccy
bitsadmin /transfer Installer /download /priority normal https://download.ccleaner.com/spsetup133.exe %USERPROFILE%\AppData\Local\Temp\spsetup133.exe
%USERPROFILE%\AppData\Local\Temp\spsetup133.exe
cls
goto menu

::END
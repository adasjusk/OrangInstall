@echo off
title Coded By TheAdas
::Updated 2024/06/20
cls
:menu 
cls
echo +-----------------------------------------------------------+
echo +         Programs Installer 4.0 Ver Prewiew\Beta           +
echo +-----------------------------------------------------------+
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
echo  23.CPU-Z
echo  24.GPU-Z
echo  25.AIDA64
echo  26.Speccy
echo +-------------------------------------------+
echo + This Is Unstable Version Of This Program  +
echo + 100. Option Is A Link To Report Bug       +
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
if "%choice%"=="100" goto 100

:100
echo Be Great Person Report Issue To https://github.com/adasjusk/PROGINSTALLER/issues/new I Will Fix Issue

:winver
winver
cls
goto menu

:br
bitsadmin /transfer installer /download /priority high https://referrals.brave.com/latest/BraveBrowserSetup.exe %Temp%\BraveBrowserSetup.exe
start %Temp%\BraveBrowserSetup.exe
cls
goto menu

:cb
bitsadmin /transfer installer /download /priority high https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7B3E7AF87D-C9F0-271F-0B0F-26C37D536D13%7D%26lang%3Den%26browser%3D4%26usagestats%3D1%26appname%3DGoogle%2520Chrome%26needsadmin%3Dprefers%26ap%3Dx64-statsdef_1%26installdataindex%3Dempty/update2/installers/ChromeSetup.exe %Temp%\Chrome.exe
start %Temp%\Chrome.exe
cls
goto menu

:dc
bitsadmin /transfer Installer /download /priority high  %Temp%\DiscordSetup.exe
start %Temp%\DiscordSetup.exe
cls
goto menu

:vb
bitsadmin /transfer Installer /download /priority high https://download.cdn.viber.com/desktop/windows/ViberSetup.exe %Temp%\ViberSetup.exe
start %Temp%\ViberSetup.exe
cls
goto menu

:obs
bitsadmin /transfer Installer /download /priority high https://cdn-fastly.obsproject.com/downloads/OBS-Studio-30.1.2-Full-Installer-x64.exe %Temp%\OBS.exe
start %Temp%\OBS.exe
 cls
goto menu

:eg
bitsadmin /transfer Installer /download /priority high https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi %Temp%\Epic.msi
start %Temp%\Epic.msi
cls
 goto menu

:st
bitsadmin /transfer Installer /download /priority high https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe %Temp%\SteamSetup.exe
start %Temp%\SteamSetup.exe
cls
goto menu

:mcl
bitsadmin /transfer Installer /download /priority high https://launcher.mojang.com/download/MinecraftInstaller.msi %Temp%\MinecraftInstaller.msi
start %Temp%\MinecraftInstaller.msi
cls
goto menu

:mcw
bitsadmin /transfer Installer /download /priority high https://launcher.mojang.com/download/MinecraftInstaller.exe %Temp%\MinecraftInstaller.exe
start %Temp%\MinecraftInstaller.exe
cls
goto menu

:skl
bitsadmin /transfer Installer /download /priority high https://skmedix.pl/binaries/skl/3.2.8/x64/SKlauncher-3.2.exe %USERPROFILE%\Desktop\SKlauncher.exe
start %USERPROFILE%\Desktop\SKlauncher.exe
cls
goto menu

:java
bitsadmin /transfer Installer /download /priority high https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.3%2B9/OpenJDK21U-jre_x64_windows_hotspot_21.0.3_9.msi %Temp%\OpenJDK21.msi
start %Temp%\OpenJDK21.msi
cls
goto menu

:vcm
bitsadmin /transfer Installer /download /priority high https://www.voicemod.net/b2c/v2/VoicemodSetup_2.48.4.0.exe %Temp%\Voicemod.exe
start %Temp%\Voicemod.exe
cls
goto menu

:amd
bitsadmin /transfer Installer /download /priority high https://drivers.amd.com/drivers/installer/23.40/whql/amd-software-adrenalin-edition-24.5.1-minimalsetup-240514_web.exe %Temp%\amd.exe
start %Temp%\amd.exe
cls
goto menu

:nv
bitsadmin /transfer Installer /download /priority high https://de1-dl.techpowerup.com/files/fL-CCcW4Uk326dsd3Alf0Q/1718346506/NVCleanstall_1.16.0.exe %Temp%\NVCleanstall.exe
start %Temp%\NVCleanstall.exe
cls
goto menu

:vsc
bitsadmin /transfer Installer /download /priority high  %Temp%\VSCodeUser.exe
start %Temp%\VSCode.exe
cls
goto menu

:mb
bitsadmin /transfer Installer /download /priority high https://www.malwarebytes.com/api/downloads/mb-windows?filename=MBSetup.exe %Temp%\MBSetup.exe
start %Temp%\MBSetup.exe
cls
goto menu

:winr
bitsadmin /transfer Installer /download /priority high https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-701.exe %USERPROFILE%\AppData\Local\Temp\winrar.exe
start %Temp%\winrar.exe
cls
goto menu

:evr
bitsadmin /transfer Installer /download /priority high https://www.voidtools.com/Everything-1.4.1.1024.x86-Setup.exe %Temp%\Everything.exe
start %Temp%\Everything.exe
cls
goto menu

:bstr
bitsadmin /transfer booster /download /priority high https://raw.githubusercontent.com/adasjusk/Orange-Booster/main/bostr.bat %Temp%\o-bstr
cmd /k %Temp%\o-bstr
cls
goto menu

:pdf
bitsadmin /transfer Installer /download /priority high https://get.adobe.com/reader/download?os=Windows+10&name=Reader+2024.002.20759+English+Windows%2864Bit%29&lang=en&nativeOs=Windows+10&accepted=cr&declined=mss&preInstalled=&site=landing %Temp%\Reader.exe
start %Temp%\Reader.exe
cls
goto menu

:np
bitsadmin /transfer Installer /download /priority high https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.6.6/npp.8.6.6.Installer.x64.exe %Temp%\npp.exe
start %Temp%\npp.exe
cls
goto menu

:vc++
bitsadmin /transfer Installer /download /priority high https://aka.ms/vs/17/release/vc_redist.x64.exe %Temp%\vc.exe
start %Temp%\vc.exe
cls
goto menu

:cpuz
bitsadmin /transfer Installer /download /priority high https://www.cpuid.com/downloads/cpu-z/cpu-z_2.09-en.exe %Temp%\cpu.exe
start %Temp%\cpu.exe
cls
goto menu

:gpuz
bitsadmin /transfer Installer /download /priority high https://de1-dl.techpowerup.com/files/EiTeDWws8GQiujEdAk5WQw/1718411455/GPU-Z.2.59.0.exe %Temp%\gpu.exe
start %Temp%\gpu.exe
 cls
 goto menu

:aida64
bitsadmin /transfer Installer /download /priority high https://download.aida64.com/aida64extreme730.exe %Temp%\aida6.exe
start %Temp%\aida.exe
cls
goto menu

:speccy
bitsadmin /transfer Installer /download /priority high https://download.ccleaner.com/spsetup133.exe %Temp%\sp.exe
start %Temp%\sp.exe
cls
goto menu
:: END OF THE SCRIPT
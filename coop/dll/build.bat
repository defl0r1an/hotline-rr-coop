@echo off
rem Builds the 32-bit SuperRRCoop.dll (and the loopback test) with MSVC 2022 BuildTools.
setlocal
set ROOT=%~dp0
set ENET=%ROOT%..\..\_tools\deps\enet\enet-1.3.18
call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars32.bat" >nul || exit /b 1
if not exist "%ROOT%build" mkdir "%ROOT%build"
pushd "%ROOT%build"
cl /nologo /LD /O2 /MT /EHsc /std:c++17 /W3 /DWIN32 /D_WINSOCK_DEPRECATED_NO_WARNINGS /I"%ENET%\include" ^
   "%ROOT%SuperRRCoop.cpp" "%ENET%\callbacks.c" "%ENET%\compress.c" "%ENET%\host.c" "%ENET%\list.c" ^
   "%ENET%\packet.c" "%ENET%\peer.c" "%ENET%\protocol.c" "%ENET%\win32.c" ^
   /Fe:SuperRRCoop.dll /link /DEF:"%ROOT%SuperRRCoop.def" ws2_32.lib winmm.lib iphlpapi.lib || (popd & exit /b 1)
cl /nologo /O2 /MT /EHsc "%ROOT%test_loopback.cpp" /Fe:test_loopback.exe || (popd & exit /b 1)
popd
echo BUILD OK

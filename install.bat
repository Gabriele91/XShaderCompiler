%echo off

rmdir install /s /q
mkdir install\lib\x64\Release
mkdir install\lib\x64\Debug
mkdir install\lib\x86\Release
mkdir install\lib\x86\Debug

REM Build 32-bit
mkdir Build32
cd Build32

REM Build Debug target
cmake -G "Visual Studio 14 2015" -DINSTALL_OUTPUT_PATH="%~dp0/install" ../
cmake --build . --config RelWithDebInfo
cmake --build . --config RelWithDebInfo --target install

move "%~dp0install\xsc_core.lib" "%~dp0install\lib\x86\Debug\xsc_core.lib"
move "%~dp0install\xsc_core.pdb" "%~dp0install\lib\x86\Debug\xsc_core.pdb"

REM Build Release target
cmake -G "Visual Studio 14 2015" -DINSTALL_OUTPUT_PATH="%~dp0/install" ../
cmake --build . --config Release
cmake --build . --config Release --target install

move "%~dp0install\xsc_core.lib" "%~dp0install\lib\x86\Release\xsc_core.lib"

REM Build 64-bit
cd ..
mkdir Build64
cd Build64

REM Build Debug target
cmake -G "Visual Studio 14 2015 Win64" -DINSTALL_OUTPUT_PATH="%~dp0/install" ../
cmake --build . --config RelWithDebInfo
cmake --build . --config RelWithDebInfo --target install

move "%~dp0install\xsc_core.lib" "%~dp0install\lib\x64\Debug\xsc_core.lib"
move "%~dp0install\xsc_core.pdb" "%~dp0install\lib\x64\Debug\xsc_core.pdb"

REM Build Release target
cmake -G "Visual Studio 14 2015 Win64" -DINSTALL_OUTPUT_PATH="%~dp0/install" ../
cmake --build . --config Release
cmake --build . --config Release --target install

move "%~dp0install\xsc_core.lib" "%~dp0install\lib\x64\Release\xsc_core.lib"

cd ..
rmdir Build32 /s /q
rmdir Build64 /s /q
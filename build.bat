@ECHO OFF
echo WARNING: This script assumes you have the 64 bit version of 7-zip installed to its
echo default location (or are running 32 bit Windows with it installed to default location).
echo.
echo Building Particle.love...
del Particle.love
cd src
"C:\Program Files\7-Zip\7z.exe" a -tzip ../distrib/Particle.love * -mx9
"C:\Program Files\7-Zip\7z.exe" a -tzip ../distrib/Particle.love ../README.md -mx9
cd ../distrib
echo Building Windows executables... (Warning: Needs administrative rights.)
copy /b win32/love.exe+./Particle.love win32/Particle.exe
copy /b win64/love.exe+./Particle.love win64/Particle.exe
echo Packaging Windows executables...
cd win32
"C:\Program Files\7-Zip\7z.exe" a -tzip ../Particle-win32.zip Particle.exe -mx9
"C:\Program Files\7-Zip\7z.exe" a -tzip ../Particle-win32.zip *.dll -mx9
"C:\Program Files\7-Zip\7z.exe" a -tzip ../Particle-win32.zip license.txt -mx9
"C:\Program Files\7-Zip\7z.exe" a -tzip ../Particle-win32.zip ../../README.md -mx9
cd ../win64
"C:\Program Files\7-Zip\7z.exe" a -tzip ../Particle-win64.zip Particle.exe -mx9
"C:\Program Files\7-Zip\7z.exe" a -tzip ../Particle-win64.zip *.dll -mx9
"C:\Program Files\7-Zip\7z.exe" a -tzip ../Particle-win64.zip license.txt -mx9
"C:\Program Files\7-Zip\7z.exe" a -tzip ../Particle-win64.zip ../../README.md -mx9
cd ..
echo Packaging a zip for linux...
"C:\Program Files\7-Zip\7z.exe" a -tzip Particle-linux.zip Particle.love -mx9
"C:\Program Files\7-Zip\7z.exe" a -tzip Particle-linux.zip Particle.sh -mx9
"C:\Program Files\7-Zip\7z.exe" a -tzip Particle-linux.zip ../LICENSE -mx9
"C:\Program Files\7-Zip\7z.exe" a -tzip Particle-linux.zip ../README.md -mx9
echo Packaging a Mac version...
cd macosx
del "%cd%/Particle.app/Contents/Resources/Particle.love"
copy ../Particle.love "%cd%/Particle.app/Contents/Resources/Particle.love"
"C:\Program Files\7-Zip\7z.exe" a -tzip ../Particle_osx.zip Particle.app -mx9
cd ../..
echo Done.

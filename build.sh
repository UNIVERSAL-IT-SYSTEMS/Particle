#!/bin/bash
echo "Building Particle.love..."
rm -f ./Particle.love
cd src
zip -r ../distrib/Particle.love ./* ../README.md
cd ../distrib
echo "Building Windows executables..."
cat ./win32/love.exe ./Particle.love > ./win32/Particle.exe
cat ./win64/love.exe ./Particle.love > ./win64/Particle.exe
echo "Packaging Windows executables..."
cd win32
zip -r ../Particle-win32.zip ./Particle.exe ./*.dll ./license.txt ../../README.md
cd ../win64
zip -r ../Particle-win64.zip ./Particle.exe ./*.dll ./license.txt ../../README.md
cd ..
echo "Packaging a zip for linux..."
zip -r ./Particle-linux.zip ./Particle.love ./Particle.sh ../LICENSE ../README.md
echo "Packaging a Mac version..."
cd macosx
rm -f ./Particle.app/Contents/Resources/Particle.love
cp ../Particle.love ./Particle.app/Contents/Resources/Particle.love
zip -r ../Particle_osx.zip ./Particle.app
cd ../..
echo "Done."

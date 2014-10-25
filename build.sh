#!/bin/bash
echo "Building Particle.love..."
rm -f ./Particle.love
cd src
zip -r ../distrib/Particle.love ./*
cd ../distrib
echo "Building Windows executables..."
#rm -f ./win32/Particle.zip
cat ./win32/love.exe ./Particle.love > ./win32/Particle.exe
cat ./win64/love.exe ./Particle.love > ./win64/Particle.exe
echo "Packaging Windows executables..."
cd win32
zip -r ../Particle-win32.zip ./Particle.exe ./*.dll ./license.txt ../../README.md
cd ../win64
zip -r ../Particle-win64.zip ./Particle.exe ./*.dll ./license.txt ../../README.md
cd ..
zip -r ./Particle-linux.zip ./Particle.love ./Particle.sh ./license.txt ../../README.md
cd ..
echo "Done."

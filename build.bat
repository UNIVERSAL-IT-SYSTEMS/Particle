@ECHO OFF
echo Building... (Assumes you have 64 bit version of 7-zip installed
echo to default location.)
del Particle.love
cd src
"C:\Program Files\7-Zip\7z.exe" a -tzip ../Particle.love * -mx9
cd ..
echo Done.

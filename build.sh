#!/bin/bash
echo "Building Particle.love..."
rm -f ./Particle.love
cd src
zip -r ../Particle.love ./*
cd ..
echo "Done."

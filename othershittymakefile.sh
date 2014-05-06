#/bin/bash

g++ -Wall -D__MACOSX_CORE__ -o rtsine ./src/Stk.cpp  ./src/SineWave.cpp ./src/RtWvOut.cpp ./src/RtAudio.cpp ./src/Mutex.cpp rtsine.cpp -lpthread -framework CoreAudio -framework CoreMIDI -framework CoreFoundation -I./include/

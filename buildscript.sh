#/bin/bash
echo "g++ -Wall -D__MACOSX_CORE__ -o rtfft ./src/Stk.cpp  ./src/SineWave.cpp ./src/RtWvOut.cpp ./src/RtAudio.cpp ./src/Mutex.cpp rtfft.cpp -lpthread -framework CoreAudio -framework CoreMIDI -framework CoreFoundation -I./include/ -framework OpenCL -lclFFT -L./library/"

g++ -Wall -D__MACOSX_CORE__ -o rtfft ./src/Stk.cpp  ./src/SineWave.cpp ./src/RtWvOut.cpp ./src/RtAudio.cpp ./src/Mutex.cpp rtfft.cpp -lpthread -framework CoreAudio -framework CoreMIDI -framework CoreFoundation -I./include/ -framework OpenCL -lclFFT -L./library/

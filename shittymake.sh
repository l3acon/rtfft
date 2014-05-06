#/bin/bash
g++ -o testfft testfft.cpp -framework OpenCL -I./include/ -L./library/ -lclFFT


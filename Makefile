CC := g++
CFLAGS := -D__MACOSX_CORE__  -Wall #-v 
BUILDDIR := ./build
SRCDIR := ./src
L := ./library 
INC := ./include

FWS := -framework OpenCL -framework CoreAudio -framework CoreMIDI -framework CoreFoundation 
LIBDIR := /usr/local/include
LIB := -lclFFT -lpthread 

SOURCES := Stk.cpp SineWave.cpp  RtWvOut.cpp  RtAudio.cpp  Mutex.cpp  
SRCS := $(SOURCES:%.cpp=$(SRCDIR)/%.cpp)
REQALL := $(FWS) -L$(L) $(LIB) -I$(INC)



all: 
	@mkdir -p $(BUILDDIR)
	@echo "$(CC) $(CFLAGS) $(REQALL) $(SRCS) -o $(BUILDDIR)/rtfft rtfft.cpp "; $(CC) $(CFLAGS) $(REQALL) $(SRCS) -o $(BUILDDIR)/rtfft rtfft.cpp

#Stk:
#	@echo "$(CC) $(CFLAGS) $(REQALL) -c -o $(BUILDDIR)/Stk.o $(SRCDIR)/Stk.cpp"; $(CC) $(CFLAGS) $(REQALL) -c -o $(BUILDDIR)/Stk.o $(SRCDIR)/Stk.cpp


clean:
	rm build/*.o
	rm build/rtfft

# CLFFT
#g++ -o testfft testfft.cpp -framework OpenCL -I./include/ -L./library/ -lclFFT

# STK
#g++ -Wall -D__MACOSX_CORE__ -o rtsine ./src/Stk.cpp  ./src/SineWave.cpp ./src/RtWvOut.cpp ./src/RtAudio.cpp ./src/Mutex.cpp rtsine.cpp -lpthread -framework CoreAudio -framework CoreMIDI -framework CoreFoundation -I./include/

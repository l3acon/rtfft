CC := g++
CFLAGS := -D__MACOSX_CORE__  -Wall #-v 
BUILDDIR := build
SRCDIR := src
L := library 
INC := include

FWS := -framework OpenCL -framework CoreAudio -framework CoreMIDI -framework CoreFoundation 
LIBDIR := /usr/local/include
LIB := -lclFFT -lpthread 

OBJS := Stk.o SineWave.o  RtWvOut.o  RtAudio.o  Mutex.o  
SRCS := $(OBJS:%.o=$(SRCDIR)/%.cpp)
ALLDEPS := $(OBJS:%.o=$(BUILDDIR)/%.o)

REQALL := -L$(L) -I$(INC)


all:  $(ALLDEPS)
	@echo "$(CC) $(CFLAGS) $(FWS) $(LIB) -L$(L) -I$(INC) $(ALLDEPS) -o $(BUILDDIR)/rtfft rtfft.cpp "; $(CC) $(CFLAGS) -L$(L) -I$(INC) $(FWS) $(LIB) $(ALLDEPS) -o $(BUILDDIR)/rtfft rtfft.cpp
	
$(BUILDDIR)/%.o: $(SRCS)
	@mkdir -p $(BUILDDIR)
	@echo "$(CC) $(CFLAGS) $(REQALL) -I$(INC) -c -o $@ $(@:$(BUILDDIR)/%.o=$(SRCDIR)/%.cpp)";	$(CC) $(CFLAGS) -I$(INC) -c -o $@ $(@:$(BUILDDIR)/%.o=$(SRCDIR)/%.cpp)  

clean:
	rm build/*.o
	rm build/rtfft

# CLFFT
#g++ -o testfft testfft.cpp -framework OpenCL -I./include/ -L./library/ -lclFFT

# STK
#g++ -Wall -D__MACOSX_CORE__ -o rtsine ./src/Stk.cpp  ./src/SineWave.cpp ./src/RtWvOut.cpp ./src/RtAudio.cpp ./src/Mutex.cpp rtsine.cpp -lpthread -framework CoreAudio -framework CoreMIDI -framework CoreFoundation -I./include/

# developed for Mac OSX ONLY
# some build dependencies:
# 	Boost
# 	FFTW
# 	gcc >= 4.6
# 	OpenCL SDK

CC := g++
CFLAGS := -D__MACOSX_CORE__ -O3 -std=c++11 -Wall -pipe #-v
BUILDDIR := build
SRCDIR := src
L := library
INC := include
OUT := rtfft
TGT := rtfft.cpp

FWS := -framework OpenCL -framework CoreAudio -framework CoreMIDI -framework CoreFoundation 
LIBDIR := /usr/local/include
LIB := -lclFFT -lpthread 

OBJS := Stk.o Mutex.o Socket.o Thread.o RtMidi.o TcpServer.o RtWvOut.o RtAudio.o Voicer.o Messager.o Skini.o BeeThree.o FM.o FileWvIn.o FileRead.o TwoZero.o ADSR.o FileLoop.o SineWave.o
RCS := $(OBJS:%.o=$(SRCDIR)/%.cpp)
ALLDEPS := $(OBJS:%.o=$(BUILDDIR)/%.o)

all:  $(ALLDEPS)
	$(CC) $(CFLAGS) -L$(L) -I$(INC) $(FWS) $(LIB) $(ALLDEPS) -o $(BUILDDIR)/$(OUT) $(TGT) 
	
$(ALLDEPS):
	@mkdir -p $(BUILDDIR)
	$(CC) $(CFLAGS) -I$(INC) -c -o $@ $(@:$(BUILDDIR)/%.o=$(SRCDIR)/%.cpp)  

clean:
	rm build/*.o
	rm build/$(OUT)

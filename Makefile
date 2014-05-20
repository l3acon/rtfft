# developed for Mac OSX ONLY
# some build dependencies:
# 	Boost
# 	FFTW
# 	gcc >= 4.6
# 	OpenCL SDK

CC := g++
CFLAGS := -D__MACOSX_CORE__ -O3 -std=c++11 -Wall #-v 
BUILDDIR := build
SRCDIR := src
L := library 
INC := include
OUT := bee
TGT := threebees.cpp

FWS := -framework OpenCL -framework CoreAudio -framework CoreMIDI -framework CoreFoundation 
LIBDIR := /usr/local/include
LIB := -lclFFT -lpthread 

OBJS := Stk.o Mutex.o Socket.o Thread.o RtMidi.o TcpServer.o RtWvOut.o RtAudio.o Voicer.o Messager.o Skini.o BeeThree.o FM.o FileWvIn.o FileRead.o TwoZero.o ADSR.o FileLoop.o SineWave.o
RCS := $(OBJS:%.o=$(SRCDIR)/%.cpp)
ALLDEPS := $(OBJS:%.o=$(BUILDDIR)/%.o)

#test:
#	echo $(ALLDEPS)/%.o

all:  $(ALLDEPS)
	@echo "$(CC) $(CFLAGS) $(FWS) $(LIB) -L$(L) -I$(INC) $(ALLDEPS) -o $(BUILDDIR)/$(OUT) $(TGT) "; $(CC) $(CFLAGS) -L$(L) -I$(INC) $(FWS) $(LIB) $(ALLDEPS) -o $(BUILDDIR)/$(OUT) $(TGT) 
	
$(ALLDEPS):
	@mkdir -p $(BUILDDIR)
	@echo "$(CC) $(CFLAGS) $(REQALL) -I$(INC) -c -o $@ $(@:$(BUILDDIR)/%.o=$(SRCDIR)/%.cpp)";	$(CC) $(CFLAGS) -I$(INC) -c -o $@ $(@:$(BUILDDIR)/%.o=$(SRCDIR)/%.cpp)  

clean:
	rm build/*.o
	rm build/$(out)

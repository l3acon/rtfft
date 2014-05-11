CC := g++
CFLAGS := -D__MACOSX_CORE__ -O3 -Wall #-v 
BUILDDIR := build
SRCDIR := src
L := library 
INC := include

FWS := -framework OpenCL -framework CoreAudio -framework CoreMIDI -framework CoreFoundation 
LIBDIR := /usr/local/include
LIB := -lclFFT -lpthread 

OBJS := Stk.o SineWave.o RtWvOut.o RtAudio.o Mutex.o  
SRCS := $(OBJS:%.o=$(SRCDIR)/%.cpp)
ALLDEPS := $(OBJS:%.o=$(BUILDDIR)/%.o)

all:  $(ALLDEPS)
	@echo "$(CC) $(CFLAGS) $(FWS) $(LIB) -L$(L) -I$(INC) $(ALLDEPS) -o $(BUILDDIR)/rtfft rtfft.cpp "; $(CC) $(CFLAGS) -L$(L) -I$(INC) $(FWS) $(LIB) $(ALLDEPS) -o $(BUILDDIR)/rtfft rtfft.cpp
	
$(BUILDDIR)/%.o: $(SRCS)
	@mkdir -p $(BUILDDIR)
	@echo "$(CC) $(CFLAGS) $(REQALL) -I$(INC) -c -o $@ $(@:$(BUILDDIR)/%.o=$(SRCDIR)/%.cpp)";	$(CC) $(CFLAGS) -I$(INC) -c -o $@ $(@:$(BUILDDIR)/%.o=$(SRCDIR)/%.cpp)  

clean:
	rm build/*.o
	rm build/rtfft

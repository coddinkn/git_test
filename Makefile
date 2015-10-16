# Generic C++ Makefile, meant to help structure building projects organized with
# src, include, build, and lib directories, to see it in use check out foth on github
# https://github.com/Brinsky/foth

# compiler and compiler flag variables
CXX=g++
CXXFLAGS = -Wall -std=c++11

# program name, used as the target for building the binary
PROGRAM=test

# list of included headers and libraries
INCLUDES =
LIBS =

# virtual paths inclusion so make knows where to find files with certain extensions
vpath %.o ./build
vpath %.h ./include:
vpath %.cpp ./src:

# target to build the final binary
all: build $(PROGRAM) tidy

# phony targets to help keep things orderly
.PHONY: clean build tidy

# actual binary target
$(PROGRAM): main.cpp 
	$(CXX) $^ $(CXXFLAGS) $(INCLUDES) $(LIBS) -o $@

# rules for building object files required by binary target
%.o: %.cpp %.h
	$(CXX) -c $< $(CXXFLAGS) $(INCLUDES) $(LIBS)

# check if the directory make was called in has a build subdirectory
# make one if there is no such directory
build:
	if [ ! -d "./build" ]; then mkdir build; fi

#after building the necessary object files move them into /build
tidy:
	if [ `ls -l *.o 2> /dev/null | wc -l` -ne 0 ]; then mv -f *.o ./build/; fi

# remove the binary and all object files, useful for rebuilding
clean:
	rm -f $(PROGRAM) ./build/*.o

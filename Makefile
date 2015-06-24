CXX=g++
CXXFLAGS = -Wall -std=c++11

INCLUDES = 
LIBS = 

vpath %.o ./build
vpath %.h ./include
vpath %.cpp ./src

all: build test tidy 

.PHONY: build clean tidy

test: main.cpp
	$(CXX) $^ $(CXXFLAGS) $(LIBS) $(INCLUDES) -o $@

%.o: %.cpp %.h
	$(CXX) -c $< $(CXXFLAGS) $(LIBS) $(INCLUDES)

build:
	if [ ! -d "./build" ]; then mkdir ./build; fi

tidy:
	if [ `ls -l "*.o" 2> /dev/null | wc -l` -ne 0 ]; then mv -f *.o ./build; fi

clean:
	rm -f libsfml-res-man.a sfml-res-man-test ./build/*.o

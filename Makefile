CXX=g++
CXXFLAGS = -Wall -std=c++11

INCLUDES = 
LIBS = 

vpath %.o ./build
vpath %.h ./include
vpath %.cpp ./src

all: test 

.PHONY: clean

test: main.cpp
	$(CXX) $^ $(CXXFLAGS) $(LIBS) $(INCLUDES) -o $@
	rm -f *.o

%.o: %.cpp %.h
	$(CXX) -c $< $(CXXFLAGS) $(LIBS) $(INCLUDES)
	if [ ! -d "./build" ]; then mkdir build; fi	
	cp $@ ./build

clean:
	rm -f libsfml-res-man.a sfml-res-man-test ./build/*.o

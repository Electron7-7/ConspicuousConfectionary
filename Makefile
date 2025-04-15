CXX = clang++
CC = clang

CXXFLAGS = -g -Wall -frtti -std=c++20
CCFLAGS = -g -Wall

# INCLUDES = -I src/include
# LIBS =

ifeq ($(OS),Windows_NT) 
	WCXX = clang++
	WCC = clang
else
	WCXX = x86_64-w64-mingw32-g++
	WCC = x86_64-w64-mingw32-gcc
endif

LINUX_DEBUG = ConspicuousConfectionary_Debug
WINDOWS_DEBUG = ConspicuousConfectionary_Debug.exe
LINUX = ConspicuousConfectionary_$(shell uname -s)_$(shell uname -r)_$(shell uname -m)
WINDOWS = ConspicuousConfectionary_x86_64.exe
NAME = ""

SRC := src

O = build

OBJS = ""

WOBJS = $(subst .o,.wo,$(OBJS))

PHONY := all clean linux debug release

clean:
	-rm -f $(O)/**

debug:
	$(info Version: Debug)
	$(eval LINUX := $(LINUX_DEBUG))
	$(eval WINDOWS := $(WINDOWS_DEBUG))
	-rm -f build/*.tmp

release:
	$(info Version: Release)
	-rm -f build/*.tmp

linux: NAME = $(LINUX)
linux: $(O)/main.opp
	$(CXX) $(CXXFLAGS) $(LDFLAGS) $(OBJS) $(O)/main.opp -o $(O)/$(NAME) $(LIBS)
	$(TESTRUN_LINUX)

$(O)/%.opp: $(SRC)/%.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@
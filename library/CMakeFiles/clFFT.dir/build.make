# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = "/Applications/CMake 2.8-12.app/Contents/bin/cmake"

# The command to remove a file.
RM = "/Applications/CMake 2.8-12.app/Contents/bin/cmake" -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = "/Applications/CMake 2.8-12.app/Contents/bin/ccmake"

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/matt/Downloads/clFFT-develop/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/matt/Downloads/clFFT-develop/src

# Include any dependencies generated for this target.
include library/CMakeFiles/clFFT.dir/depend.make

# Include the progress variables for this target.
include library/CMakeFiles/clFFT.dir/progress.make

# Include the compile flags for this target's objects.
include library/CMakeFiles/clFFT.dir/flags.make

library/CMakeFiles/clFFT.dir/transform.cpp.o: library/CMakeFiles/clFFT.dir/flags.make
library/CMakeFiles/clFFT.dir/transform.cpp.o: library/transform.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/matt/Downloads/clFFT-develop/src/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object library/CMakeFiles/clFFT.dir/transform.cpp.o"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/clFFT.dir/transform.cpp.o -c /Users/matt/Downloads/clFFT-develop/src/library/transform.cpp

library/CMakeFiles/clFFT.dir/transform.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/clFFT.dir/transform.cpp.i"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/matt/Downloads/clFFT-develop/src/library/transform.cpp > CMakeFiles/clFFT.dir/transform.cpp.i

library/CMakeFiles/clFFT.dir/transform.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/clFFT.dir/transform.cpp.s"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/matt/Downloads/clFFT-develop/src/library/transform.cpp -o CMakeFiles/clFFT.dir/transform.cpp.s

library/CMakeFiles/clFFT.dir/transform.cpp.o.requires:
.PHONY : library/CMakeFiles/clFFT.dir/transform.cpp.o.requires

library/CMakeFiles/clFFT.dir/transform.cpp.o.provides: library/CMakeFiles/clFFT.dir/transform.cpp.o.requires
	$(MAKE) -f library/CMakeFiles/clFFT.dir/build.make library/CMakeFiles/clFFT.dir/transform.cpp.o.provides.build
.PHONY : library/CMakeFiles/clFFT.dir/transform.cpp.o.provides

library/CMakeFiles/clFFT.dir/transform.cpp.o.provides.build: library/CMakeFiles/clFFT.dir/transform.cpp.o

library/CMakeFiles/clFFT.dir/accessors.cpp.o: library/CMakeFiles/clFFT.dir/flags.make
library/CMakeFiles/clFFT.dir/accessors.cpp.o: library/accessors.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/matt/Downloads/clFFT-develop/src/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object library/CMakeFiles/clFFT.dir/accessors.cpp.o"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/clFFT.dir/accessors.cpp.o -c /Users/matt/Downloads/clFFT-develop/src/library/accessors.cpp

library/CMakeFiles/clFFT.dir/accessors.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/clFFT.dir/accessors.cpp.i"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/matt/Downloads/clFFT-develop/src/library/accessors.cpp > CMakeFiles/clFFT.dir/accessors.cpp.i

library/CMakeFiles/clFFT.dir/accessors.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/clFFT.dir/accessors.cpp.s"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/matt/Downloads/clFFT-develop/src/library/accessors.cpp -o CMakeFiles/clFFT.dir/accessors.cpp.s

library/CMakeFiles/clFFT.dir/accessors.cpp.o.requires:
.PHONY : library/CMakeFiles/clFFT.dir/accessors.cpp.o.requires

library/CMakeFiles/clFFT.dir/accessors.cpp.o.provides: library/CMakeFiles/clFFT.dir/accessors.cpp.o.requires
	$(MAKE) -f library/CMakeFiles/clFFT.dir/build.make library/CMakeFiles/clFFT.dir/accessors.cpp.o.provides.build
.PHONY : library/CMakeFiles/clFFT.dir/accessors.cpp.o.provides

library/CMakeFiles/clFFT.dir/accessors.cpp.o.provides.build: library/CMakeFiles/clFFT.dir/accessors.cpp.o

library/CMakeFiles/clFFT.dir/plan.cpp.o: library/CMakeFiles/clFFT.dir/flags.make
library/CMakeFiles/clFFT.dir/plan.cpp.o: library/plan.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/matt/Downloads/clFFT-develop/src/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object library/CMakeFiles/clFFT.dir/plan.cpp.o"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/clFFT.dir/plan.cpp.o -c /Users/matt/Downloads/clFFT-develop/src/library/plan.cpp

library/CMakeFiles/clFFT.dir/plan.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/clFFT.dir/plan.cpp.i"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/matt/Downloads/clFFT-develop/src/library/plan.cpp > CMakeFiles/clFFT.dir/plan.cpp.i

library/CMakeFiles/clFFT.dir/plan.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/clFFT.dir/plan.cpp.s"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/matt/Downloads/clFFT-develop/src/library/plan.cpp -o CMakeFiles/clFFT.dir/plan.cpp.s

library/CMakeFiles/clFFT.dir/plan.cpp.o.requires:
.PHONY : library/CMakeFiles/clFFT.dir/plan.cpp.o.requires

library/CMakeFiles/clFFT.dir/plan.cpp.o.provides: library/CMakeFiles/clFFT.dir/plan.cpp.o.requires
	$(MAKE) -f library/CMakeFiles/clFFT.dir/build.make library/CMakeFiles/clFFT.dir/plan.cpp.o.provides.build
.PHONY : library/CMakeFiles/clFFT.dir/plan.cpp.o.provides

library/CMakeFiles/clFFT.dir/plan.cpp.o.provides.build: library/CMakeFiles/clFFT.dir/plan.cpp.o

library/CMakeFiles/clFFT.dir/repo.cpp.o: library/CMakeFiles/clFFT.dir/flags.make
library/CMakeFiles/clFFT.dir/repo.cpp.o: library/repo.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/matt/Downloads/clFFT-develop/src/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object library/CMakeFiles/clFFT.dir/repo.cpp.o"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/clFFT.dir/repo.cpp.o -c /Users/matt/Downloads/clFFT-develop/src/library/repo.cpp

library/CMakeFiles/clFFT.dir/repo.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/clFFT.dir/repo.cpp.i"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/matt/Downloads/clFFT-develop/src/library/repo.cpp > CMakeFiles/clFFT.dir/repo.cpp.i

library/CMakeFiles/clFFT.dir/repo.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/clFFT.dir/repo.cpp.s"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/matt/Downloads/clFFT-develop/src/library/repo.cpp -o CMakeFiles/clFFT.dir/repo.cpp.s

library/CMakeFiles/clFFT.dir/repo.cpp.o.requires:
.PHONY : library/CMakeFiles/clFFT.dir/repo.cpp.o.requires

library/CMakeFiles/clFFT.dir/repo.cpp.o.provides: library/CMakeFiles/clFFT.dir/repo.cpp.o.requires
	$(MAKE) -f library/CMakeFiles/clFFT.dir/build.make library/CMakeFiles/clFFT.dir/repo.cpp.o.provides.build
.PHONY : library/CMakeFiles/clFFT.dir/repo.cpp.o.provides

library/CMakeFiles/clFFT.dir/repo.cpp.o.provides.build: library/CMakeFiles/clFFT.dir/repo.cpp.o

library/CMakeFiles/clFFT.dir/generator.stockham.cpp.o: library/CMakeFiles/clFFT.dir/flags.make
library/CMakeFiles/clFFT.dir/generator.stockham.cpp.o: library/generator.stockham.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/matt/Downloads/clFFT-develop/src/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object library/CMakeFiles/clFFT.dir/generator.stockham.cpp.o"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/clFFT.dir/generator.stockham.cpp.o -c /Users/matt/Downloads/clFFT-develop/src/library/generator.stockham.cpp

library/CMakeFiles/clFFT.dir/generator.stockham.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/clFFT.dir/generator.stockham.cpp.i"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/matt/Downloads/clFFT-develop/src/library/generator.stockham.cpp > CMakeFiles/clFFT.dir/generator.stockham.cpp.i

library/CMakeFiles/clFFT.dir/generator.stockham.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/clFFT.dir/generator.stockham.cpp.s"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/matt/Downloads/clFFT-develop/src/library/generator.stockham.cpp -o CMakeFiles/clFFT.dir/generator.stockham.cpp.s

library/CMakeFiles/clFFT.dir/generator.stockham.cpp.o.requires:
.PHONY : library/CMakeFiles/clFFT.dir/generator.stockham.cpp.o.requires

library/CMakeFiles/clFFT.dir/generator.stockham.cpp.o.provides: library/CMakeFiles/clFFT.dir/generator.stockham.cpp.o.requires
	$(MAKE) -f library/CMakeFiles/clFFT.dir/build.make library/CMakeFiles/clFFT.dir/generator.stockham.cpp.o.provides.build
.PHONY : library/CMakeFiles/clFFT.dir/generator.stockham.cpp.o.provides

library/CMakeFiles/clFFT.dir/generator.stockham.cpp.o.provides.build: library/CMakeFiles/clFFT.dir/generator.stockham.cpp.o

library/CMakeFiles/clFFT.dir/generator.transpose.cpp.o: library/CMakeFiles/clFFT.dir/flags.make
library/CMakeFiles/clFFT.dir/generator.transpose.cpp.o: library/generator.transpose.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/matt/Downloads/clFFT-develop/src/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object library/CMakeFiles/clFFT.dir/generator.transpose.cpp.o"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/clFFT.dir/generator.transpose.cpp.o -c /Users/matt/Downloads/clFFT-develop/src/library/generator.transpose.cpp

library/CMakeFiles/clFFT.dir/generator.transpose.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/clFFT.dir/generator.transpose.cpp.i"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/matt/Downloads/clFFT-develop/src/library/generator.transpose.cpp > CMakeFiles/clFFT.dir/generator.transpose.cpp.i

library/CMakeFiles/clFFT.dir/generator.transpose.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/clFFT.dir/generator.transpose.cpp.s"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/matt/Downloads/clFFT-develop/src/library/generator.transpose.cpp -o CMakeFiles/clFFT.dir/generator.transpose.cpp.s

library/CMakeFiles/clFFT.dir/generator.transpose.cpp.o.requires:
.PHONY : library/CMakeFiles/clFFT.dir/generator.transpose.cpp.o.requires

library/CMakeFiles/clFFT.dir/generator.transpose.cpp.o.provides: library/CMakeFiles/clFFT.dir/generator.transpose.cpp.o.requires
	$(MAKE) -f library/CMakeFiles/clFFT.dir/build.make library/CMakeFiles/clFFT.dir/generator.transpose.cpp.o.provides.build
.PHONY : library/CMakeFiles/clFFT.dir/generator.transpose.cpp.o.provides

library/CMakeFiles/clFFT.dir/generator.transpose.cpp.o.provides.build: library/CMakeFiles/clFFT.dir/generator.transpose.cpp.o

library/CMakeFiles/clFFT.dir/generator.copy.cpp.o: library/CMakeFiles/clFFT.dir/flags.make
library/CMakeFiles/clFFT.dir/generator.copy.cpp.o: library/generator.copy.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/matt/Downloads/clFFT-develop/src/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object library/CMakeFiles/clFFT.dir/generator.copy.cpp.o"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/clFFT.dir/generator.copy.cpp.o -c /Users/matt/Downloads/clFFT-develop/src/library/generator.copy.cpp

library/CMakeFiles/clFFT.dir/generator.copy.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/clFFT.dir/generator.copy.cpp.i"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/matt/Downloads/clFFT-develop/src/library/generator.copy.cpp > CMakeFiles/clFFT.dir/generator.copy.cpp.i

library/CMakeFiles/clFFT.dir/generator.copy.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/clFFT.dir/generator.copy.cpp.s"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/matt/Downloads/clFFT-develop/src/library/generator.copy.cpp -o CMakeFiles/clFFT.dir/generator.copy.cpp.s

library/CMakeFiles/clFFT.dir/generator.copy.cpp.o.requires:
.PHONY : library/CMakeFiles/clFFT.dir/generator.copy.cpp.o.requires

library/CMakeFiles/clFFT.dir/generator.copy.cpp.o.provides: library/CMakeFiles/clFFT.dir/generator.copy.cpp.o.requires
	$(MAKE) -f library/CMakeFiles/clFFT.dir/build.make library/CMakeFiles/clFFT.dir/generator.copy.cpp.o.provides.build
.PHONY : library/CMakeFiles/clFFT.dir/generator.copy.cpp.o.provides

library/CMakeFiles/clFFT.dir/generator.copy.cpp.o.provides.build: library/CMakeFiles/clFFT.dir/generator.copy.cpp.o

library/CMakeFiles/clFFT.dir/lifetime.cpp.o: library/CMakeFiles/clFFT.dir/flags.make
library/CMakeFiles/clFFT.dir/lifetime.cpp.o: library/lifetime.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/matt/Downloads/clFFT-develop/src/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object library/CMakeFiles/clFFT.dir/lifetime.cpp.o"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/clFFT.dir/lifetime.cpp.o -c /Users/matt/Downloads/clFFT-develop/src/library/lifetime.cpp

library/CMakeFiles/clFFT.dir/lifetime.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/clFFT.dir/lifetime.cpp.i"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/matt/Downloads/clFFT-develop/src/library/lifetime.cpp > CMakeFiles/clFFT.dir/lifetime.cpp.i

library/CMakeFiles/clFFT.dir/lifetime.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/clFFT.dir/lifetime.cpp.s"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/matt/Downloads/clFFT-develop/src/library/lifetime.cpp -o CMakeFiles/clFFT.dir/lifetime.cpp.s

library/CMakeFiles/clFFT.dir/lifetime.cpp.o.requires:
.PHONY : library/CMakeFiles/clFFT.dir/lifetime.cpp.o.requires

library/CMakeFiles/clFFT.dir/lifetime.cpp.o.provides: library/CMakeFiles/clFFT.dir/lifetime.cpp.o.requires
	$(MAKE) -f library/CMakeFiles/clFFT.dir/build.make library/CMakeFiles/clFFT.dir/lifetime.cpp.o.provides.build
.PHONY : library/CMakeFiles/clFFT.dir/lifetime.cpp.o.provides

library/CMakeFiles/clFFT.dir/lifetime.cpp.o.provides.build: library/CMakeFiles/clFFT.dir/lifetime.cpp.o

library/CMakeFiles/clFFT.dir/stdafx.cpp.o: library/CMakeFiles/clFFT.dir/flags.make
library/CMakeFiles/clFFT.dir/stdafx.cpp.o: library/stdafx.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/matt/Downloads/clFFT-develop/src/CMakeFiles $(CMAKE_PROGRESS_9)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object library/CMakeFiles/clFFT.dir/stdafx.cpp.o"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/clFFT.dir/stdafx.cpp.o -c /Users/matt/Downloads/clFFT-develop/src/library/stdafx.cpp

library/CMakeFiles/clFFT.dir/stdafx.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/clFFT.dir/stdafx.cpp.i"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/matt/Downloads/clFFT-develop/src/library/stdafx.cpp > CMakeFiles/clFFT.dir/stdafx.cpp.i

library/CMakeFiles/clFFT.dir/stdafx.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/clFFT.dir/stdafx.cpp.s"
	cd /Users/matt/Downloads/clFFT-develop/src/library && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/matt/Downloads/clFFT-develop/src/library/stdafx.cpp -o CMakeFiles/clFFT.dir/stdafx.cpp.s

library/CMakeFiles/clFFT.dir/stdafx.cpp.o.requires:
.PHONY : library/CMakeFiles/clFFT.dir/stdafx.cpp.o.requires

library/CMakeFiles/clFFT.dir/stdafx.cpp.o.provides: library/CMakeFiles/clFFT.dir/stdafx.cpp.o.requires
	$(MAKE) -f library/CMakeFiles/clFFT.dir/build.make library/CMakeFiles/clFFT.dir/stdafx.cpp.o.provides.build
.PHONY : library/CMakeFiles/clFFT.dir/stdafx.cpp.o.provides

library/CMakeFiles/clFFT.dir/stdafx.cpp.o.provides.build: library/CMakeFiles/clFFT.dir/stdafx.cpp.o

# Object files for target clFFT
clFFT_OBJECTS = \
"CMakeFiles/clFFT.dir/transform.cpp.o" \
"CMakeFiles/clFFT.dir/accessors.cpp.o" \
"CMakeFiles/clFFT.dir/plan.cpp.o" \
"CMakeFiles/clFFT.dir/repo.cpp.o" \
"CMakeFiles/clFFT.dir/generator.stockham.cpp.o" \
"CMakeFiles/clFFT.dir/generator.transpose.cpp.o" \
"CMakeFiles/clFFT.dir/generator.copy.cpp.o" \
"CMakeFiles/clFFT.dir/lifetime.cpp.o" \
"CMakeFiles/clFFT.dir/stdafx.cpp.o"

# External object files for target clFFT
clFFT_EXTERNAL_OBJECTS =

library/libclFFT.2.1.0.dylib: library/CMakeFiles/clFFT.dir/transform.cpp.o
library/libclFFT.2.1.0.dylib: library/CMakeFiles/clFFT.dir/accessors.cpp.o
library/libclFFT.2.1.0.dylib: library/CMakeFiles/clFFT.dir/plan.cpp.o
library/libclFFT.2.1.0.dylib: library/CMakeFiles/clFFT.dir/repo.cpp.o
library/libclFFT.2.1.0.dylib: library/CMakeFiles/clFFT.dir/generator.stockham.cpp.o
library/libclFFT.2.1.0.dylib: library/CMakeFiles/clFFT.dir/generator.transpose.cpp.o
library/libclFFT.2.1.0.dylib: library/CMakeFiles/clFFT.dir/generator.copy.cpp.o
library/libclFFT.2.1.0.dylib: library/CMakeFiles/clFFT.dir/lifetime.cpp.o
library/libclFFT.2.1.0.dylib: library/CMakeFiles/clFFT.dir/stdafx.cpp.o
library/libclFFT.2.1.0.dylib: library/CMakeFiles/clFFT.dir/build.make
library/libclFFT.2.1.0.dylib: library/CMakeFiles/clFFT.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library libclFFT.dylib"
	cd /Users/matt/Downloads/clFFT-develop/src/library && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/clFFT.dir/link.txt --verbose=$(VERBOSE)
	cd /Users/matt/Downloads/clFFT-develop/src/library && $(CMAKE_COMMAND) -E cmake_symlink_library libclFFT.2.1.0.dylib libclFFT.2.dylib libclFFT.dylib

library/libclFFT.2.dylib: library/libclFFT.2.1.0.dylib

library/libclFFT.dylib: library/libclFFT.2.1.0.dylib

# Rule to build all files generated by this target.
library/CMakeFiles/clFFT.dir/build: library/libclFFT.dylib
.PHONY : library/CMakeFiles/clFFT.dir/build

library/CMakeFiles/clFFT.dir/requires: library/CMakeFiles/clFFT.dir/transform.cpp.o.requires
library/CMakeFiles/clFFT.dir/requires: library/CMakeFiles/clFFT.dir/accessors.cpp.o.requires
library/CMakeFiles/clFFT.dir/requires: library/CMakeFiles/clFFT.dir/plan.cpp.o.requires
library/CMakeFiles/clFFT.dir/requires: library/CMakeFiles/clFFT.dir/repo.cpp.o.requires
library/CMakeFiles/clFFT.dir/requires: library/CMakeFiles/clFFT.dir/generator.stockham.cpp.o.requires
library/CMakeFiles/clFFT.dir/requires: library/CMakeFiles/clFFT.dir/generator.transpose.cpp.o.requires
library/CMakeFiles/clFFT.dir/requires: library/CMakeFiles/clFFT.dir/generator.copy.cpp.o.requires
library/CMakeFiles/clFFT.dir/requires: library/CMakeFiles/clFFT.dir/lifetime.cpp.o.requires
library/CMakeFiles/clFFT.dir/requires: library/CMakeFiles/clFFT.dir/stdafx.cpp.o.requires
.PHONY : library/CMakeFiles/clFFT.dir/requires

library/CMakeFiles/clFFT.dir/clean:
	cd /Users/matt/Downloads/clFFT-develop/src/library && $(CMAKE_COMMAND) -P CMakeFiles/clFFT.dir/cmake_clean.cmake
.PHONY : library/CMakeFiles/clFFT.dir/clean

library/CMakeFiles/clFFT.dir/depend:
	cd /Users/matt/Downloads/clFFT-develop/src && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/matt/Downloads/clFFT-develop/src /Users/matt/Downloads/clFFT-develop/src/library /Users/matt/Downloads/clFFT-develop/src /Users/matt/Downloads/clFFT-develop/src/library /Users/matt/Downloads/clFFT-develop/src/library/CMakeFiles/clFFT.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : library/CMakeFiles/clFFT.dir/depend


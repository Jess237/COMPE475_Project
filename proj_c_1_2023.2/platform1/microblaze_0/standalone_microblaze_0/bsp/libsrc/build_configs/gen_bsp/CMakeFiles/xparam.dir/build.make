# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.24

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Produce verbose output by default.
VERBOSE = 1

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = C:/Xilinx/Vitis/2023.2/tps/win64/cmake-3.24.2/bin/cmake.exe

# The command to remove a file.
RM = C:/Xilinx/Vitis/2023.2/tps/win64/cmake-3.24.2/bin/cmake.exe -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:/Users/rojo_/COMPE475_Project/proj_c_1_2023.2/platform1/microblaze_0/standalone_microblaze_0/bsp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:/Users/rojo_/COMPE475_Project/proj_c_1_2023.2/platform1/microblaze_0/standalone_microblaze_0/bsp/libsrc/build_configs/gen_bsp

# Utility rule file for xparam.

# Include any custom commands dependencies for this target.
include CMakeFiles/xparam.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/xparam.dir/progress.make

CMakeFiles/xparam:
	lopper -O C:/Users/rojo_/COMPE475_Project/proj_c_1_2023.2/platform1/microblaze_0/standalone_microblaze_0/bsp/include C:/Users/rojo_/COMPE475_Project/proj_c_1_2023.2/platform1/microblaze_0/standalone_microblaze_0/bsp/hw_artifacts/microblaze_0_baremetal.dts -- baremetal_xparameters_xlnx microblaze_0 C:/Users/rojo_/COMPE475_Project/proj_c_1_2023.2/.repo.yaml

xparam: CMakeFiles/xparam
xparam: CMakeFiles/xparam.dir/build.make
.PHONY : xparam

# Rule to build all files generated by this target.
CMakeFiles/xparam.dir/build: xparam
.PHONY : CMakeFiles/xparam.dir/build

CMakeFiles/xparam.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/xparam.dir/cmake_clean.cmake
.PHONY : CMakeFiles/xparam.dir/clean

CMakeFiles/xparam.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" C:/Users/rojo_/COMPE475_Project/proj_c_1_2023.2/platform1/microblaze_0/standalone_microblaze_0/bsp C:/Users/rojo_/COMPE475_Project/proj_c_1_2023.2/platform1/microblaze_0/standalone_microblaze_0/bsp C:/Users/rojo_/COMPE475_Project/proj_c_1_2023.2/platform1/microblaze_0/standalone_microblaze_0/bsp/libsrc/build_configs/gen_bsp C:/Users/rojo_/COMPE475_Project/proj_c_1_2023.2/platform1/microblaze_0/standalone_microblaze_0/bsp/libsrc/build_configs/gen_bsp C:/Users/rojo_/COMPE475_Project/proj_c_1_2023.2/platform1/microblaze_0/standalone_microblaze_0/bsp/libsrc/build_configs/gen_bsp/CMakeFiles/xparam.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/xparam.dir/depend


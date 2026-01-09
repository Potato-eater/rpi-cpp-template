cmake_minimum_required(VERSION 3.10)
project(MyProject)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Include the "include/" directory
include_directories(include)

# Automatically detect all .cpp files in src/
file(GLOB SOURCES "src/*.cpp")

# Create executable
add_executable(cool_program ${SOURCES})

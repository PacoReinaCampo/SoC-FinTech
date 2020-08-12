# Specify the minimum version for CMake

cmake_minimum_required(VERSION 2.8.10)

# Project's name

project(SoC)

link_directories(../soc-ntm/opennn)

include_directories(../soc-ntm/opennn)

add_executable(SoC main.cpp)

target_link_libraries(SoC opennn)



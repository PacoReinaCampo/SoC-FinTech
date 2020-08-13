# Specify the minimum version for CMake

cmake_minimum_required(VERSION 2.8.10)

# Project's name

project(PU-FinTech)

link_directories(../soc-ntm/opennn)

include_directories(../soc-ntm/opennn)

add_executable(PU-FinTech main.cpp)

target_link_libraries(PU-FinTech opennn)



cmake_minimum_required(VERSION 3.10)
project(CalculatorProject)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include_directories(include)

# Додай бібліотеку
add_library(calc STATIC src/calculator.cpp)

# Додай виконуваний файл
add_executable(main src/main.cpp)

# Лінкуй бібліотеку до виконуваного файлу
target_link_libraries(main calc)

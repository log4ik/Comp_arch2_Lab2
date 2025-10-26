# Compiler and flags
CXX = g++
CXXFLAGS = -Iinclude -Wall -std=c++17
BUILD_DIR = build
SRC_DIR = src
OBJ_DIR = $(BUILD_DIR)/obj
LIB_DIR = $(BUILD_DIR)/lib
BIN_DIR = $(BUILD_DIR)/bin

# Files
LIB_NAME = libcalc.a
TARGET = main

# Sources and objects
SRC = $(SRC_DIR)/calculator.cpp $(SRC_DIR)/main.cpp
OBJ = $(SRC:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)

# Default rule
all: $(BIN_DIR)/$(TARGET)

# Create executable and link with static library
$(BIN_DIR)/$(TARGET): $(LIB_DIR)/$(LIB_NAME) $(OBJ_DIR)/main.o | $(BIN_DIR)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJ_DIR)/main.o -L$(LIB_DIR) -lcalc

# Create static library
$(LIB_DIR)/$(LIB_NAME): $(OBJ_DIR)/calculator.o | $(LIB_DIR)
	ar rcs $@ $^

# Compile object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Create directories
$(BIN_DIR) $(OBJ_DIR) $(LIB_DIR):
	mkdir -p $@

# Clean build files
clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean

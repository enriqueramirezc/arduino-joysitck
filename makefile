# export PATH="$PATH:/home/enriqueramirez/Documents/PI_ensambla/arduino-example/joystick/bin"

# make upload-arduino; make; make run

# Compilador y Flags
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17 -I./include -no-pie
LDFLAGS = -lraylib -lGL -lm -lpthread -ldl -lrt -lX11 -no-pie

# Ensamblador
AS = nasm
ASFLAGS = -f elf64

# Directorios
SRC_DIR = src
BUILD_DIR = build
BIN_DIR = bin
INCLUDE_DIR = include

# Archivos fuente
CPP_SOURCES = $(wildcard $(SRC_DIR)/*.cpp)
ASM_SOURCES = $(wildcard $(SRC_DIR)/*.asm)

# Archivos objeto
CPP_OBJECTS = $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(CPP_SOURCES))
ASM_OBJECTS = $(patsubst $(SRC_DIR)/%.asm, $(BUILD_DIR)/%.o, $(ASM_SOURCES))
OBJECTS = $(CPP_OBJECTS) $(ASM_OBJECTS)

# Ejecutables
TARGET = $(BIN_DIR)/program

# Target principal
all: $(TARGET)

$(TARGET): $(OBJECTS)
	@mkdir -p $(BIN_DIR)
	$(CXX) $(OBJECTS) -o $(TARGET) $(LDFLAGS)

# Compilar C++
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Compilar ensamblador
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.asm
	@mkdir -p $(BUILD_DIR)
	$(AS) $(ASFLAGS) $< -o $@

# Correr programa
run: $(TARGET)
	./$(TARGET)

# Arduino (Le pedí ayuda a la IA con esto)
ARDUINO_INO = joystickControl
ARDUINO_PORT = /dev/ttyACM0
ARDUINO_BOARD = arduino:avr:uno

upload-arduino:
	arduino-cli compile --fqbn $(ARDUINO_BOARD) $(ARDUINO_INO)
	arduino-cli upload -p $(ARDUINO_PORT) --fqbn $(ARDUINO_BOARD) $(ARDUINO_INO)

# Clean todo
clean:
	rm -rf $(BUILD_DIR)/*.o $(BIN_DIR)/program $(BIN_DIR)/test_runner

.PHONY: all clean run upload-arduino
# ============================
# SystemVerilog Makefile
# ============================

# Compiler + flags
IVERILOG = iverilog
IVERILOG_FLAGS = -g2012

# Output executable
OUT = main

# Source files
SRC = \
    risc_v_32I.sv \
    alu.sv \
    tests/alu_tb.sv \
    Comparator.sv


# Default target
all: $(OUT)

# Compile main simulation
$(OUT): $(SRC)
	$(IVERILOG) $(IVERILOG_FLAGS) -o $(OUT) $(SRC)

# Run simulation
run: $(OUT)
	./$(OUT)

# Remove compiled output
clean:
	rm -f $(OUT)

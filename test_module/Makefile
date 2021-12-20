# Makefile

# defaults
SIM ?= questa
GUI ?= 1
TOPLEVEL_LANG ?= verilog

VERILOG_SOURCES += $(PWD)/test_module.sv
# use VHDL_SOURCES for VHDL files

# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = test_module

# MODULE is the basename of the Python test file
MODULE = test_module

include $(shell cocotb-config --makefiles)/Makefile.sim

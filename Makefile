THIS_FILE := $(lastword $(MAKEFILE_LIST))
UNAME := $(shell uname)

# setenv BLENDER_EXE 
BLENDER_EXE="/mnt/c/Program Files/Blender Foundation/Blender 2.81/blender.exe"
BLENDER_PYTHON_EXE="/mnt/c/Program Files/Blender Foundation/Blender 2.81/2.81/python/bin/python.exe"

BLENDER_EXE="/mnt/c/Program Files/Blender Foundation/Blender/blender.exe"
BLENDER_PYTHON_EXE="/mnt/c/Program Files/Blender Foundation/Blender/2.77/python/bin/python.exe"

SCRIPT_FILE="metaballs.py"

.DEFAULT_GOAL := all
.PHONY: info help empty


#$(BLENDER_EXE) -v

info:
	@echo "   "
	@echo "==INFORMATION=================================="
	@echo "             UNAME = $(UNAME)"
	@echo "       BLENDER_EXE = $(BLENDER_EXE)"
	@echo "BLENDER_PYTHON_EXE = $(BLENDER_PYTHON_EXE)"
	@echo "               PWD = $(PWD)"
	@echo "       SCRIPT_PATH = $(SCRIPT_PATH)"
	@echo "   "


python: info
	@echo "==BLENDER PYTHON CONSOLE======================="
	$(BLENDER_EXE) -b --python-console


pipsee: info
	@echo "==BLENDER PYTHON PIP CHECK====================="
	sudo $(BLENDER_PYTHON_EXE) -m ensurepip --user


pipup: info
	@echo "==BLENDER PYTHON PIP UPGRADE==================="
	sudo $(BLENDER_PYTHON_EXE) -m pip install --user --upgrade pip


install_scipy: info
	@echo "==BLENDER PYTHON INSTALL SCIPY================="
	sudo $(BLENDER_PYTHON_EXE) -m pip uninstall scipy
	sudo $(BLENDER_PYTHON_EXE) -m pip install --user scipy==1.1.0


help: info
	@echo "==BLENDER HELP TEXT============================"
	$(BLENDER_EXE) --help


script: info
	@echo "==BLENDER SCRIPT RUNNER========================"
	$(BLENDER_EXE) -b -P run_script.py
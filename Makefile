ROOT_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

eclipse: procLocal preFix

procLocal:
	processing-java --sketch="$(ROOT_DIR)" --output="$(ROOT_DIR)/build/processing" --force --build

# Processing java preprocesor fix
preFix:
	cd build; sed -i -e "s/.* size commented out by preprocessor .*;/size(1000, 1000);/" processing/source/Arithmatic.java

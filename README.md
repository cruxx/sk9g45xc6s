**sk9g45xc6s** project
==========


It is all about *SK-AT91SAM9G45-XC6SLX* board usage

The goal of the project is to perform and to document all steps for: 
* preparing buildroot environment, including: cross-compilation toolchain, a root filesystem, a Linux kernel image and a bootloader for AT91SAM9G45 on target board
* create a program to control FPGA on the board: uploading a bitstream into FPGA, testing communication and RAM etc.
* preparing simulation, synthesis and implementation workflow setup that enables simulation of testbenches and will produce bitstream files for the FPGA
* create a test project for XC6SLX9-XCSG324X FPGA on the board wich implements:  interface for communication with ARM EBI, registers and memory, external DDR SDRAM testing etc. Also prepare a set of testbenches for HDL simulations (TDD).

So after the project will be completed we'll have full working environment with all tools installed and configured to be able to implement any further (complex) FPGA project on the base of the SK-AT91SAM9G45-XC6SLX board


The main tools that we'll use are:

* Xilinx ISE WebPack
* buildroot

And the list of SW we can use for more comfortable work:

+ hdl-make [http://www.ohwr.org/projects/hdl-make]
+ Eclipse
+ Sigasi

#-------------------------------------------------------------------------------
# defaults
#-------------------------------------------------------------------------------
# FC= ifort -assume byterecl 
FC= gfortran
# FFLAGS= -g -O3
FFLAGS= -g -O3 -Wall -Wextra -Wconversion -fbacktrace -fbounds-check
# FFLAGS= -g -O3 -heap-arrays -check bounds -g -traceback
MAKE = make

#-------------------------------------------------------------------------------
# Src
#-------------------------------------------------------------------------------

SRC = prec.f90 utils.f90 fileio.f90 couplings.f90 hamil.f90 \
   	TimeProp.f90 dish.f90 fssh.f90 main.f90


OBJ = $(SRC:.f90=.o)
EXE = hfnamd

#-------------------------------------------------------------------------------
# Suffix rules
#-------------------------------------------------------------------------------
.SUFFIXES: .o .f90
.f90.o:
	$(FC) $(FFLAGS) -c $<

#-------------------------------------------------------------------------------
# Targets
#-------------------------------------------------------------------------------
tdm:	$(OBJ)
	$(FC) $(FFLAGS) -o $(EXE) $(OBJ) $(SPGLIB)  

clean:
	rm -f *.mod *.a
	rm -f $(OBJ)
tar:
	tar -czvf hfnamd.tgz *.f90 Makefile
tag:
	ctags *.f90

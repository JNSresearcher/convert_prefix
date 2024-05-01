DO=./
DB=./
DS=./

F=example
EXE=$(F)
F90=gfortran

# -fbounds-check 
Csw = -c -O2 -finit-local-zero  -ffree-line-length-none 
Lsw = 
  
# Defining variables  
OBJ =               \
$(DO)numeric.o      \
$(DO)$(F).o 

EXE: $(OBJ)
	$(F90) $(OBJ) $(Lsw)  -o $(DB)$(EXE) 

$(OBJ): $(DO)%.o: $(DS)%.f90
	$(F90) $(Csw) $< -o $@

# Cleaning everything
clean:
	del *.mod
	del *.o
	# rm  *.mod
	# rm  *.o



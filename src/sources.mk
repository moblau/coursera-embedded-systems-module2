ifeq ($(PLATFORM),MSP432)
	SOURCES = 	main.c \
				memory.c \
				interrupts_msp432p401r_gcc.c \
				startup_msp432p401r_gcc.c \
				system_msp432p401r.c 
else
	SOURCES =	main.c \
				memory.c
endif
				
# Add your include paths to this variable


ifeq ($(PLATFORM),MSP432)
	INCLUDES = 	-I ../include/CMSIS \
				-I ../include/common \
				-I ../include/msp432 
else
	INCLUDES =	-I ../include/common
endif
			
			

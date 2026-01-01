FAMILY=Cyclone IV E
PART=EP4CE22F17C6
PROJECT_NAME=comp300_p05

TARGETS=output_files/$(PROJECT_NAME).map.rpt

all: $(TARGETS)

# Rule to synthesize your ALU module using Quartus
output_files/comp300_p05.map.rpt: alu.sv
	quartus_map $(PROJECT_NAME) --source=$^ --family="$(FAMILY)" --part="$(PART)"

clean:
	@rm -f $(TARGETS)

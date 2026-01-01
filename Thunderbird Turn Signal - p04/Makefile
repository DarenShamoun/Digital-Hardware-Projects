FAMILY=Cyclone IV E
PART=EP4CE22F17C6
PROJECT_NAME=comp300_p04

TARGETS=output_files/$(PROJECT_NAME).map.rpt

all: $(TARGETS)

# Rule to synthesize your FSM design using Quartus
output_files/comp300_p04.map.rpt: tbird_fsm.sv
	quartus_map $(PROJECT_NAME) --source=$^ --family="$(FAMILY)" --part="$(PART)"

clean:
	@rm -f $(TARGETS)

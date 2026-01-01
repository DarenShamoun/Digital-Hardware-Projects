// Copyright (C) 2025  Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus Prime License Agreement,
// the Altera IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Altera and sold by Altera or its authorized distributors.  Please
// refer to the Altera Software License Subscription Agreements 
// on the Quartus Prime software download page.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 24.1std.0 Build 1077 03/04/2025 SC Lite Edition"
// CREATED		"Fri Oct  3 17:10:09 2025"

module sword(
	SW,
	CLK,
	R,
	V
);


input wire	SW;
input wire	CLK;
input wire	R;
output wire	V;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_3;
reg	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
reg	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_12;

assign	V = SYNTHESIZED_WIRE_16;
assign	SYNTHESIZED_WIRE_17 = 1;



assign	SYNTHESIZED_WIRE_3 =  ~SW;

assign	SYNTHESIZED_WIRE_14 =  ~R;

assign	SYNTHESIZED_WIRE_9 = R | SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1;


assign	SYNTHESIZED_WIRE_1 = SYNTHESIZED_WIRE_14 & SYNTHESIZED_WIRE_3 & SYNTHESIZED_WIRE_15;

assign	SYNTHESIZED_WIRE_0 = R & SYNTHESIZED_WIRE_4;

assign	SYNTHESIZED_WIRE_12 = SYNTHESIZED_WIRE_5 & SYNTHESIZED_WIRE_14;

assign	SYNTHESIZED_WIRE_7 = SW & SYNTHESIZED_WIRE_15;

assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_16 | SYNTHESIZED_WIRE_15;

assign	SYNTHESIZED_WIRE_5 = SYNTHESIZED_WIRE_16 | SYNTHESIZED_WIRE_7;


always@(posedge CLK or negedge SYNTHESIZED_WIRE_17 or negedge SYNTHESIZED_WIRE_17)
begin
if (!SYNTHESIZED_WIRE_17)
	begin
	SYNTHESIZED_WIRE_15 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_17)
	begin
	SYNTHESIZED_WIRE_15 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_15 <= SYNTHESIZED_WIRE_9;
	end
end


always@(posedge CLK or negedge SYNTHESIZED_WIRE_17 or negedge SYNTHESIZED_WIRE_17)
begin
if (!SYNTHESIZED_WIRE_17)
	begin
	SYNTHESIZED_WIRE_16 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_17)
	begin
	SYNTHESIZED_WIRE_16 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_16 <= SYNTHESIZED_WIRE_12;
	end
end


endmodule

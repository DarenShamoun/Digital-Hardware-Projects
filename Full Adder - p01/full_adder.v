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
// CREATED		"Fri Sep 19 02:22:15 2025"

module full_adder(
	A,
	B,
	Cin,
	S,
	Cout
);


input wire	A;
input wire	B;
input wire	Cin;
output wire	S;
output wire	Cout;

wire	n1;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;




assign	n1 = A ^ B;

assign	S = n1 ^ Cin;

assign	SYNTHESIZED_WIRE_1 = n1 & Cin;

assign	SYNTHESIZED_WIRE_0 = A & B;

assign	Cout = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1;


endmodule

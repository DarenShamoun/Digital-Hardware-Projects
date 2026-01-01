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
// CREATED		"Fri Oct  3 17:18:49 2025"

module adventure_game(
	n,
	s,
	e,
	w,
	clk,
	reset,
	win,
	d,
	s6,
	s5,
	s4,
	s3,
	s2,
	s1,
	s0
);


input wire	n;
input wire	s;
input wire	e;
input wire	w;
input wire	clk;
input wire	reset;
output wire	win;
output wire	d;
output wire	s6;
output wire	s5;
output wire	s4;
output wire	s3;
output wire	s2;
output wire	s1;
output wire	s0;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;





room	b2v_inst21(
	.R(reset),
	.CLK(clk),
	.n(n),
	.e(e),
	.s(s),
	.V(SYNTHESIZED_WIRE_0),
	.w(w),
	.s0(s0),
	.s1(s1),
	.s2(s2),
	.s3(s3),
	.SW(SYNTHESIZED_WIRE_1),
	.s4(s4),
	.s5(s5),
	.d(d),
	.s6(s6),
	.win(win));


sword	b2v_inst8923(
	.SW(SYNTHESIZED_WIRE_1),
	.CLK(clk),
	.R(reset),
	.V(SYNTHESIZED_WIRE_0));


endmodule

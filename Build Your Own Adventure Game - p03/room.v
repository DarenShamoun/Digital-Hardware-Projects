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
// CREATED		"Fri Oct  3 17:18:35 2025"

module room(
	R,
	CLK,
	n,
	e,
	s,
	V,
	w,
	SW,
	s0,
	s1,
	s2,
	s3,
	s5,
	s6,
	d,
	s4,
	win
);


input wire	R;
input wire	CLK;
input wire	n;
input wire	e;
input wire	s;
input wire	V;
input wire	w;
output wire	SW;
output wire	s0;
output wire	s1;
output wire	s2;
output wire	s3;
output wire	s5;
output wire	s6;
output wire	d;
output wire	s4;
output wire	win;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_35;
reg	SYNTHESIZED_WIRE_36;
reg	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_8;
reg	SYNTHESIZED_WIRE_38;
reg	DFF_s0DFF;
wire	SYNTHESIZED_WIRE_11;
reg	SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_33;
reg	DFF_s5DFF;
reg	DFF_s6DFF;

assign	SW = SYNTHESIZED_WIRE_39;
assign	s0 = DFF_s0DFF;
assign	s1 = SYNTHESIZED_WIRE_38;
assign	s2 = SYNTHESIZED_WIRE_36;
assign	s3 = SYNTHESIZED_WIRE_39;
assign	s5 = DFF_s5DFF;
assign	s6 = DFF_s6DFF;
assign	d = DFF_s5DFF;
assign	s4 = SYNTHESIZED_WIRE_37;
assign	win = DFF_s6DFF;
assign	SYNTHESIZED_WIRE_40 = 1;



assign	SYNTHESIZED_WIRE_11 = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1;

assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_21 = SYNTHESIZED_WIRE_4 & SYNTHESIZED_WIRE_35;

assign	SYNTHESIZED_WIRE_24 = SYNTHESIZED_WIRE_36 & w & SYNTHESIZED_WIRE_35;

assign	SYNTHESIZED_WIRE_27 = SYNTHESIZED_WIRE_36 & e & SYNTHESIZED_WIRE_35;

assign	SYNTHESIZED_WIRE_30 = SYNTHESIZED_WIRE_37 & SYNTHESIZED_WIRE_8 & SYNTHESIZED_WIRE_35;

assign	SYNTHESIZED_WIRE_33 = SYNTHESIZED_WIRE_37 & V & SYNTHESIZED_WIRE_35;

assign	SYNTHESIZED_WIRE_13 = SYNTHESIZED_WIRE_38 & w;

assign	SYNTHESIZED_WIRE_1 = DFF_s0DFF & e;

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_36 & n;

assign	SYNTHESIZED_WIRE_18 = SYNTHESIZED_WIRE_11 & SYNTHESIZED_WIRE_35;


assign	SYNTHESIZED_WIRE_3 = SYNTHESIZED_WIRE_39 & e;

assign	SYNTHESIZED_WIRE_15 = R | SYNTHESIZED_WIRE_13;

assign	SYNTHESIZED_WIRE_2 = SYNTHESIZED_WIRE_38 & s;

assign	SYNTHESIZED_WIRE_35 =  ~R;


always@(posedge CLK or negedge SYNTHESIZED_WIRE_40 or negedge SYNTHESIZED_WIRE_40)
begin
if (!SYNTHESIZED_WIRE_40)
	begin
	DFF_s0DFF <= 0;
	end
else
if (!SYNTHESIZED_WIRE_40)
	begin
	DFF_s0DFF <= 1;
	end
else
	begin
	DFF_s0DFF <= SYNTHESIZED_WIRE_15;
	end
end


always@(posedge CLK or negedge SYNTHESIZED_WIRE_40 or negedge SYNTHESIZED_WIRE_40)
begin
if (!SYNTHESIZED_WIRE_40)
	begin
	SYNTHESIZED_WIRE_38 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_40)
	begin
	SYNTHESIZED_WIRE_38 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_38 <= SYNTHESIZED_WIRE_18;
	end
end


always@(posedge CLK or negedge SYNTHESIZED_WIRE_40 or negedge SYNTHESIZED_WIRE_40)
begin
if (!SYNTHESIZED_WIRE_40)
	begin
	SYNTHESIZED_WIRE_36 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_40)
	begin
	SYNTHESIZED_WIRE_36 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_36 <= SYNTHESIZED_WIRE_21;
	end
end


always@(posedge CLK or negedge SYNTHESIZED_WIRE_40 or negedge SYNTHESIZED_WIRE_40)
begin
if (!SYNTHESIZED_WIRE_40)
	begin
	SYNTHESIZED_WIRE_39 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_40)
	begin
	SYNTHESIZED_WIRE_39 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_39 <= SYNTHESIZED_WIRE_24;
	end
end


always@(posedge CLK or negedge SYNTHESIZED_WIRE_40 or negedge SYNTHESIZED_WIRE_40)
begin
if (!SYNTHESIZED_WIRE_40)
	begin
	SYNTHESIZED_WIRE_37 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_40)
	begin
	SYNTHESIZED_WIRE_37 <= 1;
	end
else
	begin
	SYNTHESIZED_WIRE_37 <= SYNTHESIZED_WIRE_27;
	end
end


always@(posedge CLK or negedge SYNTHESIZED_WIRE_40 or negedge SYNTHESIZED_WIRE_40)
begin
if (!SYNTHESIZED_WIRE_40)
	begin
	DFF_s5DFF <= 0;
	end
else
if (!SYNTHESIZED_WIRE_40)
	begin
	DFF_s5DFF <= 1;
	end
else
	begin
	DFF_s5DFF <= SYNTHESIZED_WIRE_30;
	end
end


always@(posedge CLK or negedge SYNTHESIZED_WIRE_40 or negedge SYNTHESIZED_WIRE_40)
begin
if (!SYNTHESIZED_WIRE_40)
	begin
	DFF_s6DFF <= 0;
	end
else
if (!SYNTHESIZED_WIRE_40)
	begin
	DFF_s6DFF <= 1;
	end
else
	begin
	DFF_s6DFF <= SYNTHESIZED_WIRE_33;
	end
end

assign	SYNTHESIZED_WIRE_8 =  ~V;


endmodule

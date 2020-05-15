/*
	VGA
	---
	
	To use a VGA screen of 800x600 resolution we need the following settings
	This is done at a clk speed of 40Mhz
	In pixels			Horizontal			Vertical
	Front Porch			40						1		
	Back  Porch			88						23
	Sync Pulse			128					4
	Active Video		800					600
*/
module vga(
	//////// CLOCK //////////
	CLOCK_50,
	
	//////// VGA //////////
	VGA_B,
	VGA_BLANK_N,
	VGA_CLK,
	VGA_G,
	VGA_HS,
	VGA_R,
	VGA_SYNC_N,
	VGA_VS
	);
	
//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input							CLOCK_50;

//////////// VGA //////////
output		     [7:0] 	VGA_B;
output		          	VGA_BLANK_N;
output		          	VGA_CLK;
output		     [7:0]	VGA_G;
output		          	VGA_HS;
output		     [7:0]	VGA_R;
output		          	VGA_SYNC_N;
output		          	VGA_VS;

//=======================================================
//  REG/WIRE declarations
//=======================================================
//vga
wire  [9:0] vga_r10;
wire  [9:0] vga_g10;
wire  [9:0] vga_b10;

wire        reset_n; //reset	

//=======================================================
//  ARITECTURE declarations
//=======================================================
assign reset_n = 1'b1;
assign VGA_R = vga_r10[9:2];
assign VGA_G = vga_g10[9:2];
assign VGA_B = vga_b10[9:2];
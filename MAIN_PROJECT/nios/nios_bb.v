
module nios (
	clk_clk,
	reset_reset_n,
	red_out_export,
	green_out_export,
	blue_out_export);	

	input		clk_clk;
	input		reset_reset_n;
	output	[7:0]	red_out_export;
	output	[7:0]	green_out_export;
	output	[7:0]	blue_out_export;
endmodule

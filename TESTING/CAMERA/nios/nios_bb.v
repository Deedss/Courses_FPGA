
module nios (
	clk_clk,
	rgb_in_export,
	rgb_out_export);	

	input		clk_clk;
	input	[23:0]	rgb_in_export;
	output	[23:0]	rgb_out_export;
endmodule

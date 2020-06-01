
module nios (
	blue_in_port,
	blue_out_port,
	clk_clk,
	green_in_port,
	green_out_port,
	h_cont_export,
	red_in_port,
	red_out_port,
	sw_in_port,
	sw_out_port,
	v_cont_export);	

	input	[7:0]	blue_in_port;
	output	[7:0]	blue_out_port;
	input		clk_clk;
	input	[7:0]	green_in_port;
	output	[7:0]	green_out_port;
	input	[15:0]	h_cont_export;
	input	[7:0]	red_in_port;
	output	[7:0]	red_out_port;
	input	[17:0]	sw_in_port;
	output	[17:0]	sw_out_port;
	input	[15:0]	v_cont_export;
endmodule

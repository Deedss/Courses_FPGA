
module nios (
	clk_clk,
	red_in_port,
	red_out_port,
	green_in_port,
	green_out_port,
	blue_in_port,
	blue_out_port);	

	input		clk_clk;
	input	[7:0]	red_in_port;
	output	[7:0]	red_out_port;
	input	[7:0]	green_in_port;
	output	[7:0]	green_out_port;
	input	[7:0]	blue_in_port;
	output	[7:0]	blue_out_port;
endmodule

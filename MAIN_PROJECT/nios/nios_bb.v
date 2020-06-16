
module nios (
	blue_in_port,
	blue_out_port,
	clk_clk,
	green_in_port,
	green_out_port,
	red_in_port,
	red_out_port,
	sd_clk_external_connection_export,
	sd_cmd_external_connection_export,
	sd_dat_external_connection_export,
	sd_wp_n_external_connection_export,
	sw_in_port,
	sw_out_port);	

	input	[7:0]	blue_in_port;
	output	[7:0]	blue_out_port;
	input		clk_clk;
	input	[7:0]	green_in_port;
	output	[7:0]	green_out_port;
	input	[7:0]	red_in_port;
	output	[7:0]	red_out_port;
	output		sd_clk_external_connection_export;
	inout		sd_cmd_external_connection_export;
	inout	[3:0]	sd_dat_external_connection_export;
	input		sd_wp_n_external_connection_export;
	input	[17:0]	sw_in_port;
	output	[17:0]	sw_out_port;
endmodule

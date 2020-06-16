
module nios (
	blue_in_port,
	blue_out_port,
	clk_clk,
	green_in_port,
	green_out_port,
	red_in_port,
	red_out_port,
	sd_card_b_SD_cmd,
	sd_card_b_SD_dat,
	sd_card_b_SD_dat3,
	sd_card_o_SD_clock,
	sw_in_port,
	sw_out_port);	

	input	[7:0]	blue_in_port;
	output	[7:0]	blue_out_port;
	input		clk_clk;
	input	[7:0]	green_in_port;
	output	[7:0]	green_out_port;
	input	[7:0]	red_in_port;
	output	[7:0]	red_out_port;
	inout		sd_card_b_SD_cmd;
	inout		sd_card_b_SD_dat;
	inout		sd_card_b_SD_dat3;
	output		sd_card_o_SD_clock;
	input	[17:0]	sw_in_port;
	output	[17:0]	sw_out_port;
endmodule

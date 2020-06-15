
module nios (
	blue_in_port,
	blue_out_port,
	clk_clk,
	green_in_port,
	green_out_port,
	red_in_port,
	red_out_port,
	sw_in_port,
	sw_out_port,
	sd_card_export,
	sd_card_export1,
	sd_card_export2,
	sd_card_writeresponsevalid_n);	

	input	[7:0]	blue_in_port;
	output	[7:0]	blue_out_port;
	input		clk_clk;
	input	[7:0]	green_in_port;
	output	[7:0]	green_out_port;
	input	[7:0]	red_in_port;
	output	[7:0]	red_out_port;
	input	[17:0]	sw_in_port;
	output	[17:0]	sw_out_port;
	inout		sd_card_export;
	inout		sd_card_export1;
	inout		sd_card_export2;
	output		sd_card_writeresponsevalid_n;
endmodule

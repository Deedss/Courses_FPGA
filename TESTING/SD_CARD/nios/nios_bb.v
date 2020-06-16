
module nios (
	clk_clk,
	reset_reset_n,
	sd_card_b_sd_cmd,
	sd_card_b_sd_dat,
	sd_card_b_sd_dat3,
	sd_card_o_sd_clock);	

	input		clk_clk;
	input		reset_reset_n;
	inout		sd_card_b_sd_cmd;
	inout		sd_card_b_sd_dat;
	inout		sd_card_b_sd_dat3;
	output		sd_card_o_sd_clock;
endmodule

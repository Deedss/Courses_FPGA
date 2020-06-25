
module bruh (
	clk_clk,
	reset_reset_n,
	sdcard_wire_b_sd_cmd,
	sdcard_wire_b_sd_dat,
	sdcard_wire_b_sd_dat3,
	sdcard_wire_o_sd_clock);	

	input		clk_clk;
	input		reset_reset_n;
	inout		sdcard_wire_b_sd_cmd;
	inout		sdcard_wire_b_sd_dat;
	inout		sdcard_wire_b_sd_dat3;
	output		sdcard_wire_o_sd_clock;
endmodule

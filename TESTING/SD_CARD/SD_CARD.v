module SD_CARD(
	input   CLOCK_50, 
	inout   SD_DAT,
	inout	  SD_DAT3,
	inout   SD_CMD, 
	output  SD_CLK
	);
	
	nios u0 (
	  .clk_clk            (CLOCK_50),            //     clk.clk
	  .reset_reset_n      (1'b1),      //   reset.reset_n
	  .sd_card_b_sd_cmd   (SD_CMD),   // sd_card.b_sd_cmd
	  .sd_card_b_sd_dat   (SD_DAT),   //        .b_sd_dat
	  .sd_card_b_sd_dat3  (SD_DAT3),  //        .b_sd_dat3
	  .sd_card_o_sd_clock (SD_CLK)  //        .o_sd_clock
	);

endmodule 
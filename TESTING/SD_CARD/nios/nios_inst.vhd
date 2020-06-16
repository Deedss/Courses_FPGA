	component nios is
		port (
			clk_clk            : in    std_logic := 'X'; -- clk
			reset_reset_n      : in    std_logic := 'X'; -- reset_n
			sd_card_b_sd_cmd   : inout std_logic := 'X'; -- b_sd_cmd
			sd_card_b_sd_dat   : inout std_logic := 'X'; -- b_sd_dat
			sd_card_b_sd_dat3  : inout std_logic := 'X'; -- b_sd_dat3
			sd_card_o_sd_clock : out   std_logic         -- o_sd_clock
		);
	end component nios;

	u0 : component nios
		port map (
			clk_clk            => CONNECTED_TO_clk_clk,            --     clk.clk
			reset_reset_n      => CONNECTED_TO_reset_reset_n,      --   reset.reset_n
			sd_card_b_sd_cmd   => CONNECTED_TO_sd_card_b_sd_cmd,   -- sd_card.b_sd_cmd
			sd_card_b_sd_dat   => CONNECTED_TO_sd_card_b_sd_dat,   --        .b_sd_dat
			sd_card_b_sd_dat3  => CONNECTED_TO_sd_card_b_sd_dat3,  --        .b_sd_dat3
			sd_card_o_sd_clock => CONNECTED_TO_sd_card_o_sd_clock  --        .o_sd_clock
		);


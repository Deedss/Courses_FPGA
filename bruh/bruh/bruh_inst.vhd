	component bruh is
		port (
			clk_clk                : in    std_logic := 'X'; -- clk
			reset_reset_n          : in    std_logic := 'X'; -- reset_n
			sdcard_wire_b_sd_cmd   : inout std_logic := 'X'; -- b_sd_cmd
			sdcard_wire_b_sd_dat   : inout std_logic := 'X'; -- b_sd_dat
			sdcard_wire_b_sd_dat3  : inout std_logic := 'X'; -- b_sd_dat3
			sdcard_wire_o_sd_clock : out   std_logic         -- o_sd_clock
		);
	end component bruh;

	u0 : component bruh
		port map (
			clk_clk                => CONNECTED_TO_clk_clk,                --         clk.clk
			reset_reset_n          => CONNECTED_TO_reset_reset_n,          --       reset.reset_n
			sdcard_wire_b_sd_cmd   => CONNECTED_TO_sdcard_wire_b_sd_cmd,   -- sdcard_wire.b_sd_cmd
			sdcard_wire_b_sd_dat   => CONNECTED_TO_sdcard_wire_b_sd_dat,   --            .b_sd_dat
			sdcard_wire_b_sd_dat3  => CONNECTED_TO_sdcard_wire_b_sd_dat3,  --            .b_sd_dat3
			sdcard_wire_o_sd_clock => CONNECTED_TO_sdcard_wire_o_sd_clock  --            .o_sd_clock
		);


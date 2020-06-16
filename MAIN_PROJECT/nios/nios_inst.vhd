	component nios is
		port (
			blue_in_port       : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- in_port
			blue_out_port      : out   std_logic_vector(7 downto 0);                     -- out_port
			clk_clk            : in    std_logic                     := 'X';             -- clk
			green_in_port      : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- in_port
			green_out_port     : out   std_logic_vector(7 downto 0);                     -- out_port
			red_in_port        : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- in_port
			red_out_port       : out   std_logic_vector(7 downto 0);                     -- out_port
			sd_card_b_SD_cmd   : inout std_logic                     := 'X';             -- b_SD_cmd
			sd_card_b_SD_dat   : inout std_logic                     := 'X';             -- b_SD_dat
			sd_card_b_SD_dat3  : inout std_logic                     := 'X';             -- b_SD_dat3
			sd_card_o_SD_clock : out   std_logic;                                        -- o_SD_clock
			sw_in_port         : in    std_logic_vector(17 downto 0) := (others => 'X'); -- in_port
			sw_out_port        : out   std_logic_vector(17 downto 0)                     -- out_port
		);
	end component nios;

	u0 : component nios
		port map (
			blue_in_port       => CONNECTED_TO_blue_in_port,       --    blue.in_port
			blue_out_port      => CONNECTED_TO_blue_out_port,      --        .out_port
			clk_clk            => CONNECTED_TO_clk_clk,            --     clk.clk
			green_in_port      => CONNECTED_TO_green_in_port,      --   green.in_port
			green_out_port     => CONNECTED_TO_green_out_port,     --        .out_port
			red_in_port        => CONNECTED_TO_red_in_port,        --     red.in_port
			red_out_port       => CONNECTED_TO_red_out_port,       --        .out_port
			sd_card_b_SD_cmd   => CONNECTED_TO_sd_card_b_SD_cmd,   -- sd_card.b_SD_cmd
			sd_card_b_SD_dat   => CONNECTED_TO_sd_card_b_SD_dat,   --        .b_SD_dat
			sd_card_b_SD_dat3  => CONNECTED_TO_sd_card_b_SD_dat3,  --        .b_SD_dat3
			sd_card_o_SD_clock => CONNECTED_TO_sd_card_o_SD_clock, --        .o_SD_clock
			sw_in_port         => CONNECTED_TO_sw_in_port,         --      sw.in_port
			sw_out_port        => CONNECTED_TO_sw_out_port         --        .out_port
		);


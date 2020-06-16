	component nios is
		port (
			blue_in_port                       : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- in_port
			blue_out_port                      : out   std_logic_vector(7 downto 0);                     -- out_port
			clk_clk                            : in    std_logic                     := 'X';             -- clk
			green_in_port                      : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- in_port
			green_out_port                     : out   std_logic_vector(7 downto 0);                     -- out_port
			red_in_port                        : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- in_port
			red_out_port                       : out   std_logic_vector(7 downto 0);                     -- out_port
			sd_clk_external_connection_export  : out   std_logic;                                        -- export
			sd_cmd_external_connection_export  : inout std_logic                     := 'X';             -- export
			sd_dat_external_connection_export  : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			sd_wp_n_external_connection_export : in    std_logic                     := 'X';             -- export
			sw_in_port                         : in    std_logic_vector(17 downto 0) := (others => 'X'); -- in_port
			sw_out_port                        : out   std_logic_vector(17 downto 0)                     -- out_port
		);
	end component nios;

	u0 : component nios
		port map (
			blue_in_port                       => CONNECTED_TO_blue_in_port,                       --                        blue.in_port
			blue_out_port                      => CONNECTED_TO_blue_out_port,                      --                            .out_port
			clk_clk                            => CONNECTED_TO_clk_clk,                            --                         clk.clk
			green_in_port                      => CONNECTED_TO_green_in_port,                      --                       green.in_port
			green_out_port                     => CONNECTED_TO_green_out_port,                     --                            .out_port
			red_in_port                        => CONNECTED_TO_red_in_port,                        --                         red.in_port
			red_out_port                       => CONNECTED_TO_red_out_port,                       --                            .out_port
			sd_clk_external_connection_export  => CONNECTED_TO_sd_clk_external_connection_export,  --  sd_clk_external_connection.export
			sd_cmd_external_connection_export  => CONNECTED_TO_sd_cmd_external_connection_export,  --  sd_cmd_external_connection.export
			sd_dat_external_connection_export  => CONNECTED_TO_sd_dat_external_connection_export,  --  sd_dat_external_connection.export
			sd_wp_n_external_connection_export => CONNECTED_TO_sd_wp_n_external_connection_export, -- sd_wp_n_external_connection.export
			sw_in_port                         => CONNECTED_TO_sw_in_port,                         --                          sw.in_port
			sw_out_port                        => CONNECTED_TO_sw_out_port                         --                            .out_port
		);


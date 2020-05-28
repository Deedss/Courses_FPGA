	component nios is
		port (
			clk_clk        : in  std_logic                    := 'X';             -- clk
			red_in_port    : in  std_logic_vector(7 downto 0) := (others => 'X'); -- in_port
			red_out_port   : out std_logic_vector(7 downto 0);                    -- out_port
			green_in_port  : in  std_logic_vector(7 downto 0) := (others => 'X'); -- in_port
			green_out_port : out std_logic_vector(7 downto 0);                    -- out_port
			blue_in_port   : in  std_logic_vector(7 downto 0) := (others => 'X'); -- in_port
			blue_out_port  : out std_logic_vector(7 downto 0)                     -- out_port
		);
	end component nios;

	u0 : component nios
		port map (
			clk_clk        => CONNECTED_TO_clk_clk,        --   clk.clk
			red_in_port    => CONNECTED_TO_red_in_port,    --   red.in_port
			red_out_port   => CONNECTED_TO_red_out_port,   --      .out_port
			green_in_port  => CONNECTED_TO_green_in_port,  -- green.in_port
			green_out_port => CONNECTED_TO_green_out_port, --      .out_port
			blue_in_port   => CONNECTED_TO_blue_in_port,   --  blue.in_port
			blue_out_port  => CONNECTED_TO_blue_out_port   --      .out_port
		);


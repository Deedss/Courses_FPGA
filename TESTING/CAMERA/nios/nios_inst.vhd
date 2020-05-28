	component nios is
		port (
			clk_clk        : in  std_logic                     := 'X';             -- clk
			rgb_in_export  : in  std_logic_vector(23 downto 0) := (others => 'X'); -- export
			rgb_out_export : out std_logic_vector(23 downto 0)                     -- export
		);
	end component nios;

	u0 : component nios
		port map (
			clk_clk        => CONNECTED_TO_clk_clk,        --     clk.clk
			rgb_in_export  => CONNECTED_TO_rgb_in_export,  --  rgb_in.export
			rgb_out_export => CONNECTED_TO_rgb_out_export  -- rgb_out.export
		);


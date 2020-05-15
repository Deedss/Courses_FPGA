	component nios is
		port (
			clk_clk          : in  std_logic                    := 'X'; -- clk
			reset_reset_n    : in  std_logic                    := 'X'; -- reset_n
			red_out_export   : out std_logic_vector(7 downto 0);        -- export
			green_out_export : out std_logic_vector(7 downto 0);        -- export
			blue_out_export  : out std_logic_vector(7 downto 0)         -- export
		);
	end component nios;

	u0 : component nios
		port map (
			clk_clk          => CONNECTED_TO_clk_clk,          --       clk.clk
			reset_reset_n    => CONNECTED_TO_reset_reset_n,    --     reset.reset_n
			red_out_export   => CONNECTED_TO_red_out_export,   --   red_out.export
			green_out_export => CONNECTED_TO_green_out_export, -- green_out.export
			blue_out_export  => CONNECTED_TO_blue_out_export   --  blue_out.export
		);


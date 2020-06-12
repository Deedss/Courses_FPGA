	component nios is
		port (
			clk_clk       : in    std_logic                     := 'X';             -- clk
			reset_reset_n : in    std_logic                     := 'X';             -- reset_n
			sram_DQ       : inout std_logic_vector(15 downto 0) := (others => 'X'); -- DQ
			sram_ADDR     : out   std_logic_vector(19 downto 0);                    -- ADDR
			sram_LB_N     : out   std_logic;                                        -- LB_N
			sram_UB_N     : out   std_logic;                                        -- UB_N
			sram_CE_N     : out   std_logic;                                        -- CE_N
			sram_OE_N     : out   std_logic;                                        -- OE_N
			sram_WE_N     : out   std_logic;                                        -- WE_N
			vga_out_CLK   : out   std_logic;                                        -- CLK
			vga_out_HS    : out   std_logic;                                        -- HS
			vga_out_VS    : out   std_logic;                                        -- VS
			vga_out_BLANK : out   std_logic;                                        -- BLANK
			vga_out_SYNC  : out   std_logic;                                        -- SYNC
			vga_out_R     : out   std_logic_vector(7 downto 0);                     -- R
			vga_out_G     : out   std_logic_vector(7 downto 0);                     -- G
			vga_out_B     : out   std_logic_vector(7 downto 0)                      -- B
		);
	end component nios;

	u0 : component nios
		port map (
			clk_clk       => CONNECTED_TO_clk_clk,       --     clk.clk
			reset_reset_n => CONNECTED_TO_reset_reset_n, --   reset.reset_n
			sram_DQ       => CONNECTED_TO_sram_DQ,       --    sram.DQ
			sram_ADDR     => CONNECTED_TO_sram_ADDR,     --        .ADDR
			sram_LB_N     => CONNECTED_TO_sram_LB_N,     --        .LB_N
			sram_UB_N     => CONNECTED_TO_sram_UB_N,     --        .UB_N
			sram_CE_N     => CONNECTED_TO_sram_CE_N,     --        .CE_N
			sram_OE_N     => CONNECTED_TO_sram_OE_N,     --        .OE_N
			sram_WE_N     => CONNECTED_TO_sram_WE_N,     --        .WE_N
			vga_out_CLK   => CONNECTED_TO_vga_out_CLK,   -- vga_out.CLK
			vga_out_HS    => CONNECTED_TO_vga_out_HS,    --        .HS
			vga_out_VS    => CONNECTED_TO_vga_out_VS,    --        .VS
			vga_out_BLANK => CONNECTED_TO_vga_out_BLANK, --        .BLANK
			vga_out_SYNC  => CONNECTED_TO_vga_out_SYNC,  --        .SYNC
			vga_out_R     => CONNECTED_TO_vga_out_R,     --        .R
			vga_out_G     => CONNECTED_TO_vga_out_G,     --        .G
			vga_out_B     => CONNECTED_TO_vga_out_B      --        .B
		);


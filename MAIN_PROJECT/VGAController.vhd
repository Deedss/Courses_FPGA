LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY VGAController IS
	GENERIC(
		h_pulse	: INTEGER := 128;
		h_back	: INTEGER := 88;
		h_pixels	: INTEGER := 800;
		h_front	: INTEGER := 40;
		h_pol		: std_logic := '1';
		v_pulse	: INTEGER := 4;
		v_back	: INTEGER := 23;
		v_pixels	: INTEGER := 600;
		v_front	: INTEGER := 1;
		v_pol		: std_logic := '1');
	PORT(
		VGA_CLK : IN std_logic;
		reset_n		: IN std_logic;
		VGA_HS		: OUT std_logic;
		VGA_VS		: OUT std_logic;
		disp_en		: OUT std_logic;
		column		: OUT INTEGER RANGE 0 TO 10000;
		row			: OUT INTEGER RANGE 0 TO 10000;
		VGA_BLANK_N		: OUT std_logic;
		VGA_SYNC_N		: OUT std_logic);
END VGAController;

ARCHITECTURE Behavior OF VGAController IS
	CONSTANT h_period : INTEGER := h_pulse + h_back + h_pixels + h_front;
	CONSTANT v_period : INTEGER := v_pulse + v_back + v_pixels + v_front;
BEGIN
	VGA_BLANK_N <= '1';
	VGA_SYNC_N <= '0';
	
	PROCESS(VGA_CLK)
		VARIABLE h_count : INTEGER RANGE 0 TO h_period - 1 := 0;
		VARIABLE v_count : INTEGER RANGE 0 TO v_period - 1 := 0;
	BEGIN
		IF reset_n = '0' THEN
			h_count := 0;
			v_count := 0;
			VGA_HS <= not h_pol;
			VGA_VS <= not v_pol;
			disp_en <= '0';
			column <= 0;
			row <= 0;
		ELSIF VGA_CLK'event and VGA_CLK = '1' THEN
			
			IF h_count < h_period - 1 THEN
				h_count := h_count + 1;
			ELSE
				h_count := 0;
				IF v_count < v_period - 1 THEN
					v_count := v_count + 1;
				ELSE
					v_count := 0;
				END IF;
			END IF;
			
			IF h_count < h_pixels + h_front or h_count >= h_pixels + h_front + h_pulse THEN
				VGA_HS <= not h_pol;
			ELSE
				VGA_HS <= h_pol;
			END IF;
			
			IF v_count < v_pixels + v_front or v_count >= v_pixels + v_front + v_pulse THEN
				VGA_VS <= not v_pol;
			ELSE
				VGA_VS <= v_pol;
			END IF;
			
			IF h_count < h_pixels and v_count < v_pixels THEN
				disp_en <= '1';
			ELSE
				disp_en <= '0';
			END IF;
		END IF;
	END PROCESS;
END Behavior;
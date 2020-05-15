LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY VGA IS
	GENERIC(
		-- Values to determine the resolution
		-- These values are changed within the VGA.bdf file
		---------------------------------------
		h_pulse	: INTEGER 	:= 128;
		h_back	: INTEGER 	:= 88;
		h_pixels	: INTEGER 	:= 800;
		h_front	: INTEGER 	:= 40;
		h_pol		: std_logic	:= '1';
		v_pulse	: INTEGER	:= 4;
		v_back	: INTEGER 	:= 23;
		v_pixels	: INTEGER 	:= 600;
		v_front	: INTEGER 	:= 1;
		v_pol		: std_logic	:= '1'
		---------------------------------------
		
		);
	PORT(
		-- I/O for the VGA
		---------------------------------------
		VGA_CLK 		: IN std_logic;
		reset_n		: IN std_logic;
		VGA_HS		: OUT std_logic;
		VGA_VS		: OUT std_logic;
		VGA_BLANK_N	: OUT std_logic;
		VGA_SYNC_N	: OUT std_logic;
		VGA_R			: OUT std_logic_vector(7 DOWNTO 0);
		VGA_G			: OUT std_logic_vector(7 DOWNTO 0);
		VGA_B			: OUT std_logic_vector(7 DOWNTO 0)
		---------------------------------------
		
		);
END VGA;

ARCHITECTURE Behavior OF VGA IS
	CONSTANT h_period : INTEGER := h_pulse + h_back + h_pixels + h_front;
	CONSTANT v_period : INTEGER := v_pulse + v_back + v_pixels + v_front;
	SIGNAL	inDA   	: std_logic := '1';
BEGIN
	-- Standard values (don't change them!)
	VGA_BLANK_N <= '1';
	VGA_SYNC_N <= '0';
	
	-- VGA controller
	controller:PROCESS(VGA_CLK)
		VARIABLE h_count : INTEGER RANGE 0 TO h_period - 1 := 0;
		VARIABLE v_count : INTEGER RANGE 0 TO v_period - 1 := 0;
	BEGIN
		-- Resets all values
		IF reset_n = '0' THEN
			h_count := 0;
			v_count := 0;
			VGA_HS <= not h_pol;
			VGA_VS <= not v_pol;
			inDA <= '0';
			
		-- For everytime there is a clock event and the clock is HIGH
		ELSIF rising_edge(VGA_CLK) THEN
		
			-- counters
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
			
			-- Sets the horizontal sync
			IF h_count < h_pixels + h_front or h_count >= h_pixels + h_front + h_pulse THEN
				VGA_HS <= not h_pol;
			ELSE
				VGA_HS <= h_pol;
			END IF;
			
			-- Sets the vertical sync
			IF v_count < v_pixels + v_front or v_count >= v_pixels + v_front + v_pulse THEN
				VGA_VS <= not v_pol;
			ELSE
				VGA_VS <= v_pol;
			END IF;
			
			-- sets wether count is in display area.
			IF h_count < h_pixels and v_count < v_pixels THEN
				inDA <= '1';
			ELSE
				inDA <= '0';
			END IF;
		END IF;
	END PROCESS;
	
	-- VGA Output process
	output:PROCESS(inDA)
	BEGIN
		IF inDA = '1' THEN
			VGA_R <= "00000000";
			VGA_G <= "00000000";
			VGA_B <= "11111111";
		ELSE
			VGA_R <= "00000000";
			VGA_G <= "00000000";
			VGA_B <= "00000000";
		END IF;
	END PROCESS;
	
END Behavior;
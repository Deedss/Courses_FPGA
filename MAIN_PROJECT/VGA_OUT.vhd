LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY VGA_OUT IS
	PORT(
		disp_en		: IN std_logic;
		column		: IN INTEGER RANGE 0 TO 10000;
		row			: IN INTEGER RANGE 0 TO 10000;
		redIn			: IN std_logic_vector(7 DOWNTO 0);
		greenIn		: IN std_logic_vector(7 DOWNTO 0);
		blueIn		: IN std_logic_vector(7 DOWNTO 0);
--		SW				: IN std_logic_vector(17 downto 0);
--		KEY			: IN std_logic_vector(3 downto 0);
		VGA_R			: OUT std_logic_vector(7 DOWNTO 0);
		VGA_G			: OUT std_logic_vector(7 DOWNTO 0);
		VGA_B			: OUT std_logic_vector(7 DOWNTO 0));
END VGA_OUT;

ARCHITECTURE Behavior OF VGA_OUT IS

BEGIN
	PROCESS(disp_en, column, row)
	BEGIN
		IF disp_en = '1' THEN
			IF (row > 300 AND column > 200 and column < 400) THEN
				VGA_R <= "11111111";
				VGA_G <= "11111111";
				VGA_B <= "11111111";
			END IF;
		ELSE
			VGA_R <= "00000001";
			VGA_G <= "00000001";
			VGA_B <= "00000001";
		END IF;
	END PROCESS;
END Behavior;
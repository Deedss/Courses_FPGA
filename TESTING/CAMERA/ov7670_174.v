// OV7670 module read the ov7670 data and save it in a 16bit unit
module ov7670_174(
	input				clk_24,
	input				reset,

	// Camera 
	output				xclk,
	input 				pclk,

	input				vsync,
	input				href,

	input		[7:0]	data,

	output	reg			cam_rst,
	output	reg			cam_pwdn,

	// Memory 
	output	reg	[15:0]	value,
	output	reg	[9:0]	x_addr,
	output	reg	[9:0]	y_addr,

	output	reg	[18:0]	mem_addr,
	output	reg			is_val,

	input wire 			frame_done, 
	input 				key

);
	reg 		[7:0]	val_temp;
	reg			[7:0]	val_msb;

	// output value
	always@ (*) begin
			value <= {val_temp,val_msb} ;
	end

	// Drive xclk (24 MHz)
	assign xclk = clk_24;
	
	// Control reset and power down
	always@ (posedge clk_24) begin
		if (reset == 1'b1) begin
			cam_rst <= 1'b0;	
			cam_pwdn <= 1'b1;	
		end
		else begin
			cam_rst <= 1'b1;
			cam_pwdn <= 1'b0;
		end
	end
	
	reg last_href;	
	reg	is_lsb;		

	// Deal with data
	always@ (posedge pclk) begin
		// Reset position at the end of frame
		if (vsync == 1'b1 && href == 1'b0 && last_href == 1'b0) begin
			x_addr <= 10'd1023;
			y_addr <= 10'b0;
			mem_addr <= 19'd524287; //the maximum of 19 bits
			val_temp <= 8'b0;
			is_val <= 1'b0;
			is_lsb <= 1'b0;
		end

		// Frame ongoing
		else begin
			if (href == 1'b1) begin
				if (is_lsb) begin	//the last 8 bit 
					x_addr <= x_addr + 10'b1;
					y_addr <= y_addr;
					mem_addr <= mem_addr + 1;

					val_temp <= data;
					is_val <= 1'b1;
				end
				else begin		//the first 8 bit
					x_addr <= x_addr;
					y_addr <= y_addr;
					mem_addr <= mem_addr;

					val_msb <= data;
					is_val <= 1'b0;
				end

				is_lsb <= ~is_lsb;
			end
			else begin
				val_temp <= 8'b0;
				is_val <= 1'b0;
				is_lsb <= 1'b0;

				// at the end of the line update (fix the black line bug of ov7670)
				if (last_href == 1'b1) begin
					x_addr <= 10'd1023;
					y_addr <= y_addr + 10'b1;
					mem_addr <= 174 * (y_addr + 1) - 1;					
				end
				else begin
					x_addr <= x_addr;
					y_addr <= y_addr;
					mem_addr <= mem_addr;
				end
			end
		end

		last_href <= href;
	end

endmodule
// read in the ov7670 data and store it into M10K-Block

module cam_buffer(
	input				clk_24,
	input				reset,

	// Camera 
	output				xclk,
	input 				pclk,

	input				vsync,
	input				href,

	input		[7:0]	data,

	output				cam_rst,
	output				cam_pwdn,

	// External 
	input				rd_clk,
	input		[9:0]	x_addr,
	input		[9:0]	y_addr,

	output		[15:0]	value,
	input wire frame_done,
	input key
);


	// Define local wires
	wire		[15:0]	mem_val;
	wire		[15:0]	wr_val;
	wire				is_wr_val;
	wire		[18:0]	wr_addr;
	wire 		[18:0]	rd_addr;

	wire 		[9:0]	x_addr_corr;
	wire 		[9:0]	y_addr_corr;

	// Correct x and y addresses to account for memory delay
	assign x_addr_corr = x_addr;
	assign y_addr_corr = y_addr;
	// Instantiate camera

	ov7670_174 cam(
		.clk_24(clk_24),
		.reset(reset),
		.xclk(xclk),
		.pclk(pclk),
		.vsync(vsync),
		.href(href),
		.data(data),
		.cam_rst(cam_rst),
		.cam_pwdn(cam_pwdn),
		.value(wr_val),
		.x_addr(),
		.y_addr(),
		.mem_addr(wr_addr),
		.is_val(is_wr_val),
		.frame_done(frame_done),
		.key(key)
	);


	// Determine rd_addr using x_addr and y_addr
	assign rd_addr = x_addr_corr + y_addr_corr*174;
	
	// Only output memory value if x_addr < 174 y_addr < 144
	assign value = (x_addr_corr < 174 && y_addr_corr < 144) ? mem_val : {5'b0,11'b0};

	dual_clock_ram_174_144 frame_buf(
		.q(mem_val),
		.d(wr_val),
		.write_address(wr_addr[16:0]),
		.read_address(rd_addr[16:0]),
		.we(is_wr_val),
		.clk1(pclk),
		.clk2(rd_clk)
	);

endmodule


/* Adapted from Altera's Recommended HDL Coding Styles Example 12-16 */
module dual_clock_ram_174_144(
	output	reg	[15:0]	q,
	input		[15:0]	d,
	input		[16:0] 	write_address, read_address,
	input 				we, clk1, clk2
);
	reg			[16:0]	read_address_reg;
	reg			[15:0]	mem [25055:0];  
	reg   color;
	
	always @ (posedge clk1)
	begin
		if (we)
			color <= ~color;
			mem[write_address] <= d;
			
 	end

	always @ (posedge clk2) begin
		q <= mem[read_address_reg];
		read_address_reg <= read_address;
	end

endmodule

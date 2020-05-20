

module DE1_SoC_Computer (
	////////////////////////////////////
	// FPGA Pins
	////////////////////////////////////

	// Clock pins
	CLOCK_50,
	CLOCK2_50,
	CLOCK3_50,
	CLOCK4_50,

	// ADC
	ADC_CS_N,
	ADC_DIN,
	ADC_DOUT,
	ADC_SCLK,

	// Audio
	AUD_ADCDAT,
	AUD_ADCLRCK,
	AUD_BCLK,
	AUD_DACDAT,
	AUD_DACLRCK,
	AUD_XCK,

	// SDRAM
	DRAM_ADDR,
	DRAM_BA,
	DRAM_CAS_N,
	DRAM_CKE,
	DRAM_CLK,
	DRAM_CS_N,
	DRAM_DQ,
	DRAM_LDQM,
	DRAM_RAS_N,
	DRAM_UDQM,
	DRAM_WE_N,

	// I2C Bus for Configuration of the Audio and Video-In Chips
	FPGA_I2C_SCLK,
	FPGA_I2C_SDAT,

	// 40-Pin Headers
	GPIO_0,
	GPIO_1,
	
	// Seven Segment Displays
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5,

	// IR
	IRDA_RXD,
	IRDA_TXD,

	// Pushbuttons
	KEY,

	// LEDs
	LEDR,

	// PS2 Ports
	PS2_CLK,
	PS2_DAT,
	
	PS2_CLK2,
	PS2_DAT2,

	// Slider Switches
	SW,

	// Video-In
	TD_CLK27,
	TD_DATA,
	TD_HS,
	TD_RESET_N,
	TD_VS,

	// VGA
	VGA_B,
	VGA_BLANK_N,
	VGA_CLK,
	VGA_G,
	VGA_HS,
	VGA_R,
	VGA_SYNC_N,
	VGA_VS,

//	////////////////////////////////////
//	// HPS Pins
//	////////////////////////////////////
//	
//	// DDR3 SDRAM
//	HPS_DDR3_ADDR,
//	HPS_DDR3_BA,
//	HPS_DDR3_CAS_N,
//	HPS_DDR3_CKE,
//	HPS_DDR3_CK_N,
//	HPS_DDR3_CK_P,
//	HPS_DDR3_CS_N,
//	HPS_DDR3_DM,
//	HPS_DDR3_DQ,
//	HPS_DDR3_DQS_N,
//	HPS_DDR3_DQS_P,
//	HPS_DDR3_ODT,
//	HPS_DDR3_RAS_N,
//	HPS_DDR3_RESET_N,
//	HPS_DDR3_RZQ,
//	HPS_DDR3_WE_N,
//
//	// Ethernet
//	HPS_ENET_GTX_CLK,
//	HPS_ENET_INT_N,
//	HPS_ENET_MDC,
//	HPS_ENET_MDIO,
//	HPS_ENET_RX_CLK,
//	HPS_ENET_RX_DATA,
//	HPS_ENET_RX_DV,
//	HPS_ENET_TX_DATA,
//	HPS_ENET_TX_EN,
//
//	// Flash
//	HPS_FLASH_DATA,
//	HPS_FLASH_DCLK,
//	HPS_FLASH_NCSO,
//
//	// Accelerometer
//	HPS_GSENSOR_INT,
//		
//	// General Purpose I/O
//	HPS_GPIO,
//		
//	// I2C
//	HPS_I2C_CONTROL,
//	HPS_I2C1_SCLK,
//	HPS_I2C1_SDAT,
//	HPS_I2C2_SCLK,
//	HPS_I2C2_SDAT,
//
//	// Pushbutton
//	HPS_KEY,
//
//	// LED
//	HPS_LED,
//		
//	// SD Card
//	HPS_SD_CLK,
//	HPS_SD_CMD,
//	HPS_SD_DATA,
//
//	// SPI
//	HPS_SPIM_CLK,
//	HPS_SPIM_MISO,
//	HPS_SPIM_MOSI,
//	HPS_SPIM_SS,
//
//	// UART
//	HPS_UART_RX,
//	HPS_UART_TX,
//
//	// USB
//	HPS_CONV_USB_N,
//	HPS_USB_CLKOUT,
//	HPS_USB_DATA,
//	HPS_USB_DIR,
//	HPS_USB_NXT,
//	HPS_USB_STP
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

////////////////////////////////////
// FPGA Pins
////////////////////////////////////

// Clock pins
input						CLOCK_50;
input						CLOCK2_50;
input						CLOCK3_50;
input						CLOCK4_50;

// ADC
inout						ADC_CS_N;
output					ADC_DIN;
input						ADC_DOUT;
output					ADC_SCLK;

// Audio
input						AUD_ADCDAT;
inout						AUD_ADCLRCK;
inout						AUD_BCLK;
output					AUD_DACDAT;
inout						AUD_DACLRCK;
output					AUD_XCK;

// SDRAM
output 		[12: 0]	DRAM_ADDR;
output		[ 1: 0]	DRAM_BA;
output					DRAM_CAS_N;
output					DRAM_CKE;
output					DRAM_CLK;
output					DRAM_CS_N;
inout			[15: 0]	DRAM_DQ;
output					DRAM_LDQM;
output					DRAM_RAS_N;
output					DRAM_UDQM;
output					DRAM_WE_N;

// I2C Bus for Configuration of the Audio and Video-In Chips
output					FPGA_I2C_SCLK;
inout						FPGA_I2C_SDAT;

// 40-pin headers
inout			[35: 0]	GPIO_0;
inout			[35: 0]	GPIO_1;

// Seven Segment Displays
output		[ 6: 0]	HEX0;
output		[ 6: 0]	HEX1;
output		[ 6: 0]	HEX2;
output		[ 6: 0]	HEX3;
output		[ 6: 0]	HEX4;
output		[ 6: 0]	HEX5;

// IR
input						IRDA_RXD;
output					IRDA_TXD;

// Pushbuttons
input			[ 3: 0]	KEY;

// LEDs
output		[ 9: 0]	LEDR;

// PS2 Ports
inout						PS2_CLK;
inout						PS2_DAT;

inout						PS2_CLK2;
inout						PS2_DAT2;

// Slider Switches
input			[ 9: 0]	SW;

// Video-In
input						TD_CLK27;
input			[ 7: 0]	TD_DATA;
input						TD_HS;
output					TD_RESET_N;
input						TD_VS;

// VGA
output		[ 7: 0]	VGA_B;
output					VGA_BLANK_N;
output					VGA_CLK;
output		[ 7: 0]	VGA_G;
output					VGA_HS;
output		[ 7: 0]	VGA_R;
output					VGA_SYNC_N;
output					VGA_VS;


//
//////////////////////////////////////
//// HPS Pins
//////////////////////////////////////
//	
//// DDR3 SDRAM
//output		[14: 0]	HPS_DDR3_ADDR;
//output		[ 2: 0]  HPS_DDR3_BA;
//output					HPS_DDR3_CAS_N;
//output					HPS_DDR3_CKE;
//output					HPS_DDR3_CK_N;
//output					HPS_DDR3_CK_P;
//output					HPS_DDR3_CS_N;
//output		[ 3: 0]	HPS_DDR3_DM;
//inout			[31: 0]	HPS_DDR3_DQ;
//inout			[ 3: 0]	HPS_DDR3_DQS_N;
//inout			[ 3: 0]	HPS_DDR3_DQS_P;
//output					HPS_DDR3_ODT;
//output					HPS_DDR3_RAS_N;
//output					HPS_DDR3_RESET_N;
//input						HPS_DDR3_RZQ;
//output					HPS_DDR3_WE_N;
//
//// Ethernet
//output					HPS_ENET_GTX_CLK;
//inout						HPS_ENET_INT_N;
//output					HPS_ENET_MDC;
//inout						HPS_ENET_MDIO;
//input						HPS_ENET_RX_CLK;
//input			[ 3: 0]	HPS_ENET_RX_DATA;
//input						HPS_ENET_RX_DV;
//output		[ 3: 0]	HPS_ENET_TX_DATA;
//output					HPS_ENET_TX_EN;
//
//// Flash
//inout			[ 3: 0]	HPS_FLASH_DATA;
//output					HPS_FLASH_DCLK;
//output					HPS_FLASH_NCSO;
//
//// Accelerometer
//inout						HPS_GSENSOR_INT;
//
//// General Purpose I/O
//inout			[ 1: 0]	HPS_GPIO;
//
//// I2C
//inout						HPS_I2C_CONTROL;
//inout						HPS_I2C1_SCLK;
//inout						HPS_I2C1_SDAT;
//inout						HPS_I2C2_SCLK;
//inout						HPS_I2C2_SDAT;
//
//// Pushbutton
//inout						HPS_KEY;
//
//// LED
//inout						HPS_LED;
//
//// SD Card
//output					HPS_SD_CLK;
//inout						HPS_SD_CMD;
//inout			[ 3: 0]	HPS_SD_DATA;
//
//// SPI
//output					HPS_SPIM_CLK;
//input						HPS_SPIM_MISO;
//output					HPS_SPIM_MOSI;
//inout						HPS_SPIM_SS;
//
//// UART
//input						HPS_UART_RX;
//output					HPS_UART_TX;
//
//// USB
//inout						HPS_CONV_USB_N;
//input						HPS_USB_CLKOUT;
//inout			[ 7: 0]	HPS_USB_DATA;
//input						HPS_USB_DIR;
//input						HPS_USB_NXT;
//output					HPS_USB_STP;

//=======================================================
//  REG/WIRE declarations
//=======================================================

// Dank VGA driver
reg CLOCK_25;
wire CLOCK_Camera;
wire CLOCK_VGA;
reg [15:0] VAL;

wire [15:0] VAL0;

wire [9:0] PIXEL_X;
wire [9:0] PIXEL_Y;

wire			[11: 0]	hex2_hex0;
wire			[11: 0]	hex5_hex3;

HexDigit Digit0(HEX0, hex2_hex0[3:0]);
HexDigit Digit1(HEX1, hex2_hex0[7:4]);
HexDigit Digit2(HEX2, hex2_hex0[11:8]);
HexDigit Digit3(HEX3, hex5_hex3[3:0]);
HexDigit Digit4(HEX4, hex5_hex3[7:4]);
HexDigit Digit5(HEX5, hex5_hex3[11:8]);


wire done;


VGA_Controller driver(
	.iCursor_RGB_EN(4'b0111),
	.oAddress(),
	.oCoord_X(PIXEL_X),
	.oCoord_Y(PIXEL_Y),
	.iRed((VAL[15:11]*527 + 23) >> 6),
	.iGreen((VAL[10:5]*259 + 33) >> 6),
	.iBlue((VAL[4:0]*527 + 23) >> 6),
	
	//	VGA Side
	.oVGA_R(VGA_R),
	.oVGA_G(VGA_G),
	.oVGA_B(VGA_B),
	.oVGA_H_SYNC(VGA_HS),
	.oVGA_V_SYNC(VGA_VS),
	.oVGA_SYNC(VGA_SYNC_N),
	.oVGA_BLANK(VGA_BLANK_N),
	
	//	Control Signal
	.iCLK(CLOCK_VGA),
	.iRST_N(KEY[1])	
);

// Breakout XCLK, PCLK, HREF, VSYNC for debugging
//assign GPIO_0[3:0] = GPIO_0[25:22];
//assign GPIO_1[3:0] = GPIO_1[25:22];
//assign GPIO_0[4] = CLOCK_Camera;
//assign GPIO_0[5] = CLOCK_VGA;
//assign GPIO_0[6] = VGA_HS;
//assign GPIO_0[7] = VGA_VS;
//assign GPIO_0[8] = CLOCK_50;

	clock_pll_0 pll_0 (
		.refclk   (CLOCK_50),                 //  refclk.clk
		.rst      (1'b0),          //   reset.reset
		.outclk_0 (CLOCK_Camera),    // outclk0.clk
		.outclk_1 (), // outclk1.clk
		.locked   ()                         //  locked.export
	);

		clock_pll_1 pll_1 (
		.refclk   (CLOCK_50),                 //  refclk.clk
		.rst      (1'b0),          //   reset.reset
		.outclk_0 (CLOCK_VGA),    // outclk0.clk
		.locked   ()                         //  locked.export
	);

	
reg [2:0] nextValue;
reg [9:0] changeOffsetx; 
reg [9:0] changeOffsety; 
reg pre;
wire [9:0] offset;
wire [9:0] offsety;
assign offset = 40 + changeOffsetx;
assign offsety = changeOffsety;
assign hex2_hex0 = offsety; //y
assign hex5_hex3 = offset; // x
parameter camRight = 320 + 87;
parameter camLeft = 320 - 87;
parameter camTop = 0;
parameter camBottom = 144;


always @(posedge CLOCK_VGA) begin 
	if(pre == 0 && !KEY[2]) begin
		changeOffsetx <= changeOffsetx + 1;
		pre <= 1;
	end
	if(pre == 0 && !KEY[0]) begin
		changeOffsety <= changeOffsety + 1;
		pre <= 1;
	end
	if(KEY[2] && KEY[0]) begin
			pre <= 0;
	end
end

always @(posedge CLOCK_VGA) begin
	if (PIXEL_X > cam0Left && PIXEL_X <= cam0Right && PIXEL_Y > cam0Top + offsety && PIXEL_Y <= cam0Bottom + offsety) begin
		nextValue <= 3'd0;
	end
	if 
		begin
		nextValue <= 3'd4;
	end


	if(nextValue == 3'd0) begin
		VAL <= VAL0;
		//VAL <= {5'b11111,6'b0,5'b0};
	end	
	if(nextValue == 3'd4) begin
		VAL <= {5'b0,6'b0,5'b0};
	end	
end



//assign Address = (PIXEL_X % (640 - 174)) + (PIXEL_Y % (480 - 144)) * 174;
wire [9:0] tempX0;
assign tempX0 = PIXEL_X - camLeft;
wire [9:0] tempY0;
assign tempY0 = PIXEL_Y - (camTop + offsety);
 assign GPIO_0[31] = CLOCK_Camera;
 assign GPIO_0[30] = CLOCK_VGA;



cam_buffer cam(
	.clk_24(CLOCK_Camera),
	.reset(~KEY[0]),
	.vsync(GPIO_0[11]),
	.href(GPIO_0[10]),
	.pclk(GPIO_0[9]),
	.xclk(GPIO_0[8]),
	.data(GPIO_0[7:0]),
	.cam_rst(GPIO_0[34]),
	.cam_pwdn(GPIO_0[35]),
	.rd_clk(CLOCK_VGA),
	.x_addr(tempX0),
	.y_addr(tempY0),
	.value(VAL0),
	.key(~KEY[3]),
	.frame_done(VGA_VS)
);




endmodule





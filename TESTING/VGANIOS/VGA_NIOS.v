module VGA_NIOS(

	//////////// CLOCK //////////
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,
	input 		          		CLOCK_50,

	//////////// LED //////////
	output		     [8:0]		LEDG,
	output		    [17:0]		LEDR,

	//////////// KEY //////////
	input 		     [3:0]		KEY,

	//////////// SEG7 //////////
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,
	output		     [6:0]		HEX6,
	output		     [6:0]		HEX7,
	
	//////////// SW //////////
	input 		    [17:0]		SW,

	//////////// RS232 //////////
	input 		          		UART_CTS,
	output		          		UART_RTS,
	input 		          		UART_RXD,
	output		          		UART_TXD,

	//////////// VGA //////////
	output		          		VGA_BLANK_N,
	output		     [7:0]		VGA_B,
	output		          		VGA_CLK,
	output		     [7:0]		VGA_G,
	output		          		VGA_HS,
	output		     [7:0]		VGA_R,
	output		          		VGA_SYNC_N,
	output		          		VGA_VS,

	//////////// GPIO, GPIO connect to D8M-GPIO //////////
	inout 		          		CAMERA_I2C_SCL,
	inout 		          		CAMERA_I2C_SDA,
	output		          		CAMERA_PWDN_n,
	output		          		MIPI_CS_n,
	inout 		          		MIPI_I2C_SCL,
	inout 		          		MIPI_I2C_SDA,
	output		          		MIPI_MCLK,
	input 		          		MIPI_PIXEL_CLK,
	input 		     [9:0]		MIPI_PIXEL_D,
	input 		          		MIPI_PIXEL_HS,
	input 		          		MIPI_PIXEL_VS,
	output		          		MIPI_REFCLK,
	output		          		MIPI_RESET_n
);

//=============================================================================
// REG/WIRE declarations
//=============================================================================
  wire        	AUTO_FOC ;
  wire        	READ_Request ;
  wire 	[7:0]	VGA_B_A;
  wire 	[7:0]	VGA_G_A;
  wire 	[7:0]	VGA_R_A;
  wire        	VGA_CLK_25M ;
  wire        	RESET_N  ; 
  wire  [7:0]	sCCD_R;
  wire  [7:0]	sCCD_G;
  wire  [7:0]	sCCD_B; 
  wire [15:0] 	H_Cont ; 
  wire [15:0] 	V_Cont ; 
  wire        	I2C_RELEASE ;  
  wire        	CAMERA_I2C_SCL_MIPI ; 
  wire        	CAMERA_I2C_SCL_AF ;
  wire        	CAMERA_MIPI_RELAESE ;
  wire        	MIPI_BRIDGE_RELEASE ;
  wire        	D8M_CK_HZ  ; 
  wire        	D8M_CK_HZ2 ; 
  wire        	D8M_CK_HZ3 ; 
  wire        	RESET_KEY ; 
  wire   [9:0]	MIPI_PIXEL_D_ ;
  wire        	MIPI_PIXEL_VS_; 
  wire        	MIPI_PIXEL_HS_;  
  
	wire        LUT_MIPI_PIXEL_HS;
	wire        LUT_MIPI_PIXEL_VS;
	wire [9:0]  LUT_MIPI_PIXEL_D  ;
	wire        MIPI_PIXEL_CLK_; 
//=======================================================
// Structural coding
//=======================================================

//--INPU MIPI-PIXEL-CLOCK DELAY
CLOCK_DELAY  del1(  .iCLK (MIPI_PIXEL_CLK),  .oCLK (MIPI_PIXEL_CLK_ ) );

//--D8M INPUT Gamma Correction              
 D8M_LUT  g_lut(
	.enable           (0) , // SW[0]            ),
	.PIXEL_CLK        (MIPI_PIXEL_CLK_   ),
	.MIPI_PIXEL_HS    (MIPI_PIXEL_HS    ),
	.MIPI_PIXEL_VS    (MIPI_PIXEL_VS    ),
	.MIPI_PIXEL_D     (MIPI_PIXEL_D     ),
	.NEW_MIPI_PIXEL_HS(LUT_MIPI_PIXEL_HS),
	.NEW_MIPI_PIXEL_VS(LUT_MIPI_PIXEL_VS),
	.NEW_MIPI_PIXEL_D (LUT_MIPI_PIXEL_D )
);

assign UART_RTS =0; 
assign UART_TXD =0; 
assign RESET_KEY      = KEY[0]; 

//----- RESET RELAY  --		
RESET_DELAY			u2	(	
							.iRST  ( RESET_KEY ),
                     .iCLK  ( CLOCK2_50 ),				
						   .oREADY( RESET_N)  
							
						);

assign MIPI_RESET_n   = RESET_N;
assign CAMERA_PWDN_n  = RESET_KEY; 
assign MIPI_CS_n      = 0; 

//------ CAMERA I2C COM BUS --------------------
assign I2C_RELEASE    = CAMERA_MIPI_RELAESE & MIPI_BRIDGE_RELEASE; 
assign CAMERA_I2C_SCL = ( I2C_RELEASE  )? CAMERA_I2C_SCL_AF  : CAMERA_I2C_SCL_MIPI ;   
 
//------ MIPI BRIDGE  I2C SETTING--------------- 
MIPI_BRIDGE_CAMERA_Config    cfin(
   .RESET_N           ( RESET_N  ), 
   .CLK_50            ( CLOCK2_50), 
   .MIPI_I2C_SCL      ( MIPI_I2C_SCL ), 
   .MIPI_I2C_SDA      ( MIPI_I2C_SDA ), 
   .MIPI_I2C_RELEASE  ( MIPI_BRIDGE_RELEASE ),  
   .CAMERA_I2C_SCL    ( CAMERA_I2C_SCL_MIPI ),
   .CAMERA_I2C_SDA    ( CAMERA_I2C_SDA ),
   .CAMERA_I2C_RELAESE( CAMERA_MIPI_RELAESE )
);

//-- Video PLL --- 
video_pll ref(
	   .inclk0    ( CLOCK2_50 ),
	   .areset       ( 1'b0 ),
	   .c0  ( MIPI_REFCLK )    //20Mhz
);
//--- D8M RAWDATA to RGB ---
D8M_SET   ccd (
	.RESET_SYS_N  ( RESET_N ),
   .CLOCK_50     ( CLOCK2_50      ),
	.CCD_DATA     ( LUT_MIPI_PIXEL_D [9:0]) ,
	.CCD_FVAL     ( LUT_MIPI_PIXEL_VS ), //60HZ
	.CCD_LVAL	  ( LUT_MIPI_PIXEL_HS ), // 
	.CCD_PIXCLK   ( MIPI_PIXEL_CLK_), //25MHZ
	.READ_EN      (READ_Request) , 	
   .VGA_CLK      ( VGA_CLK),
   .VGA_HS       ( VGA_HS ),
   .VGA_VS       ( VGA_VS ),	
	.X_Cont       ( H_Cont),  
   .Y_Cont       ( V_Cont),   
   .sCCD_R       ( sCCD_R ),
   .sCCD_G       ( sCCD_G ),
   .sCCD_B       ( sCCD_B )
);

// NIOS
wire [29:0] data;
assign data[29:20] = sCCD_R;
assign data[19:10] = sCCD_G;
assign data[9:0]	 = sCCD_B;



nios (
		.clk_clk       (CLOCK_50), //     clk.clk
		.reset_reset_n (1'b0), 		//   reset.reset_n
		.sram_DQ       (1'b1),     //    sram.DQ
		.sram_ADDR     (data),     //        .ADDR
		.sram_LB_N     (1'b1),     //        .LB_N
		.sram_UB_N     (1'b1),     //        .UB_N
		.sram_CE_N     (1'b1),     //        .CE_N
		.sram_OE_N     (1'b1),     //        .OE_N
		.sram_WE_N     (1'b1),     //        .WE_N
		.vga_out_CLK   (VGA_CLK),   // vga_out.CLK
		.vga_out_HS    (VGA_HS),    //        .HS
		.vga_out_VS    (VGA_VS),    //        .VS
		.vga_out_BLANK (VGA_BLANK_N), //        .BLANK
		.vga_out_SYNC  (VGA_SYNC_N),  //        .SYNC
		.vga_out_R     (VGA_R),     //.R
		.vga_out_G     (VGA_G),		 //.G
		.vga_out_B     (VGA_B)      //.B
	);


//--Frame Counter -- 
 FpsMonitor uFps2(
	  .clk50    ( CLOCK2_50 ),
	  .vs       ( VGA_VS    ),//LUT_MIPI_PIXEL_VS ), //60HZ
	  .fps      (  ),
	  .hex_fps_h( HEX1 ),
	  .hex_fps_l( HEX0 )
);

////----7-SEG OFF----
assign  HEX2 = 7'h7F;
assign  HEX3 = 7'h7F;
assign  HEX4 = 7'h7F;
assign  HEX5 = 7'h7F;
assign  HEX6 = 7'h7F;
assign  HEX7 = 7'h7F;

endmodule

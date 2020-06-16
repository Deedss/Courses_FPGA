

module VGA_Controller_trig(
	 input 		CLOCK_50,
    input [15:0] H_Cont,
    input [15:0] V_Cont,
    input		[7:0]	iRed,
    input		[7:0]	iGreen,
    input		[7:0]	iBlue,
    output		[7:0]	oVGA_R,
    output		[7:0]	oVGA_G,
    output		[7:0]	oVGA_B,
    output				oVGA_H_SYNC,
    output				oVGA_V_SYNC,
    output				oVGA_SYNC,
    output				oVGA_BLANK,
	 output 				READ_Request,
	 input		[17:0]SW,
    output		[17:0]LEDR,
    //	Control Signal
    input				   iCLK,
    input				   iRST_N,
    output              oVGA_CLOCK

);

parameter V_MARK =9  ; 
`include "VGA_Param.h"
//=============================================================================
// REG/WIRE declarations
//=============================================================================
wire		[7:0] nVGA_R;
wire		[7:0]	nVGA_G;
wire		[7:0]	nVGA_B;
wire		[9:0]	mVGA_R;
wire		[9:0]	mVGA_G;
wire		[9:0]	mVGA_B;
wire				mVGA_H_SYNC;
wire				mVGA_V_SYNC;
wire				mVGA_SYNC;
wire				mVGA_BLANK;
//=======================================================
// Structural coding
//=======================================================   
//assign mVGA_R 		= nVGA_R;
//assign mVGA_G		= nVGA_G;
//assign mVGA_B		= nVGA_B;
assign oVGA_R      = mVGA_R;
assign oVGA_G      = mVGA_G;
assign oVGA_B      = mVGA_B;
assign oVGA_SYNC   = mVGA_SYNC;
assign oVGA_H_SYNC = mVGA_H_SYNC;
assign oVGA_V_SYNC = mVGA_V_SYNC;	

assign	mVGA_SYNC  =	1'b0;
		
assign  oVGA_CLOCK	 = iCLK ; 
//assign  READ_Request   = mVGA_H_SYNC & mVGA_V_SYNC; 

assign	 READ_Request	= ((H_Cont > H_BLANK         && H_Cont<H_SYNC_TOTAL  )	&&
						        ( V_Cont> V_BLANK+V_MARK  && V_Cont<V_SYNC_TOTAL));
					
nios nios1(
	.clk_clk 			(CLOCK_50),   				// clk.clk
	.blue_in_port		(iBlue), 				// blue.in_port
	.blue_out_port		(nVGA_B),  				// .out_port
	.green_in_port		(iGreen), 				// green.in_port
	.green_out_port	(nVGA_G), 				// .out_port
	.red_in_port		(iRed), 					// red.in_port
	.red_out_port    	(nVGA_R),				// .out_port
	.sw_in_port			(SW[17:0]),				// SWITCHES
	.sw_out_port		(LEDR[17:0])			// LEDR
);								  
								  

////////////////////////////////////////////////////////

assign	oVGA_BLANK	=	~((H_Cont < H_BLANK ) || ( V_Cont < V_BLANK ));

assign	mVGA_R	=	(	H_Cont>=X_START 	&& H_Cont<X_START+H_SYNC_ACT &&
						    V_Cont>=Y_START	&& V_Cont<Y_START+V_SYNC_ACT )
						?	nVGA_R	:	0;
assign	mVGA_G	=	(	H_Cont>=X_START 	&& H_Cont<X_START+H_SYNC_ACT &&
						V_Cont>=Y_START 	&& V_Cont<Y_START+V_SYNC_ACT )
						?	nVGA_G	:	0;
assign	mVGA_B	=	(	H_Cont>=X_START 	&& H_Cont<X_START+H_SYNC_ACT &&
						V_Cont>=Y_START 	&& V_Cont<Y_START+V_SYNC_ACT )
						?	nVGA_B :	0;

				
assign mVGA_H_SYNC =	( ( H_Cont > (H_SYNC_FRONT ) )  &&  ( H_Cont <= (H_SYNC_CYC + H_SYNC_FRONT)))?0 :1 ; 
assign mVGA_V_SYNC =	( ( V_Cont > (V_SYNC_FRONT ) )  &&  ( V_Cont <= (V_SYNC_CYC + V_SYNC_FRONT)))?0 :1 ; 

endmodule

module SDC_Top (    
            input   CLOCK_50, 
            inout   SD_DAT, 
            inout   SD_CMD, 
            inout   SD_DAT3, 
            output  SD_CLOCK
        );
 
    sdc_sys0 u0 (
        .clk_clk            (CLOCK_50),
        .reset_reset_n      (1'b1),
        .sd_card_b_SD_dat   (SD_DAT),
        .sd_card_o_SD_clock (SD_CLOCK),
        .sd_card_b_SD_cmd   (SD_CMD),
        .sd_card_b_SD_dat3  (SD_DAT3)
    );
 
endmodule
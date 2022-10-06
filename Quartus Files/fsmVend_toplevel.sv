module fsmVend_toplevel(
	input logic key_CLK, CLK, RES, quarter, halfDollar, dollar
	output logic guffin, quarter, halfDollar, state
);

	logic CLK_clean, change;
	debouncer clean (.A_noisy(key_CLK), .CLK50M(CLK), .A(CLK_clean)); //verified
	
	//inputs:
	//dollar, halfDollar, quarter SW[2:0]
	//CLK KEY0
	//RES KEY1
	//Current State Output LEDR[S-1:0]
	//guffin output LEDR[9]
	//halfDollar output LEDR[8]
	//quarter output LEDR[7]
	//state output HEX3-5
	//change output HEX0-2
	
	//input -> 4:2 encoder
	encoder_42 encode (.enc1(quarter), .enc2(halfDollar), .enc3(dollar), .enc_out0( ), .enc_out1( ));
	//4:2 encoded -> nextState Logic
	
	//nextState Logic -> 4:8 decoder
	
	//4:8 decoder -> register
	
	//register -> output logic
	
	//register -> HEX logic
	
	//HEX logic -> 7 segments

endmodule

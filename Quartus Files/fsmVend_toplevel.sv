module fsmVend_toplevel(
	input logic key_CLK, CLK, RES, quarter_in, halfDollar_in, dollar_in,
	output logic guffin, quarter_out, halfDollar_out, state_high, state_low
);

	logic CLK_clean, change, encoded_input0, encoded_input1, dec_NS[0:8];
	debouncer clean (.A_noisy(key_CLK), .CLK50M(CLK), .A(CLK_clean));
	
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
	//encoder_42 encode (.enc1(quarter_in), .enc2(halfDollar_in), .enc3(dollar_in), .enc_out0(encoded_input0), .enc_out1(encoded_input1));
	//4:2 encoded -> nextState Logic
	
	//nextState Logic -> 4:8 decoder
	//decoder_48 decode (.dec0(), .dec1(), .dec2(), .dec3(), .dec4(), .dec_out0(dec_NS[0]), .dec_out1(dec_NS[1]), .dec_out2(dec_NS[2]), .dec_out3(dec_NS[3]), .dec_out4(dec_NS[4]), .dec_out5(dec_NS[5]), .dec_out6(dec_NS[6]));
	//4:8 decoder -> register
	//state_register state_reg (.CLK(CLK_clean), .D0(dec_NS[0]), .D1(dec_NS[1]), .D2(dec_NS[2]), .D3(dec_NS[3]), .D4(dec_NS[4]), .D5(dec_NS[5]), .D6(dec_NS[6]));
	//register -> output logic
	//guffinOut_logic output ();
	//register -> HEX logic STATE
	//statetoHex stateHex ();
	//register -> HEX logic CHANGE
	//changetoHex changeHex();
	//HEX logic -> 7 segment STATE
	//sev_seg dispState ();
	//HEX logic -> 7 segment CHANGE
	//sev_seg dispChange ();
	
endmodule

module fsmVend_toplevel(
	input logic key_CLK, CLK, RES, quarter_in, halfDollar_in, dollar_in,
	output logic guffin, quarter_out, halfDollar_out, state_high, state_low
);

	logic CLK_clean, change, encoded_input0, encoded_input1, dec_NS[0:8];
	debouncer clean (.A_noisy(key_CLK), .CLK50M(CLK), .A(CLK_clean));
	
	//input -> 4:2 encoder
	encoder_42 encode (.enc1(quarter_in), .enc2(halfDollar_in), .enc3(dollar_in), .enc_out0(encoded_input0), .enc_out1(encoded_input1));
	
	//4:2 encoded -> nextState Logic
	next_state nxtst (.encInput_X(enc1), .encInput_Y(enc2), .currState_0(encState_0), currState_1(encState_1), currState_2(encState_2));
	
	//nextState Logic -> 4:8 decoder
	decoder_48 decode (.dec0(nextState_0), .dec1(nextState_1), .dec2(nextState_2), .dec3(nextState_3), .dec_out0(dec_NS[0]), .dec_out1(dec_NS[1]), .dec_out2(dec_NS[2]), .dec_out3(dec_NS[3]), .dec_out4(dec_NS[4]), .dec_out5(dec_NS[5]), .dec_out6(dec_NS[6]));
	
	//4:8 decoder -> register
	state_register state_reg (.CLK(CLK_clean), .D0(dec_NS[0]), .D1(dec_NS[1]), .D2(dec_NS[2]), .D3(dec_NS[3]), .D4(dec_NS[4]), .D5(dec_NS[5]), .D6(dec_NS[6]));
	
	//register -> output logic
	//guffinOut_logic output ();

	//register -> HEX logic STATE & CHANGE
		//this function calls sev_seg internally
	statetoHex stateHex (.stateIn_0(state0), .stateIn_1(state1), .stateIn_2(state2), .stateIn_3(state3), .stateIn_4(state4), .stateIn_5(state5), .stateIn_6(state6));
	
endmodule

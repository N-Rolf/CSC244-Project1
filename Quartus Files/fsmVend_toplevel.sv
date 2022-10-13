module fsmVend_toplevel(
	input logic key_CLK, CLK, RES, quarter_in, halfDollar_in, dollar_in,
	output logic guffin, quarter_out, halfDollar_out, state_high, state_low,
	output logic hex0_a, hex0_b, hex0_c, hex0_d, hex0_e, hex0_f, hex0_g, hex0_dec,
				hex1_a, hex1_b, hex1_c, hex1_d, hex1_e, hex1_f, hex1_g, hex1_dec,
				hex2_a, hex2_b, hex2_c, hex2_d, hex2_e, hex2_f, hex2_g, hex2_dec,
				hex3_a, hex3_b, hex3_c, hex3_d, hex3_e, hex3_f, hex3_g, hex3_dec,
				hex4_a, hex4_b, hex4_c, hex4_d, hex4_e, hex4_f, hex4_g, hex4_dec,
				hex5_a, hex5_b, hex5_c, hex5_d, hex5_e, hex5_f, hex5_g, hex5_dec
);

	logic CLK_clean, change, encoded_input0, encoded_input1, dec_NS[0:8];
	debouncer clean (.A_noisy(key_CLK), .CLK50M(CLK), .A(CLK_clean));
	
	//input -> 4:2 encoder
	//encoder_42 encode (.enc1(quarter_in), .enc2(halfDollar_in), .enc3(dollar_in), .enc_out0(encoded_input0), .enc_out1(encoded_input1));
	
	//4:2 encoded -> nextState Logic
	//next_state nxtst (.encInput_X(enc1), .encInput_Y(enc2), .currState_0(encState_0), currState_1(encState_1), currState_2(encState_2));
	
	//nextState Logic -> 4:8 decoder
	//decoder_48 decode (.dec0(nextState_0), .dec1(nextState_1), .dec2(nextState_2), .dec3(nextState_3), .dec_out0(dec_NS[0]), .dec_out1(dec_NS[1]), .dec_out2(dec_NS[2]), .dec_out3(dec_NS[3]), .dec_out4(dec_NS[4]), .dec_out5(dec_NS[5]), .dec_out6(dec_NS[6]));
	
	//4:8 decoder -> register
	//state_register state_reg (.CLK(CLK_clean), .D0(dec_NS[0]), .D1(dec_NS[1]), .D2(dec_NS[2]), .D3(dec_NS[3]), .D4(dec_NS[4]), .D5(dec_NS[5]), .D6(dec_NS[6]));
	
	//register -> output logic
	//guffinOut_logic output ();

	//register -> HEX logic STATE & CHANGE
	logic hex5_0, hex5_1, hex5_2, hex5_3,
		 hex4_0, hex4_1, hex4_2, hex4_3,
		 hex3_0, hex3_1, hex3_2, hex3_3,
		 hex2_0, hex2_1, hex2_2, hex2_3,
		 hex1_0, hex1_1, hex1_2, hex1_3,
		 hex0_0, hex0_1, hex0_2, hex0_3;
	statetoHex stateHex (.stateIn_0(state0), .stateIn_1(state1), .stateIn_2(state2), .stateIn_3(state3),
						 .stateIn_4(state4), .stateIn_5(state5), .stateIn_6(state6),
						 .hex0_0(hex0_0), .hex0_1(hex0_1), .hex0_2(hex0_2), .hex0_3(hex0_3),
						 .hex1_0(hex1_0), .hex1_1(hex1_1), .hex1_2(hex1_2), .hex1_3(hex1_3),
						 .hex2_0(hex2_0), .hex2_1(hex2_1), .hex2_2(hex2_2), .hex2_3(hex2_3),
						 .hex3_0(hex3_0), .hex3_1(hex3_1), .hex3_2(hex3_2), .hex3_3(hex3_3),
						 .hex4_0(hex4_0), .hex4_1(hex4_1), .hex4_2(hex4_2), .hex4_3(hex4_3),
						 .hex5_0(hex5_0), .hex5_1(hex5_1), .hex5_2(hex5_2), .hex5_3(hex5_3),);
	
	//HEX display
	//sevv_seg hex0 ()

endmodule

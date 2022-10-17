module fsmVend_toplevel(
	input logic key_CLK, CLK, RES, quarter_in, halfDollar_in, dollar_in,
	output logic guffin_out, quarter_out, halfDollar_out, stateOut_0, stateOut_1, stateOut_3,
	output logic hex0_a, hex0_b, hex0_c, hex0_d, hex0_e, hex0_f, hex0_g, hex0_dec,
				hex1_a, hex1_b, hex1_c, hex1_d, hex1_e, hex1_f, hex1_g, hex1_dec,
				hex2_a, hex2_b, hex2_c, hex2_d, hex2_e, hex2_f, hex2_g, hex2_dec,
				hex3_a, hex3_b, hex3_c, hex3_d, hex3_e, hex3_f, hex3_g, hex3_dec,
				hex4_a, hex4_b, hex4_c, hex4_d, hex4_e, hex4_f, hex4_g, hex4_dec,
				hex5_a, hex5_b, hex5_c, hex5_d, hex5_e, hex5_f, hex5_g, hex5_dec
);
	//variables
	logic CLK_clean, encoded_input0, encoded_input1, dec_NS[0:8], state[0:6], state_a, state_b;

	//clock key debounce
	debouncer clean (.A_noisy(key_CLK), .CLK50M(CLK), .A(CLK_clean));
	
	//4:2 encoder (encodes user input to 2 bits)
	encoder_42 encode (.enc1(quarter_in), .enc2(halfDollar_in), .enc3(dollar_in),
					 .enc_out0(state_b), .enc_out1(state_a));
	
	//next state logic (takes 2 bit encoded user input and 4 bit current state)
	next_state nxtSt (.encInput_X(state_a), .encInput_Y(state_b),
					.currState_0(currState_0), .currState_1(currState_1), .currState_2(currState_2),
					.nextState_0(ns_0), .nextState_1(ns_1), .nextState_2(ns_2), .nextState_3(ns_3));
	
	//4:8 decoder (decodes 4 bit next state logic output)
	decoder_48 decode (.dec0(ns_0), .dec1(ns_1), .dec2(ns_2), .dec3(ns_3),
					.dec_out0(dec_NS[0]), .dec_out1(dec_NS[1]), .dec_out2(dec_NS[2]), .dec_out3(dec_NS[3]),
					.dec_out4(dec_NS[4]), .dec_out5(dec_NS[5]), .dec_out6(dec_NS[6]));
	
	//FSM memory (7 D-flipflop registers)
	state_register state_reg (.CLK(CLK_clean), .RES(RES), .data0(dec_NS[0]), .data1(dec_NS[1]), .data2(dec_NS[2]), .data3(dec_NS[3]), .data4(dec_NS[4]), .data5(dec_NS[5]), .data6(dec_NS[6]),
								.state0(state[0]), .state1(state[1]), .state2(state[2]), .state3(state[3]), .state4(state[4]), .state5(state[5]), .state6(state[6]));


	//8:4 encoder (encodes 7 states to 3 bit current state output)
	encoder_84 encCurState (.state0(state[0]), .state1(state[1]), .state2(state[2]), .state3(state[3]), .state4(state[4]), .state5(state[5]), .state6(state[6]),
							.encState_0(currState_0), .encState_1(currState_1), .encState_2(currState_2));

	//Current state output (000-110 corresponding to current active state)
	assign stateOut_0 = currState_0;
	assign stateOut_1 = currState_1;
	assign stateOut_2 = currState_2;
	
	//LED outputs 
	guffinOut_logic led_output (.cState_0(state[0]), .cState_1(state[1]), .cState_2(state[2]), .cState_3(state[3]),
							.cState_4(state[4]), .cState_5(state[5]), .cState_6(state[6]), .guffin(guffin_out),
							.quarter(quarter_out), .halfDollar(halfDollar_out));  

	//HEX logic STATE & CHANGE (7 states to 4 bit hex decoder logic)
	logic hex5_0, hex5_1, hex5_2, hex5_3,
		 hex4_0, hex4_1, hex4_2, hex4_3,
		 hex3_0, hex3_1, hex3_2, hex3_3,
		 hex2_0, hex2_1, hex2_2, hex2_3,
		 hex1_0, hex1_1, hex1_2, hex1_3,
		 hex0_0, hex0_1, hex0_2, hex0_3;
	assign hex0_dec = 1;
	assign hex1_dec = 1;
	assign hex3_dec = 1;
	assign hex4_dec = 1;

	statetoHex stateHex (.stateIn_0(state[0]), .stateIn_1(state[1]), .stateIn_2(state[2]), .stateIn_3(state[3]),
						 .stateIn_4(state[4]), .stateIn_5(state[5]), .stateIn_6(state[6]),
						 .hex0_0(hex0_0), .hex0_1(hex0_1), .hex0_2(hex0_2), .hex0_3(hex0_3),
						 .hex1_0(hex1_0), .hex1_1(hex1_1), .hex1_2(hex1_2), .hex1_3(hex1_3),
						 .hex2_0(hex2_0), .hex2_1(hex2_1), .hex2_2(hex2_2), .hex2_3(hex2_3),
						 .hex3_0(hex3_0), .hex3_1(hex3_1), .hex3_2(hex3_2), .hex3_3(hex3_3),
						 .hex4_0(hex4_0), .hex4_1(hex4_1), .hex4_2(hex4_2), .hex4_3(hex4_3),
						 .hex5_0(hex5_0), .hex5_1(hex5_1), .hex5_2(hex5_2), .hex5_3(hex5_3));
	

	//HEX display (decoder for each 7-segment display)
	// 0-2 change due
	sev_seg hex0 (.hexIn_0(hex0_0), .hexIn_1(hex0_1), .hexIn_2(hex0_2), .hexIn_3(hex0_3),
				.a(hex0_a), .b(hex0_b), .c(hex0_c), .d(hex0_d), .e(hex0_e), .f(hex0_f), .g(hex0_g));
	
	sev_seg hex1 (.hexIn_0(hex1_0), .hexIn_1(hex1_1), .hexIn_2(hex1_2), .hexIn_3(hex1_3),
				.a(hex1_a), .b(hex1_b), .c(hex1_c), .d(hex1_d), .e(hex1_e), .f(hex1_f), .g(hex1_g));
	
	sev_seg hex2 (.hexIn_0(hex2_0), .hexIn_1(hex2_1), .hexIn_2(hex2_2), .hexIn_3(hex2_3),
				.a(hex2_a), .b(hex2_b), .c(hex2_c), .d(hex2_d), .e(hex2_e), .f(hex2_f), .g(hex2_g), .dec(hex2_dec));
	//3-5 current $ in machine
	sev_seg hex3 (.hexIn_0(hex3_0), .hexIn_1(hex3_1), .hexIn_2(hex3_2), .hexIn_3(hex3_3),
				.a(hex3_a), .b(hex3_b), .c(hex3_c), .d(hex3_d), .e(hex3_e), .f(hex3_f), .g(hex3_g));
	
	sev_seg hex4 (.hexIn_0(hex4_0), .hexIn_1(hex4_1), .hexIn_2(hex4_2), .hexIn_3(hex4_3),
				.a(hex4_a), .b(hex4_b), .c(hex4_c), .d(hex4_d), .e(hex4_e), .f(hex4_f), .g(hex4_g));
	
	sev_seg hex5 (.hexIn_0(hex5_0), .hexIn_1(hex5_1), .hexIn_2(hex5_2), .hexIn_3(hex5_3),
				.a(hex5_a), .b(hex5_b), .c(hex5_c), .d(hex5_d), .e(hex5_e), .f(hex5_f), .g(hex5_g), .dec(hex5_dec));


endmodule

module statetoHex (
	input logic stateIn_0, stateIn_1, stateIn_2, stateIn_3, stateIn_4, stateIn_5, stateIn_6,
	output logic hex5_0, hex5_1, hex5_2, hex5_3,
				 hex4_0, hex4_1, hex4_2, hex4_3,
				 hex3_0, hex3_1, hex3_2, hex3_3,
				 hex2_0, hex2_1, hex2_2, hex2_3,
				 hex1_0, hex1_1, hex1_2, hex1_3,
				 hex0_0, hex0_1, hex0_2, hex0_3
);

	assign hex5_0 = 0;
	assign hex5_1 = 0;
	assign hex5_2 = 0;
	or (hex5_3, stateIn_4, stateIn_5, stateIn_6); 
	//sev_seg hex5 (.hexIn_0(hex5_0), .hexIn_1(hex5_1), .hexIn_2(hex5_2), .hexIn_3(hex5_3));
	
	assign hex4_0 = 0;
	or (hex4_1, stateIn_2, stateIn_3, stateIn_6); 
	or (hex4_2, stateIn_1, stateIn_3, stateIn_5);
	or (hex4_3, stateIn_2, stateIn_3, stateIn_6); 
	//sev_seg hex4 (.hexIn_0(hex4_0), .hexIn_1(hex4_1), .hexIn_2(hex4_2), .hexIn_3(hex4_3));

	assign hex3_0 = 0;
	or (hex3_1, stateIn_1, stateIn_3, stateIn_5); 
	assign hex3_2 = 0;
	or (hex3_3, stateIn_1, stateIn_3, stateIn_5); 
	//sev_seg hex3 (.hexIn_0(hex3_0), .hexIn_1(hex3_1), .hexIn_2(hex3_2), .hexIn_3(hex3_3));

	assign hex2_0 = 0;
	assign hex2_1 = 0;
	assign hex2_2 = 0;
	assign hex2_3 = 0;
	//sev_seg hex2 (.hexIn_0(hex2_0), .hexIn_1(hex2_1), .hexIn_2(hex2_2), .hexIn_3(hex2_3));

	assign hex1_0 = 0;
	or (hex1_1, stateIn_5, stateIn_6);
	or (hex1_2, stateIn_4, stateIn_6);
	or (hex1_3, stateIn_5, stateIn_6);
	//sev_seg hex1 (.hexIn_0(hex1_0), .hexIn_1(hex1_1), .hexIn_2(hex1_2), .hexIn_3(hex1_3));
	
	assign hex0_0 = 0;
	or (hex0_1, stateIn_4, stateIn_6);
	assign hex0_2 = 0;
	or (hex0_3, stateIn_4, stateIn_6);
	//sev_seg hex0 (.hexIn_0(hex0_0), .hexIn_1(hex0_1), .hexIn_2(hex0_2), .hexIn_3(hex0_3));

endmodule
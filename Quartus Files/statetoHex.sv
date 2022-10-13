module statetoHex (
	input logic stateIn_0, stateIn_1, stateIn_2, stateIn_3, stateIn_4, stateIn_5, stateIn_6,
	output logic hex5_0, hex5_1, hex5_2, hex5_3,
				 hex4_0, hex4_1, hex4_2, hex4_3,
				 hex3_0, hex3_1, hex3_2, hex3_3,
				 hex2_0, hex2_1, hex2_2, hex2_3,
				 hex1_0, hex1_1, hex1_2, hex1_3,
				 hex0_0, hex0_1, hex0_2, hex0_3
);

	assign hex5_3 = 0;
	assign hex5_0 = 0;
	assign hex5_1 = 0;
	or (hex5_2, stateIn_4, stateIn_5, stateIn_6); //the hex order here is cursed, don't touch
	
	assign hex4_3 = 0;
	or (hex4_2, stateIn_2, stateIn_3, stateIn_6); 
	or (hex4_1, stateIn_1, stateIn_3, stateIn_5);
	or (hex4_0, stateIn_2, stateIn_3, stateIn_6); 

	assign hex3_3 = 0;
	or (hex3_2, stateIn_1, stateIn_3, stateIn_5); 
	assign hex3_1 = 0;
	or (hex3_0, stateIn_1, stateIn_3, stateIn_5); 

	assign hex2_3 = 0;
	assign hex2_2 = 0;
	assign hex2_1 = 0;
	assign hex2_0 = 0;

	assign hex1_3 = 0;
	or (hex1_2, stateIn_5, stateIn_6);
	or (hex1_1, stateIn_4, stateIn_6);
	or (hex1_0, stateIn_5, stateIn_6);
	
	assign hex0_3 = 0;
	or (hex0_2, stateIn_4, stateIn_6);
	assign hex0_1 = 0;
	or (hex0_0, stateIn_4, stateIn_6);

endmodule
module d_ff(
	input logic dff_D, dff_CLK,
	output logic dff_Q, dff_Qn, dff_debug
);

	logic N1, N2;
	
	not (dff_nCLK, dff_CLK);
	
	d_latch dlatchA(.dD(dff_D), .dCLK(dff_nCLK), .dQ(N1), .dQn(N2)); //output to N1
	or (debug, N1, 0);
	d_latch dlatchB(.dD(N1), .dCLK(dff_CLK), .dQ(dff_Q), .dQn(dff_Qn));  //output to Q
	
endmodule
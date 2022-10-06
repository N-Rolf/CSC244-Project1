module state_register (
	input logic CLK, D0, D1, D2, D3, D4, D5, D6,
	output logic Q0, Q1, Q2, Q3, Q4, Q5, Q6
);
	
	//S0 - $0.00
	d_ff S0 (.dff_D(D0), .dff_CLK(CLK), .dff_Q(Q0));
	//S1 - $0.25
	d_ff S1 (.dff_D(D1), .dff_CLK(CLK), .dff_Q(Q1));
	//S2 - $0.50
	d_ff S2 (.dff_D(D2), .dff_CLK(CLK), .dff_Q(Q2));
	//S3 - $0.75
	d_ff S3 (.dff_D(D3), .dff_CLK(CLK), .dff_Q(Q3));
	//S4 - $1.00
	d_ff S4 (.dff_D(D4), .dff_CLK(CLK), .dff_Q(Q4));
	//S5 - $1.25
	d_ff S5 (.dff_D(D5), .dff_CLK(CLK), .dff_Q(Q5));
	//S6 - $1.50
	d_ff S6 (.dff_D(D6), .dff_CLK(CLK), .dff_Q(Q6));
	
	
endmodule
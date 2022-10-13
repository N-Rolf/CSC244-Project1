module state_register (
	input logic CLK, data0, data1, data2, data3, data4, data5, data6,
	output logic state0, state1, state2, state3, state4, state5, state6
);
	
	//S0 - $0.00
	d_ff S0 (.dff_D(data0), .dff_CLK(CLK), .dff_Q(state0));
	//S1 - $0.25
	d_ff S1 (.dff_D(data1), .dff_CLK(CLK), .dff_Q(state1));
	//S2 - $0.50
	d_ff S2 (.dff_D(data2), .dff_CLK(CLK), .dff_Q(state2));
	//S3 - $0.75
	d_ff S3 (.dff_D(data3), .dff_CLK(CLK), .dff_Q(state3));
	//S4 - $1.00
	d_ff S4 (.dff_D(data4), .dff_CLK(CLK), .dff_Q(state4));
	//S5 - $1.25
	d_ff S5 (.dff_D(data5), .dff_CLK(CLK), .dff_Q(state5));
	//S6 - $1.50
	d_ff S6 (.dff_D(data6), .dff_CLK(CLK), .dff_Q(state6));
	
	
endmodule
module state_register (
	input logic CLK, RES, data0, data1, data2, data3, data4, data5, data6,
	output logic state0, state1, state2, state3, state4, state5, state6
);
	
	//S0 - $0.00
	D_FF_neg S0 (.D(data0), .CLKb(CLK), .RSTb(RES), .Q(state0));
	//S1 - $0.25
	D_FF_neg S1 (.D(data1), .CLKb(CLK), .RSTb(RES), .Q(state1));
	//S2 - $0.50
	D_FF_neg S2 (.D(data2), .CLKb(CLK), .RSTb(RES), .Q(state2));
	//S3 - $0.75
	D_FF_neg S3 (.D(data3), .CLKb(CLK), .RSTb(RES), .Q(state3));
	//S4 - $1.00
	D_FF_neg S4 (.D(data4), .CLKb(CLK), .RSTb(RES), .Q(state4));
	//S5 - $1.25
	D_FF_neg S5 (.D(data5), .CLKb(CLK), .RSTb(RES), .Q(state5));
	//S6 - $1.50
	D_FF_neg S6 (.D(data6), .CLKb(CLK), .RSTb(RES), .Q(state6));
	
	
endmodule
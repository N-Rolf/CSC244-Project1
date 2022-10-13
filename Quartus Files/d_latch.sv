module d_latch(
	input logic dD, dCLK,
	output logic dQ, dQn
);
	
	logic dR, dS;
	not (ndD, dD);
	
	and (dR, ndD, dCLK);
	and (dS, dD, dCLK);
	
	sr_latch SRL(.srR(dR), .srS(dS), .srQ(dQ), .srQn(dQn));
	
endmodule
module sr_latch(
	input logic srR, srS,
	output logic srQ, srQn
);

	//N1
	nor (srQ, srR, srQn);
	//N2
	nor (srQn, srS, srQ);
	
endmodule
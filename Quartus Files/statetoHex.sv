module statetoHex (
	input logic S0, S1, S2, S3, S4, S5, S6,
	output logic H0, ... H11
);

	or (H3, S4, S5, S6); //7
	or (H5, S2, S3, S6); //5
	or (H6, S1, S3, S5); //2
	or (H7, S2, S3, S6); //5
	or (H9, S1, S3, S5); //2
	or (H11, S1, S3, S5); //2

endmodule
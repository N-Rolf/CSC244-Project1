module encoder_42 (
	input logic enc0, enc1, enc2, enc3,
	output logic enc_out0, enc_out1
);
	
	and (enc_out0, enc1, enc3);
	and (enc_out1, enc2, enc3);
	
endmodule
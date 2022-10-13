module decoder_48 (
	input logic dec0, dec1, dec2, dec3, dec4,
	output logic dec_out0, dec_out1, dec_out2, dec_out3, dec_out4, dec_out5, dec_out6, dec_out7
);

	and (dec_out0, ~dec3, ~dec2, ~dec1, ~dec0); 	//0000
	and (dec_out1, ~dec3, ~dec2, ~dec1, dec0);		//0001
	and (dec_out2, ~dec3, ~dec2, dec1, ~dec0);		//0010
	and (dec_out3, ~dec3, ~dec2, dec1, dec0);		//0011
	and (dec_out4, ~dec3, dec2, ~dec1, ~dec0);		//0100
	and (dec_out5, ~dec3, dec2, ~dec1, dec0);		//0101
	and (dec_out6, ~dec3, dec2, dec1, ~dec0);		//0110
	and (dec_out7, ~dec3, dec2, dec1, dec0);		//0111
	and (dec_out8, dec3, ~dec2, ~dec1, ~dec0);		//1000
	
endmodule
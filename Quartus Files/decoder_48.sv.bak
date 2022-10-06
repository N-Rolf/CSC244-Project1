module decoder_48 (
	input logic dec0, dec1, dec2, dec3, dec4,
	output logic dec_out0, dec_out1, dec_out2, dec_out3, dec_out4, dec_out5, dec_out6, dec_out7
);

	not (ndec0, dec0);
	not (ndec1, dec1);
	not (ndec2, dec2);
	not (ndec3, dec3);

	and (dec_out0, ndec3, ndec2, ndec1, ndec0); 	//0000
	and (dec_out1, ndec3, ndec2, ndec1, dec0);		//0001
	and (dec_out2, ndec3, ndec2, dec1, ndec0);		//0010
	and (dec_out3, ndec3, ndec2, dec1, dec0);		//0011
	and (dec_out4, ndec3, dec2, ndec1, ndec0);		//0100
	and (dec_out5, ndec3, dec2, ndec1, dec0);		//0101
	and (dec_out6, ndec3, dec2, dec1, ndec0);		//0110
	and (dec_out7, ndec3, dec2, dec1, dec0);		//0111
	and (dec_out8, dec3, ndec2, ndec1, ndec0);		//1000
	
endmodule
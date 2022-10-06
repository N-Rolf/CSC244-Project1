module sev_seg(
	input logic w0,w1,w2,w3,
	output a,b,c,d,e,f,g,dec
);
	//variables
	logic [15:0]y;
	logic nw0, nw1, nw2, nw3;
	not(nw0, w0);
	not(nw1, w1);
	not(nw2, w2);
	not(nw3, w3);

	//decoder block a
	and(y[0],nw3,nw0,nw1,nw2);		//0000 
	and(y[1],nw3,nw0,nw1,w2);		//0001 
	and(y[2],nw3,nw0,w1,nw2);		//0010 
	and(y[3],nw3,nw0,w1,w2);		//0011 
	and(y[4],nw3,w0,nw1,nw2);		//0100 
	and(y[5],nw3,w0,nw1,w2);		//0101 
	and(y[6],nw3,w0,w1,nw2);		//0110 
	and(y[7],nw3,w0,w1,w2);			//0111 
	and(y[8],w3,nw0,nw1,nw2);		//1000 
	and(y[9],w3,nw0,nw1,w2);		//1001 
	and(y[10],w3,nw0,w1,nw2);		//1010
	and(y[11],w3,nw0,w1,w2);		//1011
	and(y[12],w3,w0,nw1,nw2);		//1100
	and(y[13],w3,w0,nw1,w2);		//1101
	and(y[14],w3,w0,w1,nw2);		//1110
	and(y[15],w3,w0,w1,w2);			//1111

	nor(a, y[0],y[2],y[3],y[5],y[6],y[7],y[8],y[9],y[10],y[12],y[14],y[15]); 	    //a segment
	nor(b, y[0],y[1],y[2],y[3],y[4],y[7],y[8],y[9],y[10],y[13]);				 	    //b segment
	nor(c, y[0],y[1],y[3],y[4],y[5],y[6],y[7],y[8],y[9],y[10],y[11],y[13]);        //c segment
	nor(d, y[0],y[2],y[3],y[5],y[6],y[8],y[11],y[12],y[13],y[14]);				       //d segment
	nor(e, y[0],y[2],y[6],y[8],y[10],y[11],y[12],y[13],y[14],y[15]);			       //e segment
	nor(f, y[0],y[4],y[5],y[6],y[8],y[9],y[10],y[11],y[12],y[14],y[15]);		 		 //f segment
	nor(g, y[2],y[3],y[4],y[5],y[6],y[8],y[9],y[10],y[11],y[13],y[14],y[15]);		 //g segment
	and(dec, dec, 0);
	
endmodule
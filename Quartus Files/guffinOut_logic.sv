module guffinOut_logic (
	output logic Macguffin0, halfDollar0, Quarter0,
	output logic [7:0] Hex0, Hex1, Hex2, Hex3, Hex4, Hex5,
	output logic [1:0]currentstate
);

logic Y0, Y1;
logic SnextState1, SnextState2, SnextState3, s1, s2, s3;
logic CLKbDebounced, RESDebounced;

debouncer clkdeb(.A_noisy(CLKb), .CLK50M(CLK50M), .A(CLKbDebounced));
debouncer resdeb(.A_noisy(RES), .CLK50M(CLK50M), .A(RESDebounced));

assign SnextState1 = ((~s1 & s2 & ~() & H) | (~s1 & () & ~H & ~Q) | (s1 & ~s2 & ~s3 & ~()) );
assign SnextState2 = ((~s1 & ~() & s2 & ~H) | (~s1 & ~() & s3 & Q) | (~s1 & ~() & ~s2 & H) | (~s1 &s2 & ()) | (s1 & ~Q & H) );
assign SnextState3 = ((~s1 & ~() & ~s3 & Q) | (~s1 & ~() & s3 & ~Q) | (s1 & () & s3) | (s1 & ~() & Q) );

D_FF_neg S2FF(.D(SnextState1), .CLKb(CLKbDebounced), .RSTb(RESDebounced), .Q(s1));
D_FF_neg S1FF(.D(SnextState1), .CLKb(CLKbDebounced), .RSTb(RESDebounced), .Q(s2));
D_FF_neg S0FF(.D(SnextState1), .CLKb(CLKbDebounced), .RSTb(RESDebounced), .Q(s3));

assign Macguffin0 = ((s1 & ~s2 & ~s3) | (~s1 & s2 & s3) | (s` & ~s2 & s3) | (~s1 & s2 & s3) | (s1 & s2 & ~s3));
assign halfDollar0 = ((s1 & s2 & ~s3));
assign Quarter0 = ((s1 & ~s2 & ~s3));
assign currentState[1] = (s2);
assign currentState[0] = (s3);

seven_seg change1 (.E(1'b0), .A(1'b0), .B(1'b0), C(1'b0), .dec(1'b0), .Y(Hex2));

endmodule
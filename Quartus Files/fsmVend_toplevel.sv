module fsmVend_toplevel(
	input logic key_CLK, CLK,
	output logic led_0 //temp output
);

	logic A_clean;
	debouncer clean (.A_noisy(key_CLK), .CLK50M(CLK), .A(A_clean)); //verified
	

endmodule

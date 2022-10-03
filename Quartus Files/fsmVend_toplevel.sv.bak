module ff_toplevel(
	input logic switch0, switch1, switch_CLK, key_CLK, CLK,
	output logic led_Q, led_Qn, led_test
);

	logic A_clean;
	debouncer clean (.A_noisy(key_CLK), .CLK50M(CLK), .A(A_clean)); //verified
	//or (led_test, A_clean, 0); //debug
	
	//sr_latch srlatchA (.srR(switch0), .srS(switch1), .srQ(led_Q), .srQn(led_Qn)); //verified
	//d_latch dlatchA (.dD(switch0), .dCLK(switch_CLK), .dQ(led_Q), .dQn(led_Qn)); //verified
	
	
	d_ff d_flipflop (.dD(switch0), .dCLK(A_clean), .dQ(led_Q), .dQn(led_Qn));
	
	
	//t_ff T_flipflop (
	//jk_ff jk_flipflop (
	

endmodule

//example module call
//demorgansNAND in:(A,B) out:(X,Y)
//demorgansNAND dmNAND(.A(switch1), .B(switch0), .X(led3), .Y(led2));
//[called module] [function name (can be anything)] (.[pointer to called mod input][local variable]....
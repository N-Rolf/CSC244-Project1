module guffinOut_logic (
	input logic cState_0, cState_1, cState_2, cState_3, cState_4, cState_5, cState_6,
    output logic guffin, halfDollar, quarter
);

//if state => 1.00, true
or (guffin, cState_3, cState_4, cState_5, cState_6);
//if state == 1.00, 1.50, true
or (quarter, cState_4, cState_6);
//if state == 1.25, 1.50, true
or (halfDollar, cState_5, cState_6);

endmodule
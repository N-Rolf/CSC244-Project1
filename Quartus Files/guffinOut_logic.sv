module guffinOut_logic (
	input logic cState_0, cState_1, cState_2, cState_3, cState_4, cState_5, cState_6,
    output logic guffin, halfDollar, quarter
);

or (guffin, cState_3, cState_4, cState_5, cState_6);
or (quarter, cState_4, cState_6);
or (halfDollar, cState_5, cState_6);

endmodule
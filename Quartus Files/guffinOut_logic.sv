module guffinOut_logic (
	input logic cState_0, cState_1, cState_2, cState_3, cState_4, cState_5, cState_6,
    output logic guffin, halfDollar, quarter, stateOut_0, stateOut_1
);

//if state == >= 2 
    //guffin == 1

//if state == 3
    //quarter == 1
//if state == 4
    //halfDollar == 1
//if state == 5
    //quarter == 1
    //halfDollar == 1
//if state == 6
    //halfDollar == 1

//current state 
    //if in .25 state = 01
    //if in .50 state = 10
    //if in both state == 11

or (guffin, cState_2, cState_3, cState_4, cState_5, cState_6);
or (quarter, cState_3, cState_5);
or (halfDollar, cState_4, cState_5, cState_6);

or (stateOut_0, cState_3, cState_5);
or (stateOut_1, cState_4, cState_5, cState_6);

endmodule
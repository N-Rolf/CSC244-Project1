module next_state(
    input logic encInput_X, encInput_Y, currState_0, currState_1, currState_2,
    output logic nextState_0, nextState_1, nextState_2, nextState_3
);

    //Q0
    and (and0_1, ~encInput_Y, ~currState_2, ~currState_1, currState_0);
    and (and0_2, ~encInput_X, encInput_Y, ~currState_2, ~currState_0);
    and (and0_3, encInput_X, ~currState_2, currState_1, ~currState_0);
    or (nextState_0, and0_1, and0_2, and0_3);

    //Q1
    and (and1_1, ~encInput_X, ~currState_2, currState_1, ~currState_0);
    and (and1_2, encInput_Y, ~currState_2, ~currState_1, currState_0);
    and (and1_3, encInput_X, ~encInput_Y, ~currState_2, ~currState_1);
    and (and1_4, encInput_Y, ~currState_2, currState_1, ~currState_0);
    or (nextState_1, and1_1, and1_2, and1_3, and1_4);

    //Q2
    and (and2_1, encInput_X, ~currState_2, currState_1, currState_0);
    and (and2_2, encInput_X, encInput_Y, ~currState_2, ~currState_1);
    or (nextState_2, and2_1, and2_2);

    //Q3
    assign nextState_3 = 0;

endmodule
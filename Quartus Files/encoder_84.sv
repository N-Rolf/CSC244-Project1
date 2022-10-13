module encoder_84 (
    input logic state0, state1, state2, state3, state4, state5, state6,
    output logic encState_0, encState_1, encState_2
);

    or (encState_0, state1, state3, state5);
    or (encState_1, state6, state3, state2);
    or (encState_2, state4, state5, state6);

endmodule
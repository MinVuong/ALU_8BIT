module shift_right_8bit(
    input logic [7:0] a,
    input logic [3:0] b,
    output logic [7:0] c_o
);

    always_comb begin : shift_right
        case (b)
            4'd0: c_o = a;
            4'd1: c_o = {1'b0, a[7:1]};
            4'd2: c_o = {2'b0, a[7:2]};
            4'd3: c_o = {3'b0, a[7:3]};
            4'd4: c_o = {4'b0, a[7:4]};
            4'd5: c_o = {5'b0, a[7:5]};
            4'd6: c_o = {6'b0, a[7:6]};
            4'd7: c_o = {7'b0, a[7]};
            4'd8: c_o = 8'b0;
            default: c_o = 8'b0;
        endcase
    end : shift_right

endmodule

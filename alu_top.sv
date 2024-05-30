
module alu_top(
	input logic clk,
	input logic rst_n,
	input logic [2:0] op,
	input logic [7:0] a,
	input logic [7:0] b,
	output logic [7:0] result,
	output logic [3:0] alu_flag,
	output logic carry
	);

	logic carry_d;
	logic [3:0] alu_flag_d;
	logic [7:0] result_d;
	logic carry_a_w, carry_s_w;
	logic [7:0] add_w, sub_w, and_w, or_w, xor_w, not_w, shift_right_w, shift_left_w;
	
	adder_8bit A0(a, b, add_w, carry_a_w);
	sub_8bit S0(a, b, sub_w, carry_s_w);
	and_8bit A1(a, b, and_w);
	or_8bit O0(a, b, or_w);
	not_8bit N0(a, not_w);
	shift_right_8bit SR(a, b, shift_right_w);
	shift_left_8bit SL(a, b, shift_left_w);


	logic [7:0] a_out;

 
	always_comb begin : alu_top
		unique case (op)
			3'b000: {carry_d, result_d} = {carry_a_w, add_w};
			3'b001: {carry_d, result_d} = {carry_s_w, sub_w};
			3'b010: {carry_d, result_d} = {1'b0, shift_left_w};
			3'b011: {carry_d, result_d} = {1'b0, shift_right_w};
			3'b100: {carry_d, result_d} = {1'b0, and_w};
			3'b101: {carry_d, result_d} = {1'b0, or_w};
			3'b110: {carry_d, result_d} = {1'b0, not_w};
			3'b111: {carry_d, result_d} = {1'b0, a};
			
			
			
			default: {carry_d, result_d} = 9'b0;
		endcase
		alu_flag_d[3] = (result_d[7]==1'b1)?1'b1:1'b0; // Negative flag (N)
        	alu_flag_d[2] = (result_d == 8'b0)?1'b1:1'b0; // Zero flag (Z)
       		alu_flag_d[1] = carry_d; // Carry flag (C)	
        	alu_flag_d[0] = (op == 3'b000 || op == 3'b001) ? (a[7] ^ b[7] ^ carry_a_w) : 1'b0; // Overflow flag (V)
	end : alu_top
	
	always_ff @(posedge clk, negedge rst_n) begin
		if (!rst_n) begin
			     {carry, result} <= 9'b0;
				alu_flag<=4'b0;
			    
		end
		else begin
		{carry, result} <= {carry_d, result_d};
		alu_flag<=alu_flag_d;
		 
	end
end
	
endmodule

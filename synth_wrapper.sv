module synth_wrapper(
	input wire clk,
	input wire rst_n,
	input wire [2:0] op,
	input wire [7:0] a,
	input wire [7:0] b,
	output reg [7:0] result,
	output reg [3:0] alu_flag,
	output reg carry
	);

	reg [2:0] op_reg;
	reg [7:0]  a_reg, b_reg;
	reg [7:0] result_reg;
	reg [3:0] alu_flag_reg;
	reg carry_reg;
	
	always @(posedge clk, negedge rst_n) begin
		if (!rst_n) begin
			a_reg <= 8'b00000000;
			b_reg <= 8'b00000000;
			op_reg <= 3'b000;
			result <= 8'b00000000;
			alu_flag <= 4'b0000;
			carry <= 1'b0;
			
		end
		else begin
			a_reg <= a;
			b_reg <= b;
			op_reg <= op;
			result <= result_reg;
			alu_flag<=alu_flag_reg;
			carry <= carry_reg;
			
		end
	end
	
	alu_top ALU0(clk, rst_n, op_reg, a_reg, b_reg, result_reg, alu_flag_reg, carry_reg );
	
endmodule

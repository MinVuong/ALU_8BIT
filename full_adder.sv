module full_adder(
	input logic a,
	input logic b,
	input logic c_i,
	output logic s,
	output logic c_o
	);

	assign s = a ^ b ^ c_i;
	assign c_o = (a & b) | (a & c_i) | (b & c_i);

endmodule

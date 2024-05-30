module full_sub(
	input logic a,
	input logic b,
	input logic c_i,
	output logic d_o,
	output logic b_o
	);

	assign d_o = a ^ b ^ c_i;
	assign b_o = ((~a) & (b ^ c_i)) | (b & c_i);
	
endmodule

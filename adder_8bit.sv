module adder_8bit(
	input logic [7:0] a,
	input logic [7:0] b,
	output logic [7:0] s,
	output logic c
	);

	logic [7:0] c_w;
	
	full_adder A0(a[0], b[0], 1'b0, s[0], c_w[0]);
	full_adder A1(a[1], b[1], c_w[0], s[1], c_w[1]);
	full_adder A2(a[2], b[2], c_w[1], s[2], c_w[2]);
	full_adder A3(a[3], b[3], c_w[2], s[3], c_w[3]);
	full_adder A4(a[4], b[4], c_w[3], s[4], c_w[4]);
	full_adder A5(a[5], b[5], c_w[4], s[5], c_w[5]);
	full_adder A6(a[6], b[6], c_w[5], s[6], c_w[6]);
	full_adder A7(a[7], b[7], c_w[6], s[7], c_w[7]);
	
	
	assign c = c_w[7];
	
endmodule

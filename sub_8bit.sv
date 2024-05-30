module sub_8bit(
	input logic [7:0] a,
	input logic [7:0] b,
	output logic [7:0] d,
	output logic b_o
	);

	logic [7:0] b_w;
	
	full_sub S0(a[0], b[0], 1'b0, d[0], b_w[0]);
	full_sub S1(a[1], b[1], b_w[0], d[1], b_w[1]);
	full_sub S2(a[2], b[2], b_w[1], d[2], b_w[2]);
	full_sub S3(a[3], b[3], b_w[2], d[3], b_w[3]);
	full_sub S4(a[4], b[4], b_w[3], d[4], b_w[4]);
	full_sub S5(a[5], b[5], b_w[4], d[5], b_w[5]);
	full_sub S6(a[6], b[6], b_w[5], d[6], b_w[6]);
	full_sub S7(a[7], b[7], b_w[6], d[7], b_w[7]);
	
	assign b_o = b_w[7];
	
endmodule

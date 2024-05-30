module or_8bit(
	input logic [7:0] a,
	input logic [7:0] b,
	output logic [7:0] c_o
	);

	or(c_o[0], a[0], b[0]);
	or(c_o[1], a[1], b[1]);
	or(c_o[2], a[2], b[2]);
	or(c_o[3], a[3], b[3]);
	or(c_o[4], a[4], b[4]);
	or(c_o[5], a[5], b[5]);
	or(c_o[6], a[6], b[6]);
	or(c_o[7], a[7], b[7]);
	
	
endmodule


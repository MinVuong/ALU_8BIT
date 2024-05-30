module alu_top_tb;
    logic clk;
    logic rst_n;
    logic [2:0] op;
    logic [7:0] a;
    logic [7:0] b;
    logic [7:0] result;
    logic [3:0] alu_flag;
    logic carry;

   synth_wrapper ALU(
		.clk(clk),
		.rst_n(rst_n),
		.op(op),
		.a(a),
		.b(b),
		.result(result),
		.carry(carry),
		.alu_flag(alu_flag)
	);


    initial begin
	$shm_open("wave.shm");
	
        clk = 0;
        rst_n = 0;
        #20 rst_n = 1;
    end

    always #10 clk = ~clk;

    initial begin
        a = 8'b00101010;
        b = 8'b10011111;

        // Addition

        op = 3'b000;
        #20;
       

	
        // Subtraction
	
        op = 3'b001;
       
      	#20;
        // Shift Left
	
        op = 3'b010;
        #20;
       





        // Shift Right
	
        op = 3'b011;
        #20;
      


        // AND
	
        op = 3'b100;
        #20;
        
	

        // OR

        op = 3'b101;
        #20;
        


        // NOT
        op = 3'b110;
        #20;
       

        // Forwarding A
        op = 3'b111;
      
	      #100
        $finish;
    end

endmodule

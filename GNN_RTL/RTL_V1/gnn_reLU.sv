module gnn_reLU (
		input signed [20:0] in0_n0, in1_n0, in2_n0, in3_n0,
   				    in0_n1, in1_n1, in2_n1, in3_n1,
   				    in0_n2, in1_n2, in2_n2, in3_n2,
   				    in0_n3, in1_n3, in2_n3, in3_n3,
		input logic clk, in_ready,
		output logic signed [20:0] out0_n0, out1_n0, out2_n0, out3_n0,
    				     	   out0_n1, out1_n1, out2_n1, out3_n1,
   				    	   out0_n2, out1_n2, out2_n2, out3_n2,
    				    	   out0_n3, out1_n3, out2_n3, out3_n3,
		output logic relu_ready_out
	);

logic relu_n0_ready_out, relu_n1_ready_out, relu_n2_ready_out, relu_n3_ready_out;

assign relu_ready_out = relu_n0_ready_out & relu_n1_ready_out & relu_n2_ready_out & relu_n3_ready_out;

reLU u_reLU_0 (
		.clk(clk), .ready_in(in_ready),
		.in0(in0_n0), .in1(in1_n0), .in2(in2_n0), .in3(in3_n0),
		.out0(out0_n0), .out1(out1_n0), .out2(out2_n0), .out3(out3_n0),
		.ready_out(relu_n0_ready_out)
	);

reLU u_reLU_1 (
		.clk(clk), .ready_in(in_ready),
		.in0(in0_n1), .in1(in1_n1), .in2(in2_n1), .in3(in3_n1),
		.out0(out0_n1), .out1(out1_n1), .out2(out2_n1), .out3(out3_n1),
		.ready_out(relu_n1_ready_out)
	);

reLU u_reLU_2 (
		.clk(clk), .ready_in(in_ready),
		.in0(in0_n2), .in1(in1_n2), .in2(in2_n2), .in3(in3_n2),
		.out0(out0_n2), .out1(out1_n2), .out2(out2_n2), .out3(out3_n2),
		.ready_out(relu_n2_ready_out)
	);

reLU u_reLU_3 (
		.clk(clk), .ready_in(in_ready),
		.in0(in0_n3), .in1(in1_n3), .in2(in2_n3), .in3(in3_n3),
		.out0(out0_n3), .out1(out1_n3), .out2(out2_n3), .out3(out3_n3),
		.ready_out(relu_n3_ready_out)
	);
endmodule

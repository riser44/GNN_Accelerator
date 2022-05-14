module top (   
       		x0_node0, x1_node0, x2_node0, x3_node0,
                x0_node1, x1_node1, x2_node1, x3_node1,
                x0_node2, x1_node2, x2_node2, x3_node2,
                x0_node3, x1_node3, x2_node3, x3_node3,
                w04, w14, w24, w34,
                w05, w15, w25, w35,
                w06, w16, w26, w36,
                w07, w17, w27, w37,
                w48, w58, w68, w78,
                w49, w59, w69, w79,
                out0_node0, out1_node0,
                out0_node1, out1_node1,
                out0_node2, out1_node2,
                out0_node3, out1_node3,
                in_ready,
                out10_ready_node0, out11_ready_node0,
                out10_ready_node1, out11_ready_node1,
                out10_ready_node2, out11_ready_node2,
                out10_ready_node3, out11_ready_node3,
                clk
	);
    //Inputs
    input signed [4:0] x0_node0, x1_node0, x2_node0, x3_node0;
    input signed [4:0] x0_node1, x1_node1, x2_node1, x3_node1;
    input signed [4:0] x0_node2, x1_node2, x2_node2, x3_node2;
    input signed [4:0] x0_node3, x1_node3, x2_node3, x3_node3;

    input signed [4:0] w04, w14, w24, w34;
    input signed [4:0] w05, w15, w25, w35;
    input signed [4:0] w06, w16, w26, w36;
    input signed [4:0] w07, w17, w27, w37;
    input signed [4:0] w48, w58, w68, w78;
    input signed [4:0] w49, w59, w69, w79;
    
    input clk, in_ready;
    
    //Outputs
    output logic signed [20:0] out0_node0, out1_node0;
    output logic signed [20:0] out0_node1, out1_node1;
    output logic signed [20:0] out0_node2, out1_node2;
    output logic signed [20:0] out0_node3, out1_node3;
    
    output logic out10_ready_node0, out11_ready_node0;
    output logic out10_ready_node1, out11_ready_node1;
    output logic out10_ready_node2, out11_ready_node2;
    output logic out10_ready_node3, out11_ready_node3;

 
    logic agg0_ready_out,agg1_ready_out, dnn_ready_out, relu_ready_out;

    logic signed [20:0]   x0_n0_agg, x1_n0_agg, x2_n0_agg, x3_n0_agg,
	               	  x0_n1_agg, x1_n1_agg, x2_n1_agg, x3_n1_agg,
	               	  x0_n2_agg, x1_n2_agg, x2_n2_agg, x3_n2_agg,
	               	  x0_n3_agg, x1_n3_agg, x2_n3_agg, x3_n3_agg;

    logic signed [20:0]   x0_node0_agg, x1_node0_agg, x2_node0_agg, x3_node0_agg,
	               	  x0_node1_agg, x1_node1_agg, x2_node1_agg, x3_node1_agg,
	               	  x0_node2_agg, x1_node2_agg, x2_node2_agg, x3_node2_agg,
	               	  x0_node3_agg, x1_node3_agg, x2_node3_agg, x3_node3_agg;


    logic signed [20:0]   out0_dnn_n0, out1_dnn_n0, out2_dnn_n0, out3_dnn_n0,
                    	  out0_dnn_n1, out1_dnn_n1, out2_dnn_n1, out3_dnn_n1,
                    	  out0_dnn_n2, out1_dnn_n2, out2_dnn_n2, out3_dnn_n2,
                    	  out0_dnn_n3, out1_dnn_n3, out2_dnn_n3, out3_dnn_n3;

    logic signed [20:0]   relu_out0_n0, relu_out1_n0, relu_out2_n0, relu_out3_n0,
    			  relu_out0_n1, relu_out1_n1, relu_out2_n1, relu_out3_n1,
   			  relu_out0_n2, relu_out1_n2, relu_out2_n2, relu_out3_n2,
    			  relu_out0_n3, relu_out1_n3, relu_out2_n3, relu_out3_n3;
    

dnn_aggregator u_dnn_aggregator (
		.x0_n0(x0_node0), .x1_n0(x1_node0), .x2_n0(x2_node0), .x3_n0(x3_node0),
		.x0_n1(x0_node1), .x1_n1(x1_node1), .x2_n1(x2_node1), .x3_n1(x3_node1),
		.x0_n2(x0_node2), .x1_n2(x1_node2), .x2_n2(x2_node2), .x3_n2(x3_node2),
	       	.x0_n3(x0_node3), .x1_n3(x1_node3), .x2_n3(x2_node3), .x3_n3(x3_node3),
		.x0_n0_agg(x0_n0_agg), .x1_n0_agg(x1_n0_agg), .x2_n0_agg(x2_n0_agg), .x3_n0_agg(x3_n0_agg),
		.x0_n1_agg(x0_n1_agg), .x1_n1_agg(x1_n1_agg), .x2_n1_agg(x2_n1_agg), .x3_n1_agg(x3_n1_agg),
		.x0_n2_agg(x0_n2_agg), .x1_n2_agg(x1_n2_agg), .x2_n2_agg(x2_n2_agg), .x3_n2_agg(x3_n2_agg),
	       	.x0_n3_agg(x0_n3_agg), .x1_n3_agg(x1_n3_agg), .x2_n3_agg(x2_n3_agg), .x3_n3_agg(x3_n3_agg),
		.in_rdy_agg(in_ready), .out_rdy_agg(agg0_ready_out), .clk(clk)
	);
		
dnn_nodes u_dnn_nodes (
		.x0_dnn_n0(x0_n0_agg), .x1_dnn_n0(x1_n0_agg), .x2_dnn_n0(x2_n0_agg), .x3_dnn_n0(x3_n0_agg),
		.x0_dnn_n1(x0_n1_agg), .x1_dnn_n1(x1_n1_agg), .x2_dnn_n1(x2_n1_agg), .x3_dnn_n1(x3_n1_agg),
		.x0_dnn_n2(x0_n2_agg), .x1_dnn_n2(x1_n2_agg), .x2_dnn_n2(x2_n2_agg), .x3_dnn_n2(x3_n2_agg),
		.x0_dnn_n3(x0_n3_agg), .x1_dnn_n3(x1_n3_agg), .x2_dnn_n3(x2_n3_agg), .x3_dnn_n3(x3_n3_agg),
		.w04(w04), .w05(w05), .w06(w06), .w07(w07),
                .w14(w14), .w15(w15), .w16(w16), .w17(w17),
		.w24(w24), .w25(w25), .w26(w26), .w27(w27),
                .w34(w34), .w35(w35), .w36(w36), .w37(w37),
		.out0_dnn_n0(out0_dnn_n0), .out1_dnn_n0(out1_dnn_n0), .out2_dnn_n0(out2_dnn_n0), .out3_dnn_n0(out3_dnn_n0),
		.out0_dnn_n1(out0_dnn_n1), .out1_dnn_n1(out1_dnn_n1), .out2_dnn_n1(out2_dnn_n1), .out3_dnn_n1(out3_dnn_n1),
		.out0_dnn_n2(out0_dnn_n2), .out1_dnn_n2(out1_dnn_n2), .out2_dnn_n2(out2_dnn_n2), .out3_dnn_n2(out3_dnn_n2),
		.out0_dnn_n3(out0_dnn_n3), .out1_dnn_n3(out1_dnn_n3), .out2_dnn_n3(out2_dnn_n3), .out3_dnn_n3(out3_dnn_n3),
		.in_dnn_ready(agg0_ready_out),
		.out_dnn_ready(dnn_ready_out),
		.clk(clk)
	);

gnn_reLU u_gnn_reLU (
		.in0_n0(out0_dnn_n0), .in1_n0(out1_dnn_n0), .in2_n0(out2_dnn_n0), .in3_n0(out3_dnn_n0),
                .in0_n1(out0_dnn_n1), .in1_n1(out1_dnn_n1), .in2_n1(out2_dnn_n1), .in3_n1(out3_dnn_n1),
		.in0_n2(out0_dnn_n2), .in1_n2(out1_dnn_n2), .in2_n2(out2_dnn_n2), .in3_n2(out3_dnn_n2),
                .in0_n3(out0_dnn_n3), .in1_n3(out1_dnn_n3), .in2_n3(out2_dnn_n3), .in3_n3(out3_dnn_n3),
		.out0_n0(relu_out0_n0), .out1_n0(relu_out1_n0), .out2_n0(relu_out2_n0), .out3_n0(relu_out3_n0),
                .out0_n1(relu_out0_n1), .out1_n1(relu_out1_n1), .out2_n1(relu_out2_n1), .out3_n1(relu_out3_n1),
                .out0_n2(relu_out0_n2), .out1_n2(relu_out1_n2), .out2_n2(relu_out2_n2), .out3_n2(relu_out3_n2),
                .out0_n3(relu_out0_n3), .out1_n3(relu_out1_n3), .out2_n3(relu_out2_n3), .out3_n3(relu_out3_n3),
		.in_ready(dnn_ready_out), .clk(clk),
		.relu_ready_out(relu_ready_out)
	);

gnn_aggregator u_gnn_aggregator (
		.x0_n0(relu_out0_n0), .x1_n0(relu_out1_n0), .x2_n0(relu_out2_n0), .x3_n0(relu_out3_n0),
		.x0_n1(relu_out0_n1), .x1_n1(relu_out1_n1), .x2_n1(relu_out2_n1), .x3_n1(relu_out3_n1),
		.x0_n2(relu_out0_n2), .x1_n2(relu_out1_n2), .x2_n2(relu_out2_n2), .x3_n2(relu_out3_n2),
	       	.x0_n3(relu_out0_n3), .x1_n3(relu_out1_n3), .x2_n3(relu_out2_n3), .x3_n3(relu_out3_n3),
		.x0_n0_agg(x0_node0_agg), .x1_n0_agg(x1_node0_agg), .x2_n0_agg(x2_node0_agg), .x3_n0_agg(x3_node0_agg),
		.x0_n1_agg(x0_node1_agg), .x1_n1_agg(x1_node1_agg), .x2_n1_agg(x2_node1_agg), .x3_n1_agg(x3_node1_agg),
		.x0_n2_agg(x0_node2_agg), .x1_n2_agg(x1_node2_agg), .x2_n2_agg(x2_node2_agg), .x3_n2_agg(x3_node2_agg),
	       	.x0_n3_agg(x0_node3_agg), .x1_n3_agg(x1_node3_agg), .x2_n3_agg(x2_node3_agg), .x3_n3_agg(x3_node3_agg),
		.in_rdy_agg(relu_ready_out), .out_rdy_agg(agg1_ready_out), .clk(clk)
	);


//Final Outputs

always_ff@(posedge clk)
begin
        out10_ready_node0 <= agg1_ready_out;
        out11_ready_node0 <= agg1_ready_out;
        out10_ready_node1 <= agg1_ready_out;
        out11_ready_node1 <= agg1_ready_out;
        out10_ready_node2 <= agg1_ready_out;
        out11_ready_node2 <= agg1_ready_out;
        out10_ready_node3 <= agg1_ready_out;
        out11_ready_node3 <= agg1_ready_out;

	if(agg1_ready_out)
	begin
	    //Node 0 Output
            out0_node0 <= x0_node0_agg * w48 + x1_node0_agg * w58 + x2_node0_agg * w68 + x3_node0_agg * w78;
            out1_node0 <= x0_node0_agg * w49 + x1_node0_agg * w59 + x2_node0_agg * w69 + x3_node0_agg * w79;
            
            //Node 1 Output
            out0_node1 <= x0_node1_agg * w48 + x1_node1_agg * w58 + x2_node1_agg * w68 + x3_node1_agg * w78;
            out1_node1 <= x0_node1_agg * w49 + x1_node1_agg * w59 + x2_node1_agg * w69 + x3_node1_agg * w79;

            //Node 2 Output
            out0_node2 <= x0_node2_agg * w48 + x1_node2_agg * w58 + x2_node2_agg * w68 + x3_node2_agg * w78;
            out1_node2 <= x0_node2_agg * w49 + x1_node2_agg * w59 + x2_node2_agg * w69 + x3_node2_agg * w79;

            //Node 3 Output
            out0_node3 <= x0_node3_agg * w48 + x1_node3_agg * w58 + x2_node3_agg * w68 + x3_node3_agg * w78;
            out1_node3 <= x0_node3_agg * w49 + x1_node3_agg * w59 + x2_node3_agg * w69 + x3_node3_agg * w79;
    	end	
end
endmodule


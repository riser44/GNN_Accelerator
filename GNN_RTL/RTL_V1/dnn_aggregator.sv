module dnn_aggregator (
		x0_n0, x1_n0, x2_n0, x3_n0,
		x0_n1, x1_n1, x2_n1, x3_n1,
		x0_n2, x1_n2, x2_n2, x3_n2,
	       	x0_n3, x1_n3, x2_n3, x3_n3,

		x0_n0_agg, x1_n0_agg, x2_n0_agg, x3_n0_agg,
		x0_n1_agg, x1_n1_agg, x2_n1_agg, x3_n1_agg,
		x0_n2_agg, x1_n2_agg, x2_n2_agg, x3_n2_agg,
	       	x0_n3_agg, x1_n3_agg, x2_n3_agg, x3_n3_agg,

		in_rdy_agg, out_rdy_agg, clk
		);

input signed [4:0] x0_n0, x1_n0, x2_n0, x3_n0, 
                   x0_n1, x1_n1, x2_n1, x3_n1,
                   x0_n2, x1_n2, x2_n2, x3_n2,
                   x0_n3, x1_n3, x2_n3, x3_n3;

input in_rdy_agg, clk;

output logic out_rdy_agg;
output logic signed [20:0] x0_n0_agg, x1_n0_agg, x2_n0_agg, x3_n0_agg,
	               	  x0_n1_agg, x1_n1_agg, x2_n1_agg, x3_n1_agg,
	               	  x0_n2_agg, x1_n2_agg, x2_n2_agg, x3_n2_agg,
	               	  x0_n3_agg, x1_n3_agg, x2_n3_agg, x3_n3_agg;

always_ff@(posedge clk)
begin
	if(in_rdy_agg)
	begin
		x0_n0_agg <= x0_n1 + x0_n2 + x0_n0;
		x0_n1_agg <= x0_n3 + x0_n0 + x0_n1;
		x0_n2_agg <= x0_n3 + x0_n0 + x0_n2;
		x0_n3_agg <= x0_n1 + x0_n2 + x0_n3;

		x1_n0_agg <= x1_n1 + x1_n2 + x1_n0;
		x1_n1_agg <= x1_n3 + x1_n0 + x1_n1;
		x1_n2_agg <= x1_n3 + x1_n0 + x1_n2;
		x1_n3_agg <= x1_n1 + x1_n2 + x1_n3;

		x2_n0_agg <= x2_n1 + x2_n2 + x2_n0;
		x2_n1_agg <= x2_n3 + x2_n0 + x2_n1;
		x2_n2_agg <= x2_n3 + x2_n0 + x2_n2;
		x2_n3_agg <= x2_n1 + x2_n2 + x2_n3;

		x3_n0_agg <= x3_n1 + x3_n2 + x3_n0;
		x3_n1_agg <= x3_n3 + x3_n0 + x3_n1;
		x3_n2_agg <= x3_n3 + x3_n0 + x3_n2;
		x3_n3_agg <= x3_n1 + x3_n2 + x3_n3;

		out_rdy_agg <= in_rdy_agg;
	end
	else
	begin
		x0_n0_agg <= 'd0;
                x0_n1_agg <= 'd0; 
                x0_n2_agg <= 'd0;
                x0_n3_agg <= 'd0;
                             
                x1_n0_agg <= 'd0;
                x1_n1_agg <= 'd0;
                x1_n2_agg <= 'd0;
                x1_n3_agg <= 'd0;
                            
                x2_n0_agg <= 'd0;
                x2_n1_agg <= 'd0;
                x2_n2_agg <= 'd0;
                x2_n3_agg <= 'd0;
                           
                x3_n0_agg <= 'd0;
                x3_n1_agg <= 'd0;
                x3_n2_agg <= 'd0;
                x3_n3_agg <= 'd0;

		out_rdy_agg <='d0;
	end
end
endmodule

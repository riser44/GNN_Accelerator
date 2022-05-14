module dnn(x0, x1, x2, x3, w04, w05, w06, w07, w14, w15, w16, w17, w24, w25, w26, w27, w34, w35, w36, w37, w48, w58, w49, w59, w68, w69, w78, w79, y0,y1,y2,y3, stg_1_rdy, stg_2_rdy, clk);

input logic signed [5:0] x0, x1, x2, x3, w04, w05, w06, w07, w14, w15, w16, w17, w24, w25, w26, w27, w34, w35, w36, w37, w48, w58, w49, w59, w68, w69, w78, w79;

input stg_1_rdy;
input clk;

output logic signed [20:0] y0,y1,y2,y3;


logic signed [20:0] t4,t5,t6,t7;
logic signed [20:0] tm4,tm5,tm6,tm7;
output logic stg_2_rdy;

//STAGE 1
assign t4= x0*w04 + x1*w14 + x2*w24 + x3*w34;
assign t5= x0*w05 + x1*w15 + x2*w25 + x3*w35;
assign t6= x0*w06 + x1*w16 + x2*w26 + x3*w36;
assign t7= x0*w07 + x1*w17 + x2*w27 + x3*w37;

assign tm4 = (t4>0) ? t4 : 21'h0;
assign tm5 = (t5>0) ? t5 : 21'h0;
assign tm6 = (t6>0) ? t6 : 21'h0;
assign tm7 = (t7>0) ? t7 : 21'h0;


always@(posedge clk)
begin
	if(stg_1_rdy==1'b0)
	 begin
		stg_2_rdy <= 1'b0;
		y0 <= 21'd0;
		y1 <= 21'd0;
		y2 <= 21'd0;
		y3 <= 21'd0;
	 end
	else
	 begin
		stg_2_rdy <= stg_1_rdy;
		y0 <= tm4;
		y1 <= tm5;
		y2 <= tm6;
		y3 <= tm7;
	 end
end

		
endmodule



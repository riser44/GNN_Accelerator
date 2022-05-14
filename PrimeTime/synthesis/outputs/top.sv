module top(x0_node0, x1_node0, x2_node0, x3_node0, x0_node1, x1_node1, x2_node1, x3_node1, x0_node2, x1_node2, x2_node2, x3_node2, x0_node3, x1_node3, x2_node3, x3_node3, w04, w05, w06, w07, w14, w15, w16, w17, w24, w25, w26, w27, w34, w35, w36, w37, w48, w58, w49, w59, w68, w69, w78, w79, out0_node0, out1_node0, out0_node1, out1_node1, out0_node2, out1_node2, out0_node3, out1_node3, out10_ready_node0, out11_ready_node0, out10_ready_node1, out11_ready_node1, out10_ready_node2, out11_ready_node2, out10_ready_node3, out11_ready_node3, in_ready, clk);

input logic signed [4:0] x0_node0, x1_node0, x2_node0, x3_node0;
input logic signed [4:0] x0_node1, x1_node1, x2_node1, x3_node1;
input logic signed [4:0] x0_node2, x1_node2, x2_node2, x3_node2;
input logic signed [4:0] x0_node3, x1_node3, x2_node3, x3_node3;

input logic signed [4:0] w04, w05, w06, w07;
input logic signed [4:0] w14, w15, w16, w17;
input logic signed [4:0] w24, w25, w26, w27;
input logic signed [4:0] w34, w35, w36, w37;
input logic signed [4:0] w48, w58, w49, w59, w68, w69, w78, w79;

input in_ready, clk;

output logic signed [20:0] out0_node0, out1_node0, out0_node1, out1_node1, out0_node2, out1_node2, out0_node3, out1_node3;
output logic out10_ready_node0, out11_ready_node0, out10_ready_node1, out11_ready_node1, out10_ready_node2, out11_ready_node2, out10_ready_node3, out11_ready_node3;

logic signed [20:0] y0_node0,  y1_node0, y2_node0, y3_node0, y0_node1,  y1_node1, y2_node1, y3_node1, y0_node2,  y1_node2, y2_node2, y3_node2, y0_node3, y1_node3, y2_node3, y3_node3;
logic signed [20:0] y0_node0_a,  y1_node0_a, y2_node0_a, y3_node0_a, y0_node1_a,  y1_node1_a, y2_node1_a, y3_node1_a, y0_node2_a,  y1_node2_a, y2_node2_a, y3_node2_a, y0_node3_a, y1_node3_a, y2_node3_a, y3_node3_a;
logic signed [20:0] t8_node0, t9_node0, t8_node1, t9_node1, t8_node2, t9_node2, t8_node3,t9_node3;

logic signed [5:0] x0_node0_a, x1_node0_a, x2_node0_a, x3_node0_a;
logic signed [5:0] x0_node1_a, x1_node1_a, x2_node1_a, x3_node1_a;
logic signed [5:0] x0_node2_a, x1_node2_a, x2_node2_a, x3_node2_a;
logic signed [5:0] x0_node3_a, x1_node3_a, x2_node3_a, x3_node3_a;

logic signed [5:0] x0_node0_ai, x1_node0_ai, x2_node0_ai, x3_node0_ai;
logic signed [5:0] x0_node1_ai, x1_node1_ai, x2_node1_ai, x3_node1_ai;
logic signed [5:0] x0_node2_ai, x1_node2_ai, x2_node2_ai, x3_node2_ai;
logic signed [5:0] x0_node3_ai, x1_node3_ai, x2_node3_ai, x3_node3_ai;

logic stg_1_rdy, stg_2_rdy_node0, stg_2_rdy_node1, stg_2_rdy_node2, stg_2_rdy_node3;


assign x0_node0_ai = x0_node0 + x0_node1 + x0_node2;
assign x1_node0_ai = x1_node0 + x1_node1 + x1_node2;
assign x2_node0_ai = x2_node0 + x2_node1 + x2_node2;
assign x3_node0_ai = x3_node0 + x3_node1 + x3_node2;

assign x0_node1_ai = x0_node0 + x0_node1 + x0_node3;
assign x1_node1_ai = x1_node0 + x1_node1 + x1_node3;
assign x2_node1_ai = x2_node0 + x2_node1 + x2_node3;
assign x3_node1_ai = x3_node0 + x3_node1 + x3_node3;

assign x0_node2_ai = x0_node0 + x0_node2 + x0_node3;
assign x1_node2_ai = x1_node0 + x1_node2 + x1_node3;
assign x2_node2_ai = x2_node0 + x2_node2 + x2_node3;
assign x3_node2_ai = x3_node0 + x3_node2 + x3_node3;

assign x0_node3_ai = x0_node1 + x0_node2 + x0_node3;
assign x1_node3_ai = x1_node1 + x1_node2 + x1_node3;
assign x2_node3_ai = x2_node1 + x2_node2 + x2_node3;
assign x3_node3_ai = x3_node1 + x3_node2 + x3_node3;

always@(posedge clk)
begin
	if(in_ready==1'b0)
	begin
		stg_1_rdy <= 1'b0;
		x0_node0_a <= 21'b0;
		x1_node0_a <= 21'b0;
		x2_node0_a <= 21'b0;
		x3_node0_a <= 21'b0;

		x0_node1_a <= 21'b0;
		x1_node1_a <= 21'b0;
		x2_node1_a <= 21'b0;
		x3_node1_a <= 21'b0;

		x0_node2_a <= 21'b0;
		x1_node2_a <= 21'b0;
		x2_node2_a <= 21'b0;
		x3_node2_a <= 21'b0;

		x0_node3_a <= 21'b0;
		x1_node3_a <= 21'b0;
		x2_node3_a <= 21'b0;
		x3_node3_a <= 21'b0;
		
	 end

	 else
	 begin
		stg_1_rdy <= in_ready;
		x0_node0_a <= x0_node0_ai;
		x1_node0_a <= x1_node0_ai;
		x2_node0_a <= x2_node0_ai;
		x3_node0_a <= x3_node0_ai;

		x0_node1_a <= x0_node1_ai;
		x1_node1_a <= x1_node1_ai;
		x2_node1_a <= x2_node1_ai;
		x3_node1_a <= x3_node1_ai;

		x0_node2_a <= x0_node2_ai;
		x1_node2_a <= x1_node2_ai;
		x2_node2_a <= x2_node2_ai;
		x3_node2_a <= x3_node2_ai;

		x0_node3_a <= x0_node3_ai;
		x1_node3_a <= x1_node3_ai;
		x2_node3_a <= x2_node3_ai;
		x3_node3_a <= x3_node3_ai;
	 end
end

dnn task0 (.x0(x0_node0_a), .x1(x1_node0_a), .x2(x2_node0_a), .x3(x3_node0_a), 
.w04(w04), .w05(w05), .w06(w06), .w07(w07), 
.w14(w14), .w15(w15), .w16(w16), .w17(w17), 
.w24(w24), .w25(w25), .w26(w26), .w27(w27), 
.w34(w34), .w35(w35), .w36(w36), .w37(w37), 
.w48(w48), .w58(w58), .w49(w49), .w59(w59), 
.w68(w68), .w69(w69), .w78(w78), .w79(w79), 
.y0(y0_node0), .y1(y1_node0), .y2(y2_node0), .y3(y3_node0),
.stg_1_rdy(stg_1_rdy), .stg_2_rdy(stg_2_rdy_node0),.clk(clk));


dnn task1 (.x0(x0_node1_a), .x1(x1_node1_a), .x2(x2_node0_a), .x3(x3_node0_a), 
.w04(w04), .w05(w05), .w06(w06), .w07(w07), 
.w14(w14), .w15(w15), .w16(w16), .w17(w17), 
.w24(w24), .w25(w25), .w26(w26), .w27(w27), 
.w34(w34), .w35(w35), .w36(w36), .w37(w37), 
.w48(w48), .w58(w58), .w49(w49), .w59(w59), 
.w68(w68), .w69(w69), .w78(w78), .w79(w79), 
.y0(y0_node1), .y1(y1_node1), .y2(y2_node1), .y3(y3_node1), 
.stg_1_rdy(stg_1_rdy), .stg_2_rdy(stg_2_rdy_node1), .clk(clk));

dnn task2 (.x0(x0_node2_a), .x1(x1_node2_a), .x2(x2_node2_a), .x3(x3_node2_a), 
.w04(w04), .w05(w05), .w06(w06), .w07(w07), 
.w14(w14), .w15(w15), .w16(w16), .w17(w17), 
.w24(w24), .w25(w25), .w26(w26), .w27(w27), 
.w34(w34), .w35(w35), .w36(w36), .w37(w37), 
.w48(w48), .w58(w58), .w49(w49), .w59(w59), 
.w68(w68), .w69(w69), .w78(w78), .w79(w79), 
.y0(y0_node2), .y1(y1_node2), .y2(y2_node2), .y3(y3_node2), 
.stg_1_rdy(stg_1_rdy), .stg_2_rdy(stg_2_rdy_node2), .clk(clk));

dnn task3 (.x0(x0_node3_a), .x1(x1_node3_a), .x2(x2_node3_a), .x3(x3_node3_a), 
.w04(w04), .w05(w05), .w06(w06), .w07(w07), 
.w14(w14), .w15(w15), .w16(w16), .w17(w17), 
.w24(w24), .w25(w25), .w26(w26), .w27(w27), 
.w34(w34), .w35(w35), .w36(w36), .w37(w37), 
.w48(w48), .w58(w58), .w49(w49), .w59(w59), 
.w68(w68), .w69(w69), .w78(w78), .w79(w79), 
.y0(y0_node3), .y1(y1_node3), .y2(y2_node3), .y3(y3_node3), 
.stg_1_rdy(stg_1_rdy),.stg_2_rdy(stg_2_rdy_node3), .clk(clk));

assign y0_node0_a = y0_node0 + y0_node1 + y0_node2;
assign y1_node0_a = y1_node0 + y1_node1 + y1_node2;
assign y2_node0_a = y2_node0 + y2_node1 + y2_node2;
assign y3_node0_a = y3_node0 + y3_node1 + y3_node2;

assign y0_node1_a = y0_node0 + y0_node1 + y0_node3;
assign y1_node1_a = y1_node0 + y1_node1 + y1_node3;
assign y2_node1_a = y2_node0 + y2_node1 + y2_node3;
assign y3_node1_a = y3_node0 + y3_node1 + y3_node3;

assign y0_node2_a = y0_node0 + y0_node2 + y0_node3;
assign y1_node2_a = y1_node0 + y1_node2 + y1_node3;
assign y2_node2_a = y2_node0 + y2_node2 + y2_node3;
assign y3_node2_a = y3_node0 + y3_node2 + y3_node3;

assign y0_node3_a = y0_node1 + y0_node2 + y0_node3;
assign y1_node3_a = y1_node1 + y1_node2 + y1_node3;
assign y2_node3_a = y2_node1 + y2_node2 + y2_node3;
assign y3_node3_a = y3_node1 + y3_node2 + y3_node3;

assign t8_node0 = y0_node0_a*w48 + y1_node0_a*w58 + y2_node0_a*w68 + y3_node0_a*w78;
assign t9_node0 = y0_node0_a*w49 + y1_node0_a*w59 + y2_node0_a*w69 + y3_node0_a*w79;

assign t8_node1 = y0_node1_a*w48 + y1_node1_a*w58 + y2_node1_a*w68 + y3_node1_a*w78;
assign t9_node1 = y0_node1_a*w49 + y1_node1_a*w59 + y2_node1_a*w69 + y3_node1_a*w79;

assign t8_node2 = y0_node2_a*w48 + y1_node2_a*w58 + y2_node2_a*w68 + y3_node2_a*w78;
assign t9_node2 = y0_node2_a*w49 + y1_node2_a*w59 + y2_node2_a*w69 + y3_node2_a*w79;

assign t8_node3 = y0_node3_a*w48 + y1_node3_a*w58 + y2_node3_a*w68 + y3_node3_a*w78;
assign t9_node3 = y0_node3_a*w49 + y1_node3_a*w59 + y2_node3_a*w69 + y3_node3_a*w79;

always @(posedge clk)
begin
	if(stg_2_rdy_node0==1'b0)
	 begin
		out10_ready_node0 <= 1'b0;
		out11_ready_node0 <= 1'b0;
		out0_node0 <= 21'd0;
		out1_node0 <= 21'd0;
	end
	else
	begin
		out10_ready_node0 <= stg_2_rdy_node0;
		out11_ready_node0 <= stg_2_rdy_node0;
		out0_node0 <= t8_node0;
		out1_node0 <= t9_node0;
	end
end

always @(posedge clk)
begin
	if(stg_2_rdy_node1==1'b0)
	 begin
		out10_ready_node1 <= 1'b0;
		out11_ready_node1 <= 1'b0;
		out0_node1 <= 21'd0;
		out1_node1 <= 21'd0;
	end
	else
	begin
		out10_ready_node1 <= stg_2_rdy_node1;
		out11_ready_node1 <= stg_2_rdy_node1;
		out0_node1 <= t8_node1;
		out1_node1 <= t9_node1;
	end
end
	
always @(posedge clk)
begin
	if(stg_2_rdy_node2==1'b0)
	 begin
		out10_ready_node2 <= 1'b0;
		out11_ready_node2 <= 1'b0;
		out0_node2 <= 21'd0;
		out1_node2 <= 21'd0;
	end
	else
	begin
		out10_ready_node2 <= stg_2_rdy_node2;
		out11_ready_node2 <= stg_2_rdy_node2;
		out0_node2 <= t8_node2;
		out1_node2 <= t9_node2;
	end
end 
	
	
always @(posedge clk)
begin
	if(stg_2_rdy_node3==1'b0)
	 begin
		out10_ready_node3 <= 1'b0;
		out11_ready_node3 <= 1'b0;
		out0_node3 <= 21'd0;
		out1_node3 <= 21'd0;
	end
	else
	begin
		out10_ready_node3 <= stg_2_rdy_node3;
		out11_ready_node3 <= stg_2_rdy_node3;
		out0_node3 <= t8_node3;
		out1_node3 <= t9_node3;
	end
end

endmodule


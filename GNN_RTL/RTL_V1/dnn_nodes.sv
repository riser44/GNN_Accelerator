module dnn_nodes (
			x0_dnn_n0, x1_dnn_n0, x2_dnn_n0, x3_dnn_n0,
			x0_dnn_n1, x1_dnn_n1, x2_dnn_n1, x3_dnn_n1,
			x0_dnn_n2, x1_dnn_n2, x2_dnn_n2, x3_dnn_n2,
			x0_dnn_n3, x1_dnn_n3, x2_dnn_n3, x3_dnn_n3,

			w04, w05, w06, w07,
                        w14, w15, w16, w17,
			w24, w25, w26, w27,
                        w34, w35, w36, w37,

			out0_dnn_n0, out1_dnn_n0, out2_dnn_n0, out3_dnn_n0,
			out0_dnn_n1, out1_dnn_n1, out2_dnn_n1, out3_dnn_n1,
			out0_dnn_n2, out1_dnn_n2, out2_dnn_n2, out3_dnn_n2,
			out0_dnn_n3, out1_dnn_n3, out2_dnn_n3, out3_dnn_n3,

			in_dnn_ready,
			out_dnn_ready,
			clk
		);

input signed [20:0] x0_dnn_n0, x1_dnn_n0, x2_dnn_n0, x3_dnn_n0,
                   x0_dnn_n1, x1_dnn_n1, x2_dnn_n1, x3_dnn_n1,
                   x0_dnn_n2, x1_dnn_n2, x2_dnn_n2, x3_dnn_n2,
                   x0_dnn_n3, x1_dnn_n3, x2_dnn_n3, x3_dnn_n3;

input signed [4:0] w04, w05, w06, w07,
                   w14, w15, w16, w17,
                   w24, w25, w26, w27,
                   w34, w35, w36, w37;

input in_dnn_ready, clk;

output logic signed [20:0] out0_dnn_n0, out1_dnn_n0, out2_dnn_n0, out3_dnn_n0,
                    out0_dnn_n1, out1_dnn_n1, out2_dnn_n1, out3_dnn_n1,
                    out0_dnn_n2, out1_dnn_n2, out2_dnn_n2, out3_dnn_n2,
                    out0_dnn_n3, out1_dnn_n3, out2_dnn_n3, out3_dnn_n3;

output logic out_dnn_ready;
logic out_dnn_n0_ready, out_dnn_n1_ready, out_dnn_n2_ready, out_dnn_n3_ready;

assign out_dnn_ready =  out_dnn_n0_ready & out_dnn_n1_ready & out_dnn_n2_ready & out_dnn_n3_ready;

dnn u_dnn_0 (
		.x0(x0_dnn_n0), .x1(x1_dnn_n0), .x2(x2_dnn_n0), .x3(x3_dnn_n3),
		.w04(w04), .w05(w05), .w06(w06), .w07(w07),
                .w14(w14), .w15(w15), .w16(w16), .w17(w17),
                .w24(w24), .w25(w25), .w26(w26), .w27(w27),
                .w34(w34), .w35(w35), .w36(w36), .w37(w37),
		.out0(out0_dnn_n0), .out1(out1_dnn_n0), .out2(out2_dnn_n0), .out3(out3_dnn_n0),
		.in_ready(in_dnn_ready),
		.out_ready(out_dnn_n0_ready),
		.clk(clk)
	);

dnn u_dnn_1 (
		.x0(x0_dnn_n1), .x1(x1_dnn_n1), .x2(x2_dnn_n1), .x3(x3_dnn_n1),
		.w04(w04), .w05(w05), .w06(w06), .w07(w07),
                .w14(w14), .w15(w15), .w16(w16), .w17(w17),
                .w24(w24), .w25(w25), .w26(w26), .w27(w27),
                .w34(w34), .w35(w35), .w36(w36), .w37(w37),
		.out0(out0_dnn_n1), .out1(out1_dnn_n1), .out2(out2_dnn_n1), .out3(out3_dnn_n1),
		.in_ready(in_dnn_ready),
		.out_ready(out_dnn_n1_ready),
		.clk(clk)
	);

dnn u_dnn_2 (
		.x0(x0_dnn_n2), .x1(x1_dnn_n2), .x2(x2_dnn_n2), .x3(x3_dnn_n2),
		.w04(w04), .w05(w05), .w06(w06), .w07(w07),
                .w14(w14), .w15(w15), .w16(w16), .w17(w17),
                .w24(w24), .w25(w25), .w26(w26), .w27(w27),
                .w34(w34), .w35(w35), .w36(w36), .w37(w37),
		.out0(out0_dnn_n2), .out1(out1_dnn_n2), .out2(out2_dnn_n2), .out3(out3_dnn_n2),
		.in_ready(in_dnn_ready),
		.out_ready(out_dnn_n2_ready),
		.clk(clk)
	);

dnn u_dnn_3 (
		.x0(x0_dnn_n3), .x1(x1_dnn_n3), .x2(x2_dnn_n3), .x3(x3_dnn_n3),
		.w04(w04), .w05(w05), .w06(w06), .w07(w07),
                .w14(w14), .w15(w15), .w16(w16), .w17(w17),
                .w24(w24), .w25(w25), .w26(w26), .w27(w27),
                .w34(w34), .w35(w35), .w36(w36), .w37(w37),
		.out0(out0_dnn_n3), .out1(out1_dnn_n3), .out2(out2_dnn_n3), .out3(out3_dnn_n3),
		.in_ready(in_dnn_ready),
		.out_ready(out_dnn_n3_ready),
		.clk(clk)
	);

endmodule



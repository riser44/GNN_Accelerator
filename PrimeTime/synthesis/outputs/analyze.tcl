lappend search_path "/filespace/l/lraja/<ECE755/MS3_lam>"

analyze -library work -format sverilog \
 {/filespace/l/lraja/ECE755/MS3_lam/top.sv \
	 /filespace/l/lraja/ECE755/MS3_lam/dnn.sv
}

# Graph_Neural_Network_Accelerator
`Created By: Jagdish Mohapatra, Lamshe Raja`

We followed the guidelines shared in the course Canvas page for the GNN accelerator and
completed all the milestones with the desired results. In the first milestone, we completed and
verified the DNN RTL with the given testbench. We extended the DNN module to implement the
task for each node of layer-1. The aggregated features of a particular node and its neighboring
nodes are fed as input to the DNN. Our GNN module is designed in such a way that each layer of
the network is executed at every clock cycle. So, we came up with 3 pipeline stages, one for each
stage of the network and the output for a particular input will be obtained after 3 clock cycles.
During first clock cycle, the input features are aggregated. The multiply and accumulate operations
of the layer-1, that is implemented using DNN are done in the second clock cycle. The final
computations of the output layer are performed in the third clock cycle. Once we are done with the
RTL level design of GNN accelerator, we verified our design by giving the test vectors and
compared our values with the values shared in the gnn.xlsx file (shared in `MS2`).

For MS3, we synthesized the design with 45nm technology using Synopsys Design
Compiler. And the total area was 34662 μm2. We didn’t change the clock during synthesis phase
`(MS2)`. During Auto Place and Route `(MS4)`, we had 3 max transition violations in the beginning
with the netlist generated from our design. We debugged them and fixed them by upsizing 3 cells
to improve their drive strength which eventually fixed the max transition violations for us. We
upsized a buffer `“BUFFD2BWP”(net: U161/Z)` to `“BUFFD4BWP”`, 2 AOI cells
`“AOI211XD1BWP” (net:U12873/ZN)` and `“AOI211XD1BWP”(net: U12802/ZN)` to
`“AOI211XD2BWP”`. We did the upsizing directly on the shell terminal, so the script was not
updated. Because of the upsizing of a few cells, our design area increased a bit from `34662 μm2`
`(MS3)` to `34762 μm2` `(MS4)`. We used the same testbench that was given to us during `MS2` to verify
our design in all the later milestones `(MS3,4 and 5)`.
We performed Post APR evaluation during `MS5`. Our design has an area of `34762 mm2`
and we optimized our design for performance with a latency of `7.05 ns` with three
stage pipelined datapath.

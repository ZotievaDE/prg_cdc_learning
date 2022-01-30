module trig_gen
#(parameter N = 12)
(
    input           CLK1,
    input           CLK2,
    input           CLK3,
    input [3:0]     IDATA,
    output [3:0]    ODATA
);
logic [N-1 : 0] d_dff, clk_dff, q_dff;

assign clk_dff[3] = CLK1;
assign clk_dff[2] = CLK1;
assign clk_dff[1] = CLK1;
assign clk_dff[0] = CLK1;

assign clk_dff[11] = CLK2;
assign clk_dff[10] = CLK2;
assign clk_dff[9] = CLK2;
assign clk_dff[8] = CLK2;
assign clk_dff[7] = CLK2;
assign clk_dff[6] = CLK2;
assign clk_dff[5] = CLK2;
assign clk_dff[4] = CLK2;

assign d_dff[3:0] = IDATA;
assign d_dff[7:4] = q_dff[3:0];
assign d_dff[11:8] = q_dff[7:4];
assign ODATA = q_dff[11:8];

genvar i;

generate 
    for (i=0; i<N; i = i+1) begin
        dff_tr dff_inst (.D(d_dff[i]), 
                            .CLK(clk_dff[i]), 
                            .Q(q_dff[i])
                            );
    end
endgenerate

    
endmodule
module trig_gen
#(parameter N = 4)
(
    input           CLK1,
    input           CLK2,
    input           CLK3,
    input [3:0]     IDATA,
    output [3:0]    ODATA
);
logic [N-1 : 0] d_dff, clk_dff, q_dff;

assign ODATA = q_dff;
assign d_dff = IDATA;

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
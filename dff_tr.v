module dff_tr (
    input D,
    input CLK,
    output Q
);
    always @(posedge CLK) begin
        Q <= D
    end 
endmodule
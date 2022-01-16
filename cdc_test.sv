module cdc_test;
reg CLK1;
reg CLK2;
reg CLK3;
reg [3:0] IDATA;
reg [3:0] ODATA;

trig_gen inst_trg (
    .CLK1(CLK1),
    .CLK2(CLK2),
    .CLK3(CLK3),
    .IDATA(IDATA),
    .ODATA(ODATA));

//тактирование
    bit CLK1 = 0;
	always #5 CLK1 = ~CLK1;
    bit CLK2 = 0;
	always #8 CLK2 = ~CLK2;
    bit clk3 = 0;
	always #14 CLK3 = ~CLK3;

initial begin
    CLK1 = 0;
    CLK2 = 0;
    CLK3 = 0;
    IDATA = 4'b0;
    for (int i = 0; i<=15; i=i+1)
    begin
        #200 IDATA <= i;
    end

end

endmodule
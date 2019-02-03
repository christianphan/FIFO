module fifo_testbench();

    logic clk;
    logic write_enable;
    logic read_enable;
    logic [7:0] data_input;
    logic [7:0] data_output;



fifo(
    .clk(clk);
    .wrt_enable(write_enable);
    .rd_enable(read_enable);
    .data(data_input);
    .data_out(data_output)
);


//clock generator every 2 unit period
always #1 clk = ~clk;


initial begin

    $dumpfile("fifo_tb.vcd");
    $dumpvars(0, fifo_testbench);


end
endmodule

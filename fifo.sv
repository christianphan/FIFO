module fifo(input logic clk, 
            input logic wrt_enable, 
            input logic rd_enable, 
            input logic [5:0] data, 
            output logic  [5:0] data_out);


localparam Depth = 8;
localparam wr_ptr = 0;
localparam rd_prt = 0;
localparam stack_counter = 0;

logic [5:0] stack [Depth -1:0];

always_ff @ (posedge clk)
begin
    stack_counter <= (wr_ptr - rd_ptr + Depth) % Depth; //number of data inside of stack

    //write
    if(stack_counter > Depth)
    begin
        if(wrt_enable == 1)
        begin
                stack[wr_ptr] <= data;

                if(wr_ptr == Depth -1)
                begin
                wr_ptr <= 0;
                end
                else
                begin
                wr_ptr <= wr_ptr + 1;
                end
        end
    end

    //read
    if(rd_prt == 1)
    begin
            data_out <= stack[rd_ptr];
            stack[rd_ptr] <= 0; //resets the location in the stack to 0
                        
            if(rd_prt == Depth -1)
            begin
            rd_ptr <= 0;
            end
            else
            begin
            rd_ptr <= rd_ptr + 1;
            end
    end

end


endmodule

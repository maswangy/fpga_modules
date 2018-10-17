
module ram16X16
(
    clk,
    rst_n,
    write_en,
    write_addr,
    write_data,
    read_addr,
    read_data
);

    input clk;
    input rst_n;
    
    //about write
    input write_en;
    input [3:0] write_addr;
    input [15:0] write_data;
    
    //about read
    input [3:0] read_addr;
    output reg [15:0] read_data;
    
    /***********************************/
    
    reg [15:0] RAM [15:0];
    
    always @(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            read_data <= 16'd0;
        else if(write_en) //写操作优先
            RAM[write_addr] <= write_data;
        else
            read_data <= RAM[read_addr];
    end
    
    
endmodule



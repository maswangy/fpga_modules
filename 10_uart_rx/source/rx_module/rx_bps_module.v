`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:25:36 08/01/2018 
// Design Name: 
// Module Name:    rx_bps_module 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module rx_bps_module
#(parameter BPS = 13'd434)
(
    CLK,
    RST_n,
    Count_Sig,
    BPS_CLK
);
    
    input CLK;
    input RST_n;
    input Count_Sig;
    output BPS_CLK;
    
    /*
     * bps = 9600
     * => 1/9600 s/bit
     * 源时钟为50MHz => N = 1/9600 * 50M = parameter BPS = 13'd434 (一个bit位的周期 == 一个位的逗留时间)
     * 每个bit位的中间采集数据 5208/2 = 2604
     *
     * bps = 115200 => N= 434
     */
    
    reg [12:0] Count_BPS;
    
    always @(posedge CLK or negedge RST_n) begin
        if (!RST_n)
            Count_BPS <= 13'd0;
        else if (Count_BPS == BPS)
            Count_BPS <= 13'd0;
        else if (Count_Sig)
            Count_BPS <= Count_BPS + 1'b1;
        else
            Count_BPS <= 13'd0;
    end

    // 输出一个高脉冲信号 表示此刻采集数据
    assign BPS_CLK = (Count_BPS == (BPS>>1)) ? 1'b1 : 1'b0;

endmodule

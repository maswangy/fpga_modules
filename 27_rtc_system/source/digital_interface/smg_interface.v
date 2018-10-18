`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:56:12 08/09/2018 
// Design Name: 
// Module Name:    smg_interface 
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
/*
 * number_sig 16进制 范围为24'd000_000~24'dfff_fff
 */

module smg_interface
(
    input clk,
    input rst_n,
    
    input [23:0] number_sig,
    output [7:0] smg_data,
    output [5:0] scan_sig
);
    
    wire [3:0] number_data;
    
    smg_control_module S1
    (
        .clk(clk),
        .rst_n(rst_n),
        .number_sig(number_sig),
        .number_data(number_data)
    );
    
    smg_encode_module S2
    (
        .clk(clk),
        .rst_n(rst_n),
        .number_data(number_data),
        .smg_data(smg_data)
    );
    
    smg_scan_module S3
    (
        .clk(clk),
        .rst_n(rst_n),
        .scan_sig(scan_sig)
    );

endmodule


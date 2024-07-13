`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.07.2024 12:17:37
// Design Name: 
// Module Name: pwm_generator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pwm_generator (
input wire clk,         
input wire reset,       
input wire [7:0] duty,  
output reg pwm_out      
);

reg [7:0] counter;

always @(posedge clk or posedge reset) begin
if (reset) begin
counter <= 8'b0;
pwm_out <= 1'b0;
end else begin
if (counter < duty)
pwm_out <= 1'b1;
else
pwm_out <= 1'b0;

counter <= counter + 1'b1;
end
end

endmodule

module pwm_generator_tb();
    reg clk, rst;
    reg [7:0] duty;
    wire pwm_out;

    
    pwm_generator uut (
       clk,rst,duty,pwm_out
    );

    
    always begin 
        #5 clk = ~clk; 
    end

    
    initial begin
        
        clk = 1'b0;
        rst = 1'b0;
        duty = 8'd100;     
        #10;
        rst = 1'b1;
        #10;
        rst = 1'b0;
        duty = 8'd90;
        #100;
        duty = 8'd10;
        #100;
        duty = 8'd50;
        #100;
        duty = 8'd255;
        #100;
        duty = 8'd110;
        #100;
        duty = 8'd123;
        #100;
        duty = 8'd199;
        #100;
        rst = 1'b1;
        #10;
        rst = 1'b0;
        duty = 8'd100;
        #100;

        $finish;
    end
endmodule

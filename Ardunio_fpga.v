`timescale 1ns / 1ps

    module Ardunio_fpga(
    input tick,          // from Arduino
    output reg [4:0] led   // 5 LEDs (not 7 segments as commented)
);

    reg [2:0] counter = 0;  // Only needs to count 0-4, so 3 bits are enough
    
    always @(posedge tick) begin
        if (counter < 5)
            counter <= counter + 1;
        else 
            counter <= 0;
    end
    
    // 'an' is not declared in your port list, so I've removed it
    // assign an = 4'b1110;  // This was unused and undeclared
    
    always @* begin
        case(counter)    // LED pattern
            3'd0 : led = 5'b00001;   // 0
            3'd1 : led = 5'b00010;   // 1
            3'd2 : led = 5'b00100;   // 2
            3'd3 : led = 5'b01000;   // 3
            3'd4 : led = 5'b10000;   // 4
            default: led = 5'b00000; // default case
        endcase
    end
    
endmodule

`timescale 1ns / 1ps

module testbench;

reg [3:0] SWITCH = 0;
wire LED1, LED2, LED3, LED4;

circuit1 uut (SWITCH[0], SWITCH[1], SWITCH[2], SWITCH[3], LED1, LED2, LED3, LED4);

integer [2:0] k = 0;

initial
begin
    SWITCH = 0;
    
    for (k = 0; k < 16; k = k+1)
    #10 SWITCH = k;
    
    #5 $finish;
end


endmodule
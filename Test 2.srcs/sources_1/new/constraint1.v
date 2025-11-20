module circuit1(SWITCH1, SWITCH2, SWITCH3, SWITCH4, LED1, LED2, LED3, LED4);
    
    input SWITCH1, SWITCH2, SWITCH3, SWITCH4;
    output LED1, LED2, LED3, LED4;
    wire s1, c1, s2, c2;    
    
    assign s1 = SWITCH2 ^ SWITCH4;
    assign c1 = SWITCH2 & SWITCH4;
    assign s2 = SWITCH1 ^ SWITCH3 ^ c1;
    assign c2 = (SWITCH1 & SWITCH3) + (c1 & (SWITCH1 + SWITCH3));
    
    assign LED2 = c2;
    assign LED3 = s2;
    assign LED4 = s1;
    

endmodule
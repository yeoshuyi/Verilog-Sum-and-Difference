module fullAdder( //General Purpose Full Adder
    input SWB, SWA, carryin,
    output sum, carryout
 );
    
    assign sum = SWB ^ SWA ^ carryin;
    assign carryout = (SWB & SWA) | (carryin & (SWB ^ SWA));
endmodule

module btoc( //Binary to 2's Complement (4Bit) (Also works in reverse as ctob)
    input SWD, SWC, SWB, SWA,
    output SW2D, SW2C, SW2B, SW2A
);
    
    wire sum0, carry0, sum1, carry1, sum2, carry2, sum3, carry3;
    
    fullAdder btoc0 (
        .SWA(~SWA),
        .SWB(1'b1),
        .carryin(1'b0),
        .sum(sum0),
        .carryout(carry0)
    );
    
    assign SW2A = sum0;
    
    fullAdder btoc1 (
        .SWA(~SWB),
        .SWB(1'b0),
        .carryin(carry0),
        .sum(sum1),
        .carryout(carry1)
    );
    
    assign SW2B = sum1;
    
    fullAdder btoc2 (
        .SWA(~SWC),
        .SWB(1'b0),
        .carryin(carry1),
        .sum(sum2),
        .carryout(carry2)
    );
    
    assign SW2C = sum2;
    
    fullAdder btoc3 (
        .SWA(~SWD),
        .SWB(1'b0),
        .carryin(carry2),
        .sum(sum3),
        .carryout(carry3)
    );
    
    assign SW2D = sum3;

endmodule

module grayconversion(
    input [3:0] raw,
    output [3:0] gray
);
    assign gray[3] = raw[3];
    assign gray[2] = raw[3] ^ raw[2];
    assign gray[1] = raw[2] ^ raw[1];
    assign gray[0] = raw[1] ^ raw[0];

endmodule

module circuit(
    input SWa1, SWa0, SWb1, SWb0, BTN0,
    output LED0, LED1, LED2, LED3
);
    
    wire [3:0] sum;
    wire [3:0] carry;
    
    fullAdder FA1 (
        .SWA(SWa0),
        .SWB(SWb0),
        .carryin(1'b0),
        .sum(sum[0]),
        .carryout(carry[0])
    );
    
    fullAdder FA2 (
        .SWA(SWa1),
        .SWB(SWb1),
        .carryin(carry[0]),
        .sum(sum[1]),
        .carryout(carry[1])
    );
    
    
    wire [3:0] comp; //2's Complement of b
    wire [3:0] sum2;
    wire [3:0] carry2;
    wire [3:0] diff; //Binary
    
    btoc btocB ( //Converts SWb1 and SWb0 to 2's Complement
        .SWD(1'b0),
        .SWC(1'b0),
        .SWB(SWb1),
        .SWA(SWb0),
        .SW2D(comp[3]),
        .SW2C(comp[2]),
        .SW2B(comp[1]),
        .SW2A(comp[0])
    );
    
    fullAdder FAd0(
        .SWA(SWa0),
        .SWB(comp[0]),
        .carryin(1'b0),
        .sum(sum2[0]),
        .carryout(carry2[0])
    );
    
    fullAdder FAd1(
        .SWA(SWa1),
        .SWB(comp[1]),
        .carryin(carry2[0]),
        .sum(sum2[1]),
        .carryout(carry2[1])
    );
    
    fullAdder FAd2(
        .SWA(1'b0),
        .SWB(comp[2]),
        .carryin(carry2[1]),
        .sum(sum2[2]),
        .carryout(carry2[2])
    );
    
    fullAdder FAd3(
        .SWA(1'b0),
        .SWB(comp[3]),
        .carryin(carry2[2]),
        .sum(sum2[3]),
        .carryout(carry2[3])
    );
    
    btoc ctobB( //Convert 2's FA back to binary
        .SWA(sum2[0]),
        .SWB(sum2[1]),
        .SWC(sum2[2]),
        .SWD(sum2[3]),
        .SW2A(diff[0]),
        .SW2B(diff[1]),
        .SW2C(diff[2]),
        .SW2D(diff[3])module fullAdder( //General Purpose Full Adder
    input SWB, SWA, carryin,
    output sum, carryout
 );
    
    assign sum = SWB ^ SWA ^ carryin;
    assign carryout = (SWB & SWA) | (carryin & (SWB ^ SWA));
endmodule

module btoc( //Binary to 2's Complement (4Bit) (Also works in reverse as ctob)
    input SWD, SWC, SWB, SWA,
    output SW2D, SW2C, SW2B, SW2A
);
    
    wire sum0, carry0, sum1, carry1, sum2, carry2, sum3, carry3;
    
    fullAdder btoc0 (
        .SWA(~SWA),
        .SWB(1'b1),
        .carryin(1'b0),
        .sum(sum0),
        .carry(carry0)
    );
    
    assign SW2A = sum0;
    
    fullAdder btoc1 (
        .SWA(~SWB),
        .SWB(1'b0),
        .carryin(carry0),
        .sum(sum1),
        .carry(carry1)
    );
    
    assign SW2B = sum1;
    
    fullAdder btoc2 (
        .SWA(~SWC),
        .SWB(1'b0),
        .carryin(carry1),
        .sum(sum2),
        .carry(carry2)
    );
    
    assign SW2C = sum2;
    
    fullAdder btoc3 (
        .SWA(~SWD),
        .SWB(1'b0),
        .carryin(carry2),
        .sum(sum3),
        .carry(carry3)
    );
    
    assign SW2D = sum3;

endmodule

module circuit(
    input SWa1, SWa0, SWb1, SWb0, BTN0,
    output LED0, LED1, LED2, LED3
);
    
    wire [3:0] sum;
    wire [3:0] carry;
    
    fullAdder FA1 (
        .SWA(SWa0),
        .SWB(SWb0),
        .carryin(1'b0),
        .sum(sum[0]),
        .carryout(carry[0])
    );
    
    fullAdder FA2 (
        .SWA(SWa1),
        .SWB(SWb1),
        .carryin(carry[0]),
        .sum(sum[1]),
        .carryout(carry[1])
    );
    
    
    wire [3:0] comp; //2's Complement of b
    wire [3:0] sum2;
    wire [3:0] carry2;
    wire [3:0] diff; //Binary
    
    btoc btocB ( //Converts SWb1 and SWb0 to 2's Complement
        .SWD(1'b0),
        .SWC(1'b0),
        .SWB(SWb1),
        .SWA(SWb0),
        .SW2D(comp[3]),
        .SW2C(comp[2]),
        .SW2B(comp[1]),
        .SW2A(comp[0])
    );
    
    fullAdder FAd0(
        .SWA(SWa0),
        .SWB(comp[0]),
        .carryin(1'b0),
        .sum(sum2[0]),
        .carryout(carry2[0])
    );
    
    fullAdder FAd1(
        .SWA(SWa1),
        .SWB(comp[1]),
        .carryin(carry2[0]),
        .sum(sum2[1]),
        .carryout(carry2[1])
    );
    
    fullAdder FAd2(
        .SWA(1'b0),
        .SWB(comp[2]),
        .carryin(carry2[1]),
        .sum(sum2[2]),
        .carryout(carry2[2])
    );
    
    fullAdder FAd3(
        .SWA(1'b0),
        .SWB(comp[3]),
        .carryin(carry2[2]),
        .sum(sum2[3]),
        .carryout(carry2[3])
    );
    
    btoc ctobB( //Convert 2's FA back to binary
        .SWA(sum2[0]),
        .SWB(sum2[1]),
        .SWC(sum2[2]),
        .SWD(sum2[3]),
        .SW2A(diff[0]),
        .SW2B(diff[1]),
        .SW2C(diff[2]),
        .SW2D(diff[3])
    );
    
    assign LED0 = BTN0 ? diff[0] : sum[0];
    assign LED1 = BTN0 ? diff[1] : sum[1];
    assign LED2 = BTN0 ? diff[2] : carry[1];
    assign LED3 = BTN0 ? sum2[3] : 1'b0;

endmodule

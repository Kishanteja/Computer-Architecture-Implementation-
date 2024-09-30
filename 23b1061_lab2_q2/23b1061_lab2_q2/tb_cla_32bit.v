`timescale 1ns/1ps

module tb_cla_32bit;

parameter N = 32;     /*Change this to 16 if you want to test CLA 16-bit*/

// declare your signals as reg or wire
reg [N-1:0] a, b;
reg cin;
wire [N-1:0] S;
wire cout, Pout, Gout;

initial begin

// write the stimuli conditions
a = 32'b00000000000000000000000000000000;
b = 32'b00000000000000000000000000000000;
cin = 1'b0;
#10

a = 32'00000000000000000000000000000000;
b = 32'00000000000000000000000000000001;
cin = 1'b0;
#10
$finish;
end

CLA_32bit dut (.a(a), .b(b), .cin(cin), .sum(S), .cout(cout), .Pout(Pout), .Gout(Gout));


initial begin
    $dumpfile("cla_32bit.vcd");
    $dumpvars(0, tb_cla_32bit);
end

endmodule

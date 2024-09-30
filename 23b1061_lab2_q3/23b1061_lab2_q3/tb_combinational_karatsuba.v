`timescale 1ns/1ps

module tb_combinational_karatsuba;

parameter N = 16;

// declare your signals as reg or wire
reg [N-1:0] X, Y;
wire [2*N-1:0] Z;

initial begin
$monitor("X = %b, Y = %b, Z = %b", X, Y, Z);
// write the stimuli conditions
X = 16'b0000000000000001; Y = 16'b0000000000000001; #10;
X = 16'b1111111111111111; Y = 16'b1111111111111111; #10;
end

karatsuba_16 dut (.X(X), .Y(Y), .Z(Z));

initial begin
    $dumpfile("combinational_karatsuba.vcd");
    $dumpvars(0, tb_combinational_karatsuba);
end

endmodule

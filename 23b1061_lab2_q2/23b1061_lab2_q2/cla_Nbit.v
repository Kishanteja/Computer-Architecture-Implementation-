module CLA_4bit(input [3:0] a,input [3:0] b,input cin, output [3:0] sum, output cout);
wire P0, P1, P2, P3;
wire G0, G1, G2, G3;
wire C1, C2, C3, C4;

assign G0 = a[0] & b[0];
assign G1 = a[1] & b[1];
assign G2 = a[2] & b[2];
assign G3 = a[3] & b[3];
assign P0 = a[0] ^ b[0];
assign P1 = a[1] ^ b[1];
assign P2 = a[2] ^ b[2];
assign P3 = a[3] ^ b[3];

assign C1 = G0 | (P0 & cin);
assign C2 = G1 | (P1 & C1);
assign C3 = G2 | (P2 & C2);
assign C4 = G3 | (P3 & C3);

assign sum = {P3 ^ C3, P2 ^ C2, P1 ^ C1, P0 ^ cin};
assign cout = C4;
endmodule


module CLA_4bit_P_G(input [3:0] a, b, input cin, output [3:0] sum, output P, G);
wire P0, P1, P2, P3;
wire G0, G1, G2, G3;
wire C1, C2, C3, C4;

assign G0 = a[0] & b[0];
assign G1 = a[1] & b[1];
assign G2 = a[2] & b[2];
assign G3 = a[3] & b[3];
assign P0 = a[0] ^ b[0];
assign P1 = a[1] ^ b[1];
assign P2 = a[2] ^ b[2];
assign P3 = a[3] ^ b[3];

assign C1 = G0 | (P0 & cin);
assign C2 = G1 | (P1 & C1);
assign C3 = G2 | (P2 & C2);
assign C4 = G3 | (P3 & C3);

assign P = P0 & P1 & P2 & P3;
assign G = G3 | (P3 & G2) | (P3 & P2 & G1) | (P3 & P2 & P1 & G0);
assign sum = {P3 ^ C3, P2 ^ C2, P1 ^ C1, P0 ^ cin};
endmodule


module lookahead_carry_unit_16_bit( 
input P0, G0, P1, G1, P2, G2, P3, G3,input cin,
output C4, C8, C12, C16, GF, PF);

assign C4 = G0 | (P0 & cin);
assign C8 = G1 | (P1 & C4);
assign C12 = G2 | (P2 & C8);
assign C16 = G3 | (P3 & C12);

assign PF = P0 & P1 & P2 & P3;
assign GF = G3 | (P3 & G2) | (P3 & P2 & G1) | (P3 & P2 & P1 & G0);
endmodule


module CLA_16bit(input [15:0] a, b, input cin, output [15:0] sum, output cout, output Pout, Gout);

wire P0, P1, P2, P3;
wire G0, G1, G2, G3;
wire C4, C8, C12, C16;

CLA_4bit_P_G CLA0 (a[3:0], b[3:0], cin, sum[3:0], P0, G0);
CLA_4bit_P_G CLA1 (a[7:4], b[7:4], C4, sum[7:4], P1, G1);
CLA_4bit_P_G CLA2 (a[11:8], b[11:8], C8, sum[11:8], P2, G2);
CLA_4bit_P_G CLA3 (a[15:12], b[15:12], C12, sum[15:12], P3, G3);

lookahead_carry_unit_16_bit LCU16 (P0, G0, P1, G1, P2, G2, P3, G3, cin, C4, C8, C12, C16, Gout, Pout);
assign cout = C16;
endmodule


module CLA_32bit(input [31:0] a, b, input cin, output [31:0] sum, output cout, output Pout, Gout);

wire P0, P1;
wire G0, G1;
wire C16, C32;

CLA_16bit CLA0 (a[15:0], b[15:0], cin, sum[15:0], C16, P0, G0);
CLA_16bit CLA1 (a[31:16], b[31:16], C16, sum[31:16], C32, P1, G1);

lookahead_carry_unit_32_bit LCU32 (P0, G0, P1, G1, cin, C16, C32, Gout, Pout);
assign cout = C32;
endmodule

module lookahead_carry_unit_32_bit (input P0, G0, P1, G1, input cin, output C16, C32, output GF, PF);

assign C16 = G0 | (P0 & cin);
assign C32 = G1 | (P1 & C16);

assign PF = P0 & P1;
assign GF = G1 | (P1 & G0);
endmodule


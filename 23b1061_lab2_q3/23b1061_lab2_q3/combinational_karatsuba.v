module adder_2bit(
    input [1:0] A, B,
    output [3:0] sum
);

wire carry;

assign sum[0] = A[0] ^ B[0];
assign carry = A[0] & B[0];
assign sum[1] = A[1] ^ B[1] ^ carry;
assign sum[2] = (A[1] & B[1]) | (carry & (A[1] ^ B[1]));
assign sum[3] = 0;
endmodule

module adder_4bit(
    input [3:0] A, B,
    output [4:0] sum
);

wire [3:0] carry;

assign sum[0] = A[0] ^ B[0];
assign carry[0] = A[0] & B[0];
assign sum[1] = A[1] ^ B[1] ^ carry[0];
assign carry[1] = (A[1] & B[1]) | (carry[0] & (A[1] ^ B[1]));
assign sum[2] = A[2] ^ B[2] ^ carry[1];
assign carry[2] = (A[2] & B[2]) | (carry[1] & (A[2] ^ B[2]));
assign sum[3] = A[3] ^ B[3] ^ carry[2];
assign carry[3] = (A[3] & B[3]) | (carry[2] & (A[3] ^ B[3]));
assign sum[4] = carry[3];
endmodule

module adder_8bit(
    input [7:0] A, B,
    output [8:0] sum
);

wire [7:0] carry;

assign sum[0] = A[0] ^ B[0];
assign carry[0] = A[0] & B[0];
assign sum[1] = A[1] ^ B[1] ^ carry[0];
assign carry[1] = (A[1] & B[1]) | (carry[0] & (A[1] ^ B[1]));
assign sum[2] = A[2] ^ B[2] ^ carry[1];
assign carry[2] = (A[2] & B[2]) | (carry[1] & (A[2] ^ B[2]));
assign sum[3] = A[3] ^ B[3] ^ carry[2];
assign carry[3] = (A[3] & B[3]) | (carry[2] & (A[3] ^ B[3]));
assign sum[4] = A[4] ^ B[4] ^ carry[3];
assign carry[4] = (A[4] & B[4]) | (carry[3] & (A[4] ^ B[4]));
assign sum[5] = A[5] ^ B[5] ^ carry[4];
assign carry[5] = (A[5] & B[5]) | (carry[4] & (A[5] ^ B[5]));
assign sum[6] = A[6] ^ B[6] ^ carry[5];
assign carry[6] = (A[6] & B[6]) | (carry[5] & (A[6] ^ B[6]));
assign sum[7] = A[7] ^ B[7] ^ carry[6];
assign carry[7] = (A[7] & B[7]) | (carry[6] & (A[7] ^ B[7]));
assign sum[8] = carry[7];
endmodule

module adder_16bit(
    input [15:0] A, B,
    output [16:0] sum
);

wire [15:0] carry;

assign sum[0] = A[0] ^ B[0];
assign carry[0] = A[0] & B[0];
assign sum[1] = A[1] ^ B[1] ^ carry[0];
assign carry[1] = (A[1] & B[1]) | (carry[0] & (A[1] ^ B[1]));
assign sum[2] = A[2] ^ B[2] ^ carry[1];
assign carry[2] = (A[2] & B[2]) | (carry[1] & (A[2] ^ B[2]));
assign sum[3] = A[3] ^ B[3] ^ carry[2];
assign carry[3] = (A[3] & B[3]) | (carry[2] & (A[3] ^ B[3]));
assign sum[4] = A[4] ^ B[4] ^ carry[3];
assign carry[4] = (A[4] & B[4]) | (carry[3] & (A[4] ^ B[4]));
assign sum[5] = A[5] ^ B[5] ^ carry[4];
assign carry[5] = (A[5] & B[5]) | (carry[4] & (A[5] ^ B[5]));
assign sum[6] = A[6] ^ B[6] ^ carry[5];
assign carry[6] = (A[6] & B[6]) | (carry[5] & (A[6] ^ B[6]));
assign sum[7] = A[7] ^ B[7] ^ carry[6];
assign carry[7] = (A[7] & B[7]) | (carry[6] & (A[7] ^ B[7]));
assign sum[8] = A[8] ^ B[8] ^ carry[7];
assign carry[8] = (A[8] & B[8]) | (carry[7] & (A[8] ^ B[8]));
assign sum[9] = A[9] ^ B[9] ^ carry[8];
assign carry[9] = (A[9] & B[9]) | (carry[8] & (A[9] ^ B[9]));
assign sum[10] = A[10] ^ B[10] ^ carry[9];
assign carry[10] = (A[10] & B[10]) | (carry[9] & (A[10] ^ B[10]));
assign sum[11] = A[11] ^ B[11] ^ carry[10];
assign carry[11] = (A[11] & B[11]) | (carry[10] & (A[11] ^ B[11]));
assign sum[12] = A[12] ^ B[12] ^ carry[11];
assign carry[12] = (A[12] & B[12]) | (carry[11] & (A[12] ^ B[12]));
assign sum[13] = A[13] ^ B[13] ^ carry[12];
assign carry[13] = (A[13] & B[13]) | (carry[12] & (A[13] ^ B[13]));
assign sum[14] = A[14] ^ B[14] ^ carry[13];
assign carry[14] = (A[14] & B[14]) | (carry[13] & (A[14] ^ B[14]));
assign sum[15] = A[15] ^ B[15] ^ carry[14];
assign sum[16] = (A[15] & B[15]) | (carry[14] & (A[15] ^ B[15]));
endmodule

module subtractor_2bit(
    input [1:0] A, B,
    output [3:0] diff
);

wire borrow;

assign diff[0] = A[0] ^ B[0];
assign borrow = ~A[0] & B[0];
assign diff[1] = A[1] ^ B[1] ^ borrow;
assign diff[2] = (~A[1] & B[1]) | (borrow & ~(A[1] ^ B[1]));
assign diff[3] = 0;
endmodule

module subtractor_4bit(
    input [3:0] A, B,
    output [4:0] diff
);

wire [3:0] borrow;

assign diff[0] = A[0] ^ B[0];
assign borrow[0] = ~A[0] & B[0];
assign diff[1] = A[1] ^ B[1] ^ borrow[0];
assign borrow[1] = (~A[1] & B[1]) | (borrow[0] & ~(A[1] ^ B[1]));
assign diff[2] = A[2] ^ B[2] ^ borrow[1];
assign borrow[2] = (~A[2] & B[2]) | (borrow[1] & ~(A[2] ^ B[2]));
assign diff[3] = A[3] ^ B[3] ^ borrow[2];
assign diff[4] = (~A[3] & B[3]) | (borrow[2] & ~(A[3] ^ B[3]));
endmodule

module subtractor_8bit(
    input [7:0] A, B,
    output [8:0] diff
);

wire [7:0] borrow;

assign diff[0] = A[0] ^ B[0];
assign borrow[0] = ~A[0] & B[0];
assign diff[1] = A[1] ^ B[1] ^ borrow[0];
assign borrow[1] = (~A[1] & B[1]) | (borrow[0] & ~(A[1] ^ B[1]));
assign diff[2] = A[2] ^ B[2] ^ borrow[1];
assign borrow[2] = (~A[2] & B[2]) | (borrow[1] & ~(A[2] ^ B[2]));
assign diff[3] = A[3] ^ B[3] ^ borrow[2];
assign borrow[3] = (~A[3] & B[3]) | (borrow[2] & ~(A[3] ^ B[3]));
assign diff[4] = A[4] ^ B[4] ^ borrow[3];
assign borrow[4] = (~A[4] & B[4]) | (borrow[3] & ~(A[4] ^ B[4]));
assign diff[5] = A[5] ^ B[5] ^ borrow[4];
assign borrow[5] = (~A[5] & B[5]) | (borrow[4] & ~(A[5] ^ B[5]));
assign diff[6] = A[6] ^ B[6] ^ borrow[5];
assign borrow[6] = (~A[6] & B[6]) | (borrow[5] & ~(A[6] ^ B[6]));
assign diff[7] = A[7] ^ B[7] ^ borrow[6];
assign diff[8] = (~A[7] & B[7]) | (borrow[6] & ~(A[7] ^ B[7]));
endmodule

module subtractor_16bit(
    input [15:0] A, B,
    output [16:0] diff
);

wire [15:0] borrow;
    
assign diff[0] = A[0] ^ B[0];
assign borrow[0] = ~A[0] & B[0];
assign diff[1] = A[1] ^ B[1] ^ borrow[0];
assign borrow[1] = (~A[1] & B[1]) | (borrow[0] & ~(A[1] ^ B[1]));    
assign diff[2] = A[2] ^ B[2] ^ borrow[1];
assign borrow[2] = (~A[2] & B[2]) | (borrow[1] & ~(A[2] ^ B[2]));
assign diff[3] = A[3] ^ B[3] ^ borrow[2];
assign borrow[3] = (~A[3] & B[3]) | (borrow[2] & ~(A[3] ^ B[3]));
assign diff[4] = A[4] ^ B[4] ^ borrow[3];
assign borrow[4] = (~A[4] & B[4]) | (borrow[3] & ~(A[4] ^ B[4]));
assign diff[5] = A[5] ^ B[5] ^ borrow[4];
assign borrow[5] = (~A[5] & B[5]) | (borrow[4] & ~(A[5] ^ B[5]));
assign diff[6] = A[6] ^ B[6] ^ borrow[5];
assign borrow[6] = (~A[6] & B[6]) | (borrow[5] & ~(A[6] ^ B[6]));
assign diff[7] = A[7] ^ B[7] ^ borrow[6];
assign borrow[7] = (~A[7] & B[7]) | (borrow[6] & ~(A[7] ^ B[7]));
assign diff[8] = A[8] ^ B[8] ^ borrow[7];
assign borrow[8] = (~A[8] & B[8]) | (borrow[7] & ~(A[8] ^ B[8]));
assign diff[9] = A[9] ^ B[9] ^ borrow[8];
assign borrow[9] = (~A[9] & B[9]) | (borrow[8] & ~(A[9] ^ B[9]));
assign diff[10] = A[10] ^ B[10] ^ borrow[9];
assign borrow[10] = (~A[10] & B[10]) | (borrow[9] & ~(A[10] ^ B[10]));
assign diff[11] = A[11] ^ B[11] ^ borrow[10];
assign borrow[11] = (~A[11] & B[11]) | (borrow[10] & ~(A[11] ^ B[11]));
assign diff[12] = A[12] ^ B[12] ^ borrow[11];
assign borrow[12] = (~A[12] & B[12]) | (borrow[11] & ~(A[12] ^ B[12]));
assign diff[13] = A[13] ^ B[13] ^ borrow[12];
assign borrow[13] = (~A[13] & B[13]) | (borrow[12] & ~(A[13] ^ B[13]));
assign diff[14] = A[14] ^ B[14] ^ borrow[13];
assign borrow[14] = (~A[14] & B[14]) | (borrow[13] & ~(A[14] ^ B[14]));
assign diff[15] = A[15] ^ B[15] ^ borrow[14];
assign diff[16] = (~A[15] & B[15]) | (borrow[14] & ~(A[15] ^ B[15]));    
endmodule

module multiplier_2bit(
    input [1:0] A, B,
    output [3:0] P  
);
wire p0, p1, p2, p3;
wire carry1, carry2;

assign p0 = A[0] & B[0];
assign p1 = A[1] & B[0];
assign p2 = A[0] & B[1];
assign p3 = A[1] & B[1];

assign P[0] = p0;
assign P[1] = p1 ^ p2;
assign carry1 = p1 & p2;
assign P[2] = p3 ^ carry1;
assign carry2 = p3 & carry1;
assign P[3] = carry2;
endmodule

module multiplier_4bit(
    input [3:0] A, B,
    output [7:0] P  
);

wire [3:0] P0, P1, P2, P3;
wire [7:0] sum1, sum2;

multiplier_2bit mul0 (.A(A[1:0]), .B(B[1:0]), .P(P0));
multiplier_2bit mul1 (.A(A[3:2]), .B(B[1:0]), .P(P1));
multiplier_2bit mul2 (.A(A[1:0]), .B(B[3:2]), .P(P2));
multiplier_2bit mul3 (.A(A[3:2]), .B(B[3:2]), .P(P3));

adder_4bit add1 (.A(P1[3:0]), .B(P2[3:0]), .sum(sum1));
adder_4bit add2 (.A(sum1[3:0]), .B(P3[3:0]), .sum(sum2));

assign P[3:0] = P0;
assign P[7:4] = sum2[3:0] + (P3[7:4] << 2);
endmodule

module multiplier_8bit(
    input [7:0] A, B,
    output [15:0] P  
);

wire [7:0] P0, P1, P2, P3;
wire [15:0] sum1, sum2;

multiplier_4bit mul0 (.A(A[3:0]), .B(B[3:0]), .P(P0));
multiplier_4bit mul1 (.A(A[7:4]), .B(B[3:0]), .P(P1));
multiplier_4bit mul2 (.A(A[3:0]), .B(B[7:4]), .P(P2));
multiplier_4bit mul3 (.A(A[7:4]), .B(B[7:4]), .P(P3));

adder_8bit add1 (.A(P1[7:0]), .B(P2[7:0]), .sum(sum1));
adder_8bit add2 (.A(sum1[7:0]), .B(P3[7:0]), .sum(sum2));

assign P[7:0] = P0;
assign P[15:8] = sum2[7:0] + (P3[15:8] << 4);
endmodule

module karatsuba_4(
    input [3:0] X, Y,
    output [7:0] Z
);

wire [1:0] X0, X1, Y0, Y1;
wire [3:0] Z0, Z2, Z1;
wire [3:0] sum_X, sum_Y;
wire [3:0] sub_Z1_Z0_Z2;

assign X0 = X[1:0];
assign X1 = X[3:2];
assign Y0 = Y[1:0];
assign Y1 = Y[3:2];

multiplier_2bit mul0 (.A(X0), .B(Y0), .P(Z0));
multiplier_2bit mul1 (.A(X1), .B(Y1), .P(Z2));

adder_2bit add1 (.A(X0), .B(X1), .sum(sum_X));
adder_2bit add2 (.A(Y0), .B(Y1), .sum(sum_Y));

multiplier_2bit mul2 (.A(sum_X), .B(sum_Y), .P(Z1));

wire [3:0] Z1_minus_Z0;
subtractor_4bit sub1 (.A(Z1), .B(Z0), .diff(Z1_minus_Z0));
subtractor_4bit sub2 (.A(Z1_minus_Z0), .B(Z2), .diff(sub_Z1_Z0_Z2));

assign Z = (Z2 << 4) + (sub_Z1_Z0_Z2 << 2) + Z0;
endmodule

module karatsuba_8(
    input [7:0] X, Y,
    output [15:0] Z
);

wire [3:0] X0, X1, Y0, Y1;
wire [7:0] Z0, Z2, Z1;
wire [7:0] sum_X, sum_Y;
wire [7:0] sub_Z1_Z0_Z2;

assign X0 = X[3:0];
assign X1 = X[7:4];
assign Y0 = Y[3:0];
assign Y1 = Y[7:4];

karatsuba_4 mul0 (.X(X0), .Y(Y0), .Z(Z0));
karatsuba_4 mul1 (.X(X1), .Y(Y1), .Z(Z2));

adder_4bit add1 (.A(X0), .B(X1), .sum(sum_X));
adder_4bit add2 (.A(Y0), .B(Y1), .sum(sum_Y));

karatsuba_4 mul2 (.X(sum_X), .Y(sum_Y), .Z(Z1));

subtractor_8bit sub1 (.A(Z1[7:4]), .B(Z0[7:4]), .diff(sub_Z1_Z0_Z2[7:4]));
subtractor_8bit sub2 (.A(sub_Z1_Z0_Z2[7:4]), .B(Z2[7:4]), .diff(sub_Z1_Z0_Z2[7:4]));

assign Z = (Z2 << 8) + (sub_Z1_Z0_Z2 << 4) + Z0;
endmodule

module karatsuba_16(
    input [15:0] X, Y,
    output [31:0] Z
);

wire [7:0] X0, X1, Y0, Y1;
wire [15:0] Z0, Z2, Z1;
wire [15:0] sum_X, sum_Y;
wire [15:0] sub_Z1_Z0_Z2;

assign X0 = X[7:0];
assign X1 = X[15:8];
assign Y0 = Y[7:0];
assign Y1 = Y[15:8];

karatsuba_8 mul0 (.X(X0), .Y(Y0), .Z(Z0));
karatsuba_8 mul1 (.X(X1), .Y(Y1), .Z(Z2));

adder_8bit add1 (.A(X0), .B(X1), .sum(sum_X));
adder_8bit add2 (.A(Y0), .B(Y1), .sum(sum_Y));

karatsuba_8 mul2 (.X(sum_X), .Y(sum_Y), .Z(Z1));

subtractor_16bit sub1 (.A(Z1[15:8]), .B(Z0[15:8]), .diff(sub_Z1_Z0_Z2[15:8]));
subtractor_16bit sub2 (.A(sub_Z1_Z0_Z2[15:8]), .B(Z2[15:8]), .diff(sub_Z1_Z0_Z2[15:8]));

assign Z = (Z2 << 16) + (sub_Z1_Z0_Z2 << 8) + Z0;
endmodule

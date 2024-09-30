module karatsuba_16 (
    input wire[15:0] X,
    input wire[15:0] Y,
    output wire[31:0] Z
);

karatsuba #(.N(16)) K( .X(X), .Y(Y), .Z(Z)) ;    
endmodule

module karatsuba #(parameter N=16) (
    input wire[N-1:0] X ,
    input wire[N-1:0] Y ,
    output wire[2*N-1:0] Z
) ;
// Let us use recursion.
// N is power of 2 obviously.
// Base case N=1
if (N==1) begin
    assign Z = X&Y ;
end else begin
    
    // Divide into 2 parts.
    wire[N/2-1:0] X_high = X[N-1:N/2] ;
    wire[N/2-1:0] X_low = X[N/2-1:0] ;
    wire[N/2-1:0] Y_high = Y[N-1:N/2] ;
    wire[N/2-1:0] Y_low = Y[N/2-1:0] ;

    // Compute z1 = x_high*y_high and z2 = x_low*y_low
    // Compute z3 = x_high*y_low + x_low*y_high
    // final Z = {z1,16'b0}+{z3,8'b0}+z2 for N=16.
    wire[N-1:0] z1, z2, z31, z32 ; // z31 and z32 are the two terms in z3.

    karatsuba #(.N(N/2)) U1(.X(X_high),.Y(Y_high),.Z(z1)) ;
    karatsuba #(.N(N/2)) U2(.X(X_low),.Y(Y_low),.Z(z2)) ;
    karatsuba #(.N(N/2)) U3(.X(X_high),.Y(Y_low),.Z(z31)) ;
    karatsuba #(.N(N/2)) U4(.X(X_low),.Y(Y_high),.Z(z32)) ;

    // Now we need to add them using a normal rca adder. Name it RCA.
    // First add z31 and z32 but before adding concatenate them with N/2 zeroes. This is because both of them are N size and we multiply there 
    // sum by 2^(N/2) finally. Hence we need another N/2 zeroes in the left to make size 2N.

    wire[3*N/2-1:0] z3 ;
    RCA #(.N(3*N/2)) R1(.a( {{(N/2){1'b0}}, z31 } ), .b( {{(N/2){1'b0}}, z32} ), .cin(1'b0), .S(z3), .cout()) ; 
    // I have used concatenation using {} syntax. This is just adding some additional 0 inputs and the code remains hierarchical/structural.
    
    // Now add to get final product. First add z1 and z2 to get z
    wire[2*N-1:0] z;
    RCA #(.N(2*N)) R2(.a( { z1 ,{(N){1'b0}}} ), .b( {{(N){1'b0}}, z2 } ), .cin(1'b0), .S(z), .cout()) ;

    // Final addition.
    RCA #(.N(2*N)) R3(.a( z ), .b({ z3, {(N/2){1'b0}} }), .cin(1'b0), .S(Z), .cout()) ;
end
endmodule


// Half adder.
module half_adder(
    input wire a,
    input wire b,
    output wire S,
    output wire cout
) ;
// Design the logic.

assign S = a^b ; // ^ is xor.
assign cout = a&b ;

endmodule

// Design the full adder.
module full_adder(
    input wire a,
    input wire b,
    input wire cin,
    output wire S,
    output wire cout
) ;
// Design the logic.

wire S1, C1, C2 ;

half_adder U1(
    .a(a),
    .b(b),
    .S(S1),
    .cout(C1)
) ;

half_adder U2(
    .a(S1),
    .b(cin),
    .S(S),
    .cout(C2)
) ;

assign cout = C1 | C2 ;

endmodule

// Design RCA using full adder.
module RCA #(parameter N = 32) (
    input wire [N-1:0] a,
    input wire [N-1:0] b,
    input wire cin,
    output wire [N-1:0] S,
    output wire cout
) ;
wire [N:0] carry ;
assign carry[0] = cin ;

// generate block.
generate
    for(genvar i = 0; i<N; i=i+1) begin
        full_adder rca(
            .a(a[i]),
            .b(b[i]),
            .cin(carry[i]),
            .S(S[i]),
            .cout(carry[i+1])
        ) ;
    end
endgenerate

assign cout = carry[N] ;

endmodule


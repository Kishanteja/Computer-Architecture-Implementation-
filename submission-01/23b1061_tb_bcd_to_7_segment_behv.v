module testbench;
    reg x1, x2, x3, x4;
    wire A, B, C, D, E, F, G;

    bcd_to_7 uut (
        .x1(x1), .x2(x2), .x3(x3), .x4(x4),
        .A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .G(G) 
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, testbench); 

        $monitor("Time=%0t : x1=%b x2=%b x3=%b x4=%b => A=%b B=%b C=%b D=%b E=%b F=%b G=%b", $time, x1, x2, x3, x4, A, B, C, D, E, F, G);
        $display("Devangam Kishan teja - 23b1061");

        // Apply test cases to the BCD input
        x1 = 0; x2 = 0; x3 = 0; x4 = 0; #10;
        x1 = 0; x2 = 0; x3 = 0; x4 = 1; #10;
        x1 = 0; x2 = 0; x3 = 1; x4 = 0; #10;
        x1 = 0; x2 = 0; x3 = 1; x4 = 1; #10;
        x1 = 0; x2 = 1; x3 = 0; x4 = 0; #10;
        x1 = 0; x2 = 1; x3 = 0; x4 = 1; #10;
        x1 = 0; x2 = 1; x3 = 1; x4 = 0; #10;
        x1 = 0; x2 = 1; x3 = 1; x4 = 1; #10;
        x1 = 1; x2 = 0; x3 = 0; x4 = 0; #10;
        x1 = 1; x2 = 0; x3 = 0; x4 = 1; #10;

        $finish;
    end
endmodule


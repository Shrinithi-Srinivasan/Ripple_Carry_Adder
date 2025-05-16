module ripple_carry_adder_tb_top;
  reg [3:0] a, b;
  reg cin;
  wire [3:0] sum;
  wire cout;
  ripple_carry_adder rca_inst (.a(a),.b(b), .cin(cin),.sum(sum),.cout(cout));
  initial begin
    a = 4'b0000;b = 4'b0000;cin = 1'b0;
    #10 a = 4'b0001; b = 4'b0010; cin = 1'b0; // 1 + 2 = 3
    #10 a = 4'b1010; b = 4'b0101; cin = 1'b0; // 10 + 5 = 15
    #10 a = 4'b1111; b = 4'b0001; cin = 1'b0; // 15 + 1 = 16
    #10 a = 4'b1001; b = 4'b0110; cin = 1'b1; // 9 + 6 + 1 = 16
    #10 a = 4'b0111; b = 4'b0111; cin = 1'b0; // 7 + 7 = 14
    $display("Time=%0t | a=%b, b=%b, cin=%b | sum=%b, cout=%b", $time, a, b, cin, sum, cout);
    $monitor("Monitor: Time=%0t | a=%b, b=%b, cin=%b | sum=%b, cout=%b", $time, a, b, cin, sum, cout);
    #50 $finish;
  end
  initial begin
    $dumpfile("ripple_carry_adder.vcd");
    $dumpvars(1);
  end
endmodule

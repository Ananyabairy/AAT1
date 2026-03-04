module tb;
  logic clk = 0, rst, si, so;
  logic [3:0] qref;

  siso dut (.*);
  always #5 clk = ~clk;

  initial begin
    $dumpfile("siso.vcd");
    $dumpvars(0, tb);

    rst = 1; si = 0; qref = 0;
    #12 rst = 0;

    repeat (10) begin
      si = $urandom % 2;
      @(posedge clk);
      qref = {qref[2:0], si};
      #1;
      if (so !== qref[3])
        $error("Mismatch!");
    end
    $finish;
  end
endmodule

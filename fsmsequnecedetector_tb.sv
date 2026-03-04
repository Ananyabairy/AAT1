module tb;
  logic clk = 0, rst, in, out;
  always #5 clk = ~clk;

  fsm101 dut (.*);

  covergroup cg @(posedge clk);
    cp_state : coverpoint dut.state;
  endgroup
  cg cg_inst = new();

  initial begin
    $dumpfile("fsm.vcd");
    $dumpvars(0, tb);

    rst = 1; #10 rst = 0;
    in = 1; @(posedge clk);
    in = 0; @(posedge clk);
    in = 1; @(posedge clk);

    $display("Coverage = %0.2f%%", cg_inst.get_inst_coverage());
    $finish;
  end
endmodule

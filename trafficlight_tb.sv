module tb;
  logic clk = 0, rst;
  light_t color;

  always #5 clk = ~clk;
  traffic dut (.*);

  covergroup cg @(posedge clk);
    cp_color : coverpoint color {
      bins cycle = (RED => GREEN => YELLOW => RED);
    }
  endgroup
  cg cg_inst = new();

  initial begin
    $dumpfile("traffic.vcd");
    $dumpvars(0, tb);

    rst = 1; #10 rst = 0;
    repeat (10) @(posedge clk);

    $display("Coverage = %0.2f%%", cg_inst.get_inst_coverage());
    $finish;
  end
endmodule

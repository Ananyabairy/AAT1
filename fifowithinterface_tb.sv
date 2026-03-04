interface fifo_if (input logic clk);
  logic wr, rd;
  logic full, empty;
  logic [7:0] din;
endinterface

module tb;
  logic clk = 0;
  always #5 clk = ~clk;

  fifo_if vif (clk);

  fifo dut (
    .clk(clk),
    .wr(vif.wr),
    .rd(vif.rd),
    .din(vif.din),
    .full(vif.full),
    .empty(vif.empty)
  );

  covergroup cg_fifo @(posedge clk);
    cross_wr_full : cross vif.wr, vif.full;
  endgroup
  cg_fifo cg = new();

  initial begin
    $dumpfile("fifo.vcd");
    $dumpvars(0, tb);

    vif.wr = 1;
    repeat (18) begin
      vif.din = $urandom;
      @(posedge clk);
    end
    vif.wr = 0;

    $display("Coverage = %0.2f%%", cg.get_inst_coverage());
    $finish;
  end
endmodule

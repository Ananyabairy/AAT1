// Code your testbench here
module tb;

  logic a, b, y;

  // DUT instantiation
  andgate dut (.*);

  // Covergroup
  covergroup cg_and;
    cp_a : coverpoint a;
    cp_b : coverpoint b;
    cross_ab : cross cp_a, cp_b;
  endgroup

  // Covergroup object
  cg_and cg = new();

  // Waveform dump
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
  end

  // Stimulus
  initial begin
    repeat (20) begin
      a = $urandom_range(0,1);
      b = $urandom_range(0,1);
      #5;
      cg.sample();
    end

    $display("Final Coverage = %0.2f %%", cg.get_inst_coverage());
    $finish;
  end

endmodule

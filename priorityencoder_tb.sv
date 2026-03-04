module tb;
  logic [3:0] in;
  logic [1:0] out;
  logic valid;

  priorityenc dut (.*);

  covergroup cg_enc;
    cp_in : coverpoint in {
      bins b0 = {4'b0001};
      bins b1 = {4'b0010};
      bins b2 = {4'b0100};
      bins b3 = {4'b1000};
    }
  endgroup
  cg_enc cg = new();

  initial begin
    $dumpfile("enc.vcd");
    $dumpvars(0, tb);

    repeat (50) begin
      in = $urandom_range(0,15);
      #5;
      cg.sample();
    end

    $display("Coverage = %0.2f%%", cg.get_inst_coverage());
    $finish;
  end
endmodule

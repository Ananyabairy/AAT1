module fifo (
  input  logic clk,
  input  logic wr,
  input  logic rd,
  input  logic [7:0] din,
  output logic full,
  output logic empty
);
  logic [4:0] cnt = 0;

  assign full  = (cnt == 16);
  assign empty = (cnt == 0);

  always_ff @(posedge clk) begin
    if (wr && !full) cnt <= cnt + 1;
    else if (rd && !empty) cnt <= cnt - 1;
  end
endmodule

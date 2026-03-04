module siso (
  input  logic clk,
  input  logic rst,
  input  logic si,
  output logic so
);
  logic [3:0] q;
  assign so = q[3];

  always_ff @(posedge clk) begin
    if (rst)
      q <= 4'b0000;
    else
      q <= {q[2:0], si};
  end
endmodule

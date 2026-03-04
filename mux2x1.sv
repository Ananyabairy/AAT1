module mux2to1 (
  input  logic [7:0] a, b,
  input  logic sel,
  output logic [7:0] y
);
  assign y = sel ? b : a;
endmodule

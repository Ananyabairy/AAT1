module fsm101 (
  input  logic clk,
  input  logic rst,
  input  logic in,
  output logic out
);
  typedef enum logic [1:0] {S0, S1, S2} state_t;
  state_t state, next;

  always_ff @(posedge clk)
    if (rst) state <= S0;
    else state <= next;

  always_comb begin
    out = 0; next = state;
    case (state)
      S0: if (in) next = S1;
      S1: if (!in) next = S2;
      S2: if (in) begin out = 1; next = S1; end
          else next = S0;
    endcase
  end
endmodule

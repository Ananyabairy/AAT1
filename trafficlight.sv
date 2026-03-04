typedef enum logic [1:0] {RED, GREEN, YELLOW} light_t;

module traffic (
  input  logic clk,
  input  logic rst,
  output light_t color
);
  always_ff @(posedge clk)
    if (rst) color <= RED;
    else case (color)
      RED:    color <= GREEN;
      GREEN:  color <= YELLOW;
      YELLOW: color <= RED;
    endcase
endmodule

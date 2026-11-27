module name_fsm (
  input  logic rst,
  input  logic clk,
  input  logic [7:0] data,
  output logic y
);
  localparam [2:0] S0 = 3'b000,
                   S1 = 3'b001,
                   S2 = 3'b010,
                   S3 = 3'b011,
                   S4 = 3'b100;

  logic [2:0] state, next_state;

  always @(*) begin
    case (state)
      S0: next_state = (data == 8'h41) ? S1 : S0; // A
      S1: next_state = (data == 8'h52) ? S2 :     // R
                      (data == 8'h41) ? S1 : S0;
      S2: next_state = (data == 8'h54) ? S3 :     // T
                      (data == 8'h41) ? S1 : S0;
      S3: next_state = (data == 8'h45) ? S4 :     // E
                      (data == 8'h41) ? S1 : S0;
      S4: next_state = (data == 8'h41) ? S1 : S0;
      default: next_state = S0;
    endcase
  end

  always @(posedge clk) begin
    if (rst) state <= S0;
    else     state <= next_state;
  end

  assign y = (state == S4) && (data == 8'h4D); // M
endmodule

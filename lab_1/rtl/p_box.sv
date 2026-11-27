module p_box (
  input  logic [3:0] data,
  output logic [3:0] y
);
  assign y[3] = data[2];
  assign y[2] = data[3];
  assign y[1] = data[0];
  assign y[0] = data[1];
endmodule

// y = P(S(data)) ^ key; all signals are 4 bits wide.
module xps (
  input  logic [3:0] data,
  input  logic [3:0] key,
  output logic [3:0] y
);
  logic [3:0] s_data;
  logic [3:0] p_data;

  s_box s_stage (data, s_data);
  p_box p_stage (s_data, p_data);
  xor4 x_stage (p_data, key, y);
endmodule

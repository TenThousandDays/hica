module s_box (
  input  logic [3:0] data,
  output logic [3:0] y
);
  always @(*) begin
    case (data)
      4'h0: y = 4'h4;
      4'h1: y = 4'hE;
      4'h2: y = 4'h2;
      4'h3: y = 4'hA;
      4'h4: y = 4'h1;
      4'h5: y = 4'hD;
      4'h6: y = 4'h8;
      4'h7: y = 4'hB;
      4'h8: y = 4'h7;
      4'h9: y = 4'h0;
      4'hA: y = 4'h6;
      4'hB: y = 4'hF;
      4'hC: y = 4'h3;
      4'hD: y = 4'h5;
      4'hE: y = 4'hC;
      4'hF: y = 4'h9;
      default: y = 4'h0;
    endcase
  end
endmodule

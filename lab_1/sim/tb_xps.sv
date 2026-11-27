module tb_xps;
  logic [3:0] data, key, y;
  logic [3:0] y_ref;
  logic [3:0] ps_table [0:15];

  xps dut (data, key, y);

  initial begin
    $dumpfile("work/wave.vcd");
    $dumpvars(0, tb_xps);

    ps_table[0] =   4'h8;
    ps_table[1] =   4'hD;
    ps_table[2] =   4'h1;
    ps_table[3] =   4'h5;
    ps_table[4] =   4'h2;
    ps_table[5] =   4'hE;
    ps_table[6] =   4'h4;
    ps_table[7] =   4'h7;
    ps_table[8] =   4'hB;
    ps_table[9] =   4'h0;
    ps_table[10] =  4'h9;
    ps_table[11] =  4'hF;
    ps_table[12] =  4'h3;
    ps_table[13] =  4'hA;
    ps_table[14] =  4'hC;
    ps_table[15] =  4'h6;

    for (int i = 0; i < 256; i = i + 1) begin
      data = i / 16;
      key = i % 16;
      y_ref = ps_table[data] ^ key;
      #1;
      assert (y == y_ref)
      else $error("data=%h key=%h: expected=%h, actual=%h",
                  data, key, y_ref, y);
    end

    $finish;
  end
endmodule

`timescale 1ns / 1ns

module tb_name_fsm;
  parameter VECTORS = 60;

  logic rst, clk, y;
  logic [7:0] data;
  logic y_ref;
  logic [2:0] state_ref;
  logic [11:0] test_vectors [VECTORS];

  name_fsm dut (rst, clk, data, y);

  always #5 clk = ~clk;

  initial begin
    clk = 1'b0;
    rst = 1'b1;
    data = 8'h00;
    y_ref = 1'b0;
    state_ref = 3'b000;

    $dumpfile("work/wave.vcd");
    $dumpvars(0, tb_name_fsm);
    $readmemb("sequence.tv", test_vectors);

    @(negedge clk);
    assert (dut.state == 3'b000)
    else $error("Reset: expected state=0, actual=%b", dut.state);

    rst = 1'b0;

    for (int i = 0; i < VECTORS; i = i + 1) begin
      data = test_vectors[i][11:4];
      state_ref = test_vectors[i][3:1];
      y_ref = test_vectors[i][0];

      @(posedge clk);
      assert (y == y_ref)
      else $error("Vector %0d: data=%h, expected y=%b, actual=%b",
                  i, data, y_ref, y);

      @(negedge clk);
      assert (dut.state == state_ref)
      else $error("Vector %0d: data=%h, expected state=%b, actual=%b",
                  i, data, state_ref, dut.state);
    end

    $finish;
  end
endmodule

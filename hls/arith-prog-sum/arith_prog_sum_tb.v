`timescale 1ns/1ns

module arith_prog_sum_tb;

    reg   ap_clk;
    reg   ap_rst;
    reg   ap_start;
    wire   ap_done;
    wire   ap_idle;
    wire   ap_ready;
    reg  [31:0] a1;
    reg  [31:0] r;
    reg  [31:0] n;
    wire  [31:0] ap_return;

    arith_prog_sum DUT(
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(ap_start),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),
        .a1(a1),
        .r(r),
        .n(n),
        .sum(ap_return)
    );

    parameter clockPeriod = 20; 

    always #(clockPeriod / 2) ap_clk = ~ap_clk;
    
    initial begin
        
        ap_clk   = 1'b0;
        ap_rst = 1'b0;
        ap_start  = 1'b0;
        a1 = 32'd3;
        r = 32'd2;
        n = 32'd5;
        @(negedge ap_clk);

        ap_rst = 1'b1;
        #(5*clockPeriod);

        ap_rst = 1'b0;
        ap_start = 1'b1;
        #(clockPeriod)
        ap_start = 1'b0;
        @(posedge ap_done);
        #(2*clockPeriod);
        $stop;
    end

endmodule

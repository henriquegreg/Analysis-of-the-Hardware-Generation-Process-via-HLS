`timescale 1ns/1ns

module factorial_tb;

    reg   ap_clk;
    reg   ap_rst;
    reg   ap_start;
    reg  [15:0] a;

    wire   ap_done;
    wire   ap_idle;
    wire   ap_ready;
    wire  [15:0] out_r;
    wire   out_r_ap_vld;

    factorial DUT(
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(ap_start),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),
        .a(a),
        .out_r(out_r),
        .out_r_ap_vld(out_r_ap_vld)
    );

    parameter clockPeriod = 20; 

    always #(clockPeriod / 2) ap_clk = ~ap_clk;
    
    initial begin
        
        ap_clk   = 1'b0;
        ap_rst = 1'b0;
        ap_start  = 1'b0;
        a = 16'b0100;
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

`timescale 1ns/1ns

module sqrt_tb;

    reg   ap_clk;
    reg   ap_rst;
    reg   ap_start;

    reg  [31:0] a;

    wire   ap_done;
    wire   ap_idle;
    wire   ap_ready;
    wire  [31:0] res;
    wire   res_ap_vld;

    sqrt_hls DUT(
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(ap_start),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),
        .a(a),
        .res(res),
        .res_ap_vld(res_ap_vld)
    );

    parameter clockPeriod = 20; 

    always #(clockPeriod / 2) ap_clk = ~ap_clk;
    
    initial begin
        
        ap_clk   = 1'b0;
        ap_rst = 1'b0;
        ap_start  = 1'b0;
        a = 32'b11001; //25
        @(negedge ap_clk);

        ap_rst = 1'b1;
        #(5*clockPeriod);

        ap_rst = 1'b0;
        ap_start = 1'b1;
        // #(clockPeriod)
        // ap_start = 1'b0;
        @(posedge ap_done);
        ap_start = 1'b0;
        #(2*clockPeriod);
        $stop;
    end

endmodule

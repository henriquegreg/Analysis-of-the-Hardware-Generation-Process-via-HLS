`timescale 1ns/1ns

module factorial_sqrt_tb();
    reg ap_clk;
    reg ap_rst;
    reg ap_start;
    reg [31:0] n;

    wire ap_done;
    wire ap_idle;
    wire ap_ready;
    wire [31:0] res;
    wire res_ap_vld;

    factorial_sqrt uut (
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(ap_start),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),
        .n(n),
        .res(res),
        .res_ap_vld(res_ap_vld)
    );

    parameter clockPeriod = 20; 

    always #(clockPeriod / 2) ap_clk = ~ap_clk;

    initial begin
        ap_clk = 0;
        ap_rst = 1;     
        ap_start = 0;
        n = 32'd0;

        #(2*clockPeriod);
        ap_rst = 0;
        #(2*clockPeriod);

        n = 32'd4;
        ap_start = 1;     
        #(clockPeriod);
        ap_start = 0;     
        
        @(posedge ap_done);
        #(2*clockPeriod);
        $stop;
    end

endmodule

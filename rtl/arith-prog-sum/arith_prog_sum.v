module arith_prog_sum (
    input   ap_clk,
    input   ap_rst,
    input   ap_start,
    input  [31:0] a1,
    input  [31:0] r,
    input  [31:0] n,
    output   ap_done,
    output   ap_idle,
    output   ap_ready,
    output  [31:0] ap_return
);
    // Wires connecting Datapath <-> Control Unit
    wire sel_mux_1, sel_mux_2, sel_mux_3, sel_mux_4, sel_mux_5;
    wire en_reg_1, en_reg_2, en_reg_3;
    
    arith_prog_sum_dp datapath(
        // Inputs
        .ap_clk(ap_clk),
        .a1(a1),
        .r(r),
        .n(n),
        .ap_rst(ap_rst),
        
        // Control Signals
        .sel_mux_1(sel_mux_1),
        .sel_mux_2(sel_mux_2),
        .sel_mux_3(sel_mux_3),
        .sel_mux_4(sel_mux_4),
        .sel_mux_5(sel_mux_5),
        .en_reg_1(en_reg_1),
        .en_reg_2(en_reg_2),
        .en_reg_3(en_reg_3),
        
        // Output
        .ap_return(ap_return)
    );
    
    arith_prog_sum_cu control_unit(
        // Inputs
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(ap_start),
        
        // Control Signals
        .sel_mux_1(sel_mux_1),
        .sel_mux_2(sel_mux_2),
        .sel_mux_3(sel_mux_3),
        .sel_mux_4(sel_mux_4),
        .sel_mux_5(sel_mux_5),
        .en_reg_1(en_reg_1),
        .en_reg_2(en_reg_2),
        .en_reg_3(en_reg_3),
        
        // Outputs
        .ap_idle(ap_idle),
        .ap_done(ap_done),
        .ap_ready(ap_ready)
    );
endmodule
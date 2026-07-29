module arith_prog_sum_dp (
    // Inputs
    input   ap_clk,
    input  [31:0] a1,
    input  [31:0] r,
    input  [31:0] n,
    input ap_rst,
    
    // Control Signals
    input sel_mux_1,
    input sel_mux_2,
    input sel_mux_3,
    input sel_mux_4,
    input sel_mux_5,
    input en_reg_1,
    input en_reg_2,
    input en_reg_3,
    
    // Outputs
    output  [31:0] ap_return
);

    // Idle/Initial Stage
    wire [31:0] add_ln5_1_reg_125_in, add_ln5_1_reg_131_in;
    wire [31:0] add_ln5_1_reg_125_out, add_ln5_1_reg_131_out;
    wire icmp_ln5_reg_120_in = (n > 32'd0) ? 1'b1 : 1'b0;
    wire icmp_ln5_reg_120_out;
    wire [31:0] n_minus_one = n - 32'd1;
    wire [31:0] n_minus_two = n -32'd2;

    mux_2x1 #(.WIDTH(32)) mux_1(
        .in0(add_ln5_1_reg_125_out),
        .in1(n_minus_one),
        .sel(sel_mux_1),
        .out(add_ln5_1_reg_125_in)
    );

    mux_2x1 #(.WIDTH(32)) mux_2(
        .in0(add_ln5_1_reg_131_out),
        .in1(n_minus_two),
        .sel(sel_mux_2),
        .out(add_ln5_1_reg_131_in)
    );

    register #(.WIDTH(32)) add_ln5_1_reg_125(
        .clk(ap_clk), 
        .rst(1'b0), 
        .en(1'b1),
        .D(add_ln5_1_reg_125_in),
        .Q(add_ln5_1_reg_125_out)
    );

    register #(.WIDTH(32)) add_ln5_1_reg_131(
        .clk(ap_clk), 
        .rst(1'b0), 
        .en(1'b1),
        .D(add_ln5_1_reg_131_in),
        .Q(add_ln5_1_reg_131_out)
    );

    register #(.WIDTH(32)) icmp_ln5_reg_120(
        .clk(ap_clk), 
        .rst(1'b0), 
        .en(1'b1),
        .D(icmp_ln5_reg_120_in),
        .Q(icmp_ln5_reg_120_out)
    );

    // Pipeline Cycle 1
    wire [32:0] mul_32ns_32ns_33_2_1_U1_out;
    arith_prog_sum_mul_32ns_32ns_33_2_1 #(
        .ID( 1 ),
        .NUM_STAGE( 2 ),
        .din0_WIDTH( 32 ),
        .din1_WIDTH( 32 ),
        .dout_WIDTH( 33 ))
    mul_32ns_32ns_33_2_1_U1(
        .clk(ap_clk),
        .reset(ap_rst),
        .din0(add_ln5_1_reg_125_out),
        .din1(add_ln5_1_reg_131_out),
        .ce(1'b1),
        .dout(mul_32ns_32ns_33_2_1_U1_out)
    );

    // Pipeline Cycle 2
    wire [31:0] trunc_ln5_reg_161_in, r_read_reg_146_in, add_ln5_reg_156_in;
    wire [31:0] trunc_ln5_reg_161_out, r_read_reg_146_out, a1_read_reg_151_out, add_ln5_reg_156_out;
    wire [31:0] a1_plus_r = a1 + r;

    mux_2x1 #(.WIDTH(32)) mux_3(
        .in0(trunc_ln5_reg_161_out),
        .in1(mul_32ns_32ns_33_2_1_U1_out[32:1]),
        .sel(sel_mux_3),
        .out(trunc_ln5_reg_161_in)
    );

    mux_2x1 #(.WIDTH(32)) mux_4(
        .in0(r_read_reg_146_out),
        .in1(r),
        .sel(sel_mux_4),
        .out(r_read_reg_146_in)
    );

    mux_2x1 #(.WIDTH(32)) mux_5(
        .in0(add_ln5_reg_156_out),
        .in1(a1_plus_r),
        .sel(sel_mux_5),
        .out(add_ln5_reg_156_in)
    );

    register #(.WIDTH(32)) trunc_ln5_reg_161(
        .clk(ap_clk), 
        .rst(1'b0), 
        .en(1'b1),
        .D(trunc_ln5_reg_161_in),
        .Q(trunc_ln5_reg_161_out)
    );

    register #(.WIDTH(32)) r_read_reg_146(
        .clk(ap_clk), 
        .rst(1'b0), 
        .en(1'b1),
        .D(r_read_reg_146_in),
        .Q(r_read_reg_146_out)
    );

    register #(.WIDTH(32)) a1_read_reg_151(
        .clk(ap_clk), 
        .rst(1'b0), 
        .en(en_reg_1),
        .D(a1),
        .Q(a1_read_reg_151_out)
    );

    register #(.WIDTH(32)) add_ln5_reg_156(
        .clk(ap_clk), 
        .rst(1'b0), 
        .en(1'b1),
        .D(add_ln5_reg_156_in),
        .Q(add_ln5_reg_156_out)
    );

    // Pipeline Cycle 3
    wire [31:0] mul_32s_32s_32_2_1_U2_out, mul_32s_32s_32_2_1_U3_out;
    arith_prog_sum_mul_32s_32s_32_2_1 #(
        .ID( 1 ),
        .NUM_STAGE( 2 ),
        .din0_WIDTH( 32 ),
        .din1_WIDTH( 32 ),
        .dout_WIDTH( 32 ))
    mul_32s_32s_32_2_1_U2(
        .clk(ap_clk),
        .reset(ap_rst),
        .din0(add_ln5_1_reg_125_out),
        .din1(add_ln5_reg_156_out),
        .ce(1'b1),
        .dout(mul_32s_32s_32_2_1_U2_out)
    );

    arith_prog_sum_mul_32s_32s_32_2_1 #(
        .ID( 1 ),
        .NUM_STAGE( 2 ),
        .din0_WIDTH( 32 ),
        .din1_WIDTH( 32 ),
        .dout_WIDTH( 32 ))
    mul_32s_32s_32_2_1_U3(
        .clk(ap_clk),
        .reset(ap_rst),
        .din0(trunc_ln5_reg_161_out),
        .din1(r_read_reg_146_out),
        .ce(1'b1),
        .dout(mul_32s_32s_32_2_1_U3_out)
    );

    // Pipeline Cycle 4
    wire [31:0] mul_ln5_2_reg_166_out, mul_ln5_2_reg_171_out;
    
    register #(.WIDTH(32)) mul_ln5_2_reg_171(
        .clk(ap_clk), 
        .rst(1'b0), 
        .en(en_reg_2),
        .D(mul_32s_32s_32_2_1_U3_out),
        .Q(mul_ln5_2_reg_171_out)
    );

    register #(.WIDTH(32)) mul_ln5_2_reg_166(
        .clk(ap_clk), 
        .rst(1'b0), 
        .en(en_reg_3),
        .D(mul_32s_32s_32_2_1_U2_out),
        .Q(mul_ln5_2_reg_166_out)
    );

    // Pipeline Cycle 5
    wire [31:0] ap_return_mux_in1 = mul_ln5_2_reg_171_out + a1_read_reg_151_out + mul_ln5_2_reg_166_out;
    
    mux_2x1 #(.WIDTH(32)) mux_return(
        .in0(32'd0),
        .in1(ap_return_mux_in1),
        .sel(icmp_ln5_reg_120_out),
        .out(ap_return)
    );

endmodule
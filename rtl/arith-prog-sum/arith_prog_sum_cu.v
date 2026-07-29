module arith_prog_sum_cu (
    // Inputs
    input ap_clk,
    input ap_rst,
    input ap_start,
    
    // Control Signals
    output reg sel_mux_1,
    output reg sel_mux_2,
    output reg sel_mux_3,
    output reg sel_mux_4,
    output reg sel_mux_5,
    output reg en_reg_1,
    output reg en_reg_2,
    output reg en_reg_3,
    
    // Outputs
    output reg ap_idle,
    output reg ap_done,
    output reg ap_ready
);
    reg [2:0] current_state, next_state;
    
    parameter init_state = 3'b000;
    parameter cycle_1 = 3'b001;
    parameter cycle_2 = 3'b010;
    parameter cycle_3 = 3'b011;
    parameter cycle_4 = 3'b100;
    parameter final_state = 3'b101;
    
    always @(posedge ap_clk or posedge ap_rst) begin
        if (ap_rst)
            current_state <= init_state;
        else
            current_state <= next_state;
    end
    
    always @(*) begin
        case (current_state)
            init_state: next_state = ap_start ? cycle_1 : init_state;
            cycle_1:    next_state = cycle_2;
            cycle_2:    next_state = cycle_3;
            cycle_3:    next_state = cycle_4;
            cycle_4:    next_state = final_state;
            final_state: next_state = init_state;
        endcase
    end
    
    always @(*) begin
        sel_mux_1 = (current_state == init_state) ? 1'b1 : 1'b0;
        sel_mux_2 = (current_state == init_state) ? 1'b1 : 1'b0;
        sel_mux_3 = (current_state == cycle_2) ? 1'b1 : 1'b0;
        sel_mux_4 = (current_state == cycle_2) ? 1'b1 : 1'b0;
        sel_mux_5 = (current_state == cycle_2) ? 1'b1 : 1'b0;
        
        en_reg_1 = (current_state == cycle_2) ? 1'b1 : 1'b0;
        en_reg_2 = (current_state == cycle_4) ? 1'b1 : 1'b0;
        en_reg_3 = (current_state == cycle_4) ? 1'b1 : 1'b0;
        
        ap_idle  = (current_state == init_state && ~ap_start) ? 1'b1 : 1'b0;
        ap_done  = (current_state == final_state) ? 1'b1 : 1'b0;
        ap_ready = (current_state == final_state) ? 1'b1 : 1'b0;
    end
endmodule
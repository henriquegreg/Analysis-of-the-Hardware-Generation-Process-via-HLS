module register #(parameter WIDTH = 32)
(
	input clk, 
    input rst, 
    input en,
	input [WIDTH-1:0] D,
	output [WIDTH-1:0] Q
);

	reg [WIDTH-1:0] val;

	assign Q = val;

	always@(posedge clk)
	begin
		if(rst)
			val<=0;
		else if(en)
			val<=D;
	end

endmodule
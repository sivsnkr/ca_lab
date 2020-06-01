`include "../Logical/Main.v"

module top;

reg [15:0] a;
reg [15:0] b;
reg [2:0]select;
wire [15:0] out;

	LogicalUnit main_0(a,b,select,out);

initial
begin
	a=16'd20;
	b=16'd20;
	select=3'd4;
end

initial
begin
	$monitor("Time = %2d, a = %d, b = %d, output = %d",$time,a,b,out);
	$dumpfile("CMP.vcd");
	$dumpvars(0, top);
end

endmodule
`include "../multiplier/main.v"

module top;

reg [15:0] a;
reg [15:0] b;
wire [15:0]result;

	Float_mul main_0(a,b,result);

initial
begin
	a=`A;
	b=`B;
end

initial
begin
	$monitor("Time = %2d, a = %b, b = %b Multiplication = %b",$time,a,b,result);
end

endmodule

// 1100111111010000
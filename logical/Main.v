module LogicalUnit(input [15:0]a, input [15:0]b, input [2:0]select, output [15:0] out);
	
	assign out = select > 1 ? ~a : {select == 2 ? a&b : {select == 3 ? a^b : {select == 4 ? ~(a | b) :{ select==5?a << b:a|b}}}};

endmodule
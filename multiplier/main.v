`include "../multiplier/doub.v"
`include "../multiplier/multi16.v"

module Float_mul(a,b,result);
input [15:0]a,b;
output [15:0]result;

wire [9:0] a_mantisa,b_mantisa;
wire [4:0] a_expo,b_expo;

assign result[15] = a[15]^b[15];

assign a_mantisa = a[9:0];
assign b_mantisa = b[9:0];

assign a_expo = a[14:10];
assign b_expo = b[14:10];

// we need to add both the exponent in result

// make the exponent 16 bit to feed the adder module

wire [15:0] a_16bit_expo,b_16bit_expo;

assign a_16bit_expo = {11'b0,a_expo};
assign b_16bit_expo = {11'b0,b_expo};

// adding 15 to the exponent as in ieee format

wire [15:0] a_plus_15,b_plus_15;
wire c_a,c_b;//carry bit
doub d1(a_16bit_expo,16'b10001,1'b0,a_plus_15,c_a);
doub d2(b_16bit_expo,16'b10001,1'b0,b_plus_15,c_b);

wire [15:0]a_plus_b_expo_15;
doub d3(a_plus_15,b_plus_15,1'b0,a_plus_b_expo_15,c_b);
wire [15:0]res_expo;
doub d4(a_plus_b_expo_15,16'b01111,1'b0,res_expo,c_a);

assign result[14:10] = res_expo[4:0];


// get the mantisa

wire [15:0] a_man_16bit,b_man_16bit;

assign a_man_16bit = {5'b0,1'b1,a_mantisa};
assign b_man_16bit = {5'b0,1'b1,b_mantisa};

wire [31:0] a_b_mantisa;
multi16 m1(a_man_16bit,b_man_16bit,a_b_mantisa);

assign result[9:0] = a_b_mantisa[19:10];

endmodule
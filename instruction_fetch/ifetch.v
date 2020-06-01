`include "doub.v"
module insFetch(input clk,input reset, output [15:0]out);

reg [15:0]imem[0:1023];

reg [15:0]counterIn;

initial begin
	counterIn <=16'b0;
end

initial begin
	imem[0]<=16'b0000_0000_0000_0000;
    imem[1]<=16'b0001_0000_0001_0001;
    imem[2]<=16'b0010_0000_0010_0010;
    imem[3]<=16'b0011_0000_0011_0011;
    imem[4]<=16'b0100_0000_0100_0100;
    imem[5]<=16'b0101_0000_0101_0101;
    imem[6]<=16'b0110_0000_0110_0110;
    imem[7]<=16'b0111_0000_0111_0111;
    imem[8]<=16'b1000_0000_1000_1000;
    imem[9]<=16'b1001_0000_1001_1001;
end
wire faltu;//not for use
wire [15:0]temp;//storing pc
reg [15:0]temp1;//for storing ouput data from register
doub d1(counterIn,16'd1,1'b0,temp,faltu);

always@(posedge clk or posedge reset)
	if(!reset)
	begin
        temp1 <=imem[temp];
        counterIn <= temp;
	     		 
 	end
	else
	begin
		counterIn <= 16'b1111111111111111;
	end
		
assign out = temp1;

endmodule
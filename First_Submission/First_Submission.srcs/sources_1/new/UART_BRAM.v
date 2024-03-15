
`timescale 1ns / 1ps


module UART_BRAM(
input clk,          //input clock
input Rx_data,reset,  //Receving data bit and univeral reset 
output tx_out,        //Transmiting  data bit 
output reg [7:0]data_out,   //transmiting data
output reg do_transmit,     // flag to transmit data
output reg [3:0]data_count ,  // address to store data
output reg RECEIVED          // flag to confirm  wheather full data is received sucessfully 

);

wire is_received_A;    // flag to confirm whether 8 bits are received  
wire [7:0] data_A;     // to store data received fron receiving module
wire [7:0] bram_data;   //to store output data from BRAM 


//Instantiation of Receiver Module 
Receiving R( .clk(clk), .Rx_data(Rx_data), .reset(reset) , .Data(data_A) , .is_received(is_received_A) );



// Instantiation of BRAM
bram_1 BRAM1 (
.clka(clk),                 // input wire clka
.rsta(reset),               // input wire rsta
.wea(RECEIVED),             // input wire [0 : 0] wea
.addra(data_count),         // input wire [3 : 0] addra
.dina(data_A),              // input wire [7 : 0] dina
.douta(bram_data),          // output wire [7 : 0] douta
.rsta_busy()                // output wire rsta_busy
);


// FSM to store recieved data and to proecess the output 
always@(posedge clk)
begin



if (reset)
begin 
data_count <=0;
RECEIVED<=1;
do_transmit<=0;
data_out<=0;
// check_store<=0;
// check_sum<=0;
end

else if (data_count == 9 & RECEIVED)
begin
RECEIVED<=0;
data_count<=0;
//check_store<=1;

end
else if (data_count == 9 & !RECEIVED)
begin
do_transmit<=1;
RECEIVED<=1;
data_count<=0;
//check_sum<=1;
end


else if (is_received_A & RECEIVED)
begin
      if (data_count<9)
         begin
         data_count = data_count+1;
         end

    else
        begin
        
        end
        
    end
    
else if(!RECEIVED)
begin
data_out <= data_out+bram_data;
data_count = data_count+1;

end

else if (is_transmitted)
begin
do_transmit<=0;
end

else
begin
end
end


// Instantiation of Transmitter module
Transmitter T1(.clk(clk) , .reset(reset) , .data_in(data_out), .send_data(do_transmit) , .tx_out(tx_out) , .is_transmitted(is_transmitted));
endmodule



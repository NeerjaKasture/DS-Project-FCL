// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Fri Mar 15 23:04:31 2024
// Host        : MOHIT123 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/Users/mohit/Desktop/DIGITAL
//               SYSTEM/FNN/First_Submission/First_Submission.srcs/sources_1/ip/bram_1/bram_1_stub.v}
// Design      : bram_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2019.2" *)
module bram_1(clka, rsta, wea, addra, dina, douta, rsta_busy)
/* synthesis syn_black_box black_box_pad_pin="clka,rsta,wea[0:0],addra[3:0],dina[7:0],douta[7:0],rsta_busy" */;
  input clka;
  input rsta;
  input [0:0]wea;
  input [3:0]addra;
  input [7:0]dina;
  output [7:0]douta;
  output rsta_busy;
endmodule

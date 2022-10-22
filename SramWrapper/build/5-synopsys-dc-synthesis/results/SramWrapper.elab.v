/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : L-2016.03-SP5-5
// Date      : Sat Oct 22 15:44:47 2022
/////////////////////////////////////////////////////////////


module SramWrapper ( clk, csb, web, addr, din, dout );
  input [6:0] addr;
  input [31:0] din;
  output [31:0] dout;
  input clk, csb, web;

  wire   [6:0] sram_addr;
  wire   [31:0] sram_din;
  wire   [31:0] sram_dout;

  sram sram ( .din0(sram_din), .dout0(sram_dout), .addr0(sram_addr), .csb0(csb), .web0(web), .clk0(clk) );
  ADD_UNS_OP add_25 ( .A(din), .B(1'b1), .Z(sram_din) );
  SUB_UNS_OP sub_26 ( .A(sram_dout), .B(1'b1), .Z(dout) );
  GTECH_NOT I_0 ( .A(addr[6]), .Z(sram_addr[6]) );
  GTECH_NOT I_1 ( .A(addr[5]), .Z(sram_addr[5]) );
  GTECH_NOT I_2 ( .A(addr[4]), .Z(sram_addr[4]) );
  GTECH_NOT I_3 ( .A(addr[3]), .Z(sram_addr[3]) );
  GTECH_NOT I_4 ( .A(addr[2]), .Z(sram_addr[2]) );
  GTECH_NOT I_5 ( .A(addr[1]), .Z(sram_addr[1]) );
  GTECH_NOT I_6 ( .A(addr[0]), .Z(sram_addr[0]) );
endmodule


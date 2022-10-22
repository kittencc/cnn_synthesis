/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in topographical mode
// Version   : L-2016.03-SP5-5
// Date      : Sat Oct 22 15:45:24 2022
/////////////////////////////////////////////////////////////


module SramWrapper_SramWrapper_DW01_dec_J1_0_0 ( A, SUM );
  input [31:0] A;
  output [31:0] SUM;
  wire   n99, n101, n102, n104, n105, n107, n108, n109, n110, n111, n113, n114,
         n116, n117, n119, n120, n122, n123, n125, n126, n128, n129, n131,
         n132, n134, n135, n137, n138, n140, n141, n142, n143, n144, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173;

  OR4_X4 U65 ( .A1(n163), .A2(n160), .A3(n161), .A4(n162), .ZN(n108) );
  NOR2_X4 U66 ( .A1(n164), .A2(n108), .ZN(n107) );
  NAND2_X1 U68 ( .A1(n107), .A2(n147), .ZN(n105) );
  NOR2_X2 U69 ( .A1(n105), .A2(n165), .ZN(n104) );
  NAND2_X1 U71 ( .A1(n104), .A2(n148), .ZN(n102) );
  NOR2_X2 U72 ( .A1(n102), .A2(n166), .ZN(n101) );
  NAND2_X1 U74 ( .A1(n101), .A2(n149), .ZN(n141) );
  NOR2_X2 U75 ( .A1(n141), .A2(n167), .ZN(n140) );
  NAND2_X1 U77 ( .A1(n140), .A2(n150), .ZN(n138) );
  NOR2_X2 U78 ( .A1(n138), .A2(n169), .ZN(n137) );
  NAND2_X1 U80 ( .A1(n137), .A2(n151), .ZN(n135) );
  NOR2_X2 U81 ( .A1(n135), .A2(n170), .ZN(n134) );
  NAND2_X1 U83 ( .A1(n134), .A2(n152), .ZN(n132) );
  NOR2_X2 U84 ( .A1(n132), .A2(n171), .ZN(n131) );
  NOR2_X2 U87 ( .A1(n172), .A2(n129), .ZN(n128) );
  NAND2_X2 U89 ( .A1(n128), .A2(n154), .ZN(n126) );
  NOR2_X2 U90 ( .A1(n173), .A2(n126), .ZN(n125) );
  NOR2_X2 U93 ( .A1(n156), .A2(n123), .ZN(n122) );
  NOR2_X2 U96 ( .A1(n157), .A2(n120), .ZN(n119) );
  NOR2_X2 U99 ( .A1(n158), .A2(n117), .ZN(n116) );
  NOR2_X2 U102 ( .A1(n159), .A2(n114), .ZN(n113) );
  XOR2_X2 U106 ( .A(A[31]), .B(n99), .Z(SUM[31]) );
  XNOR2_X1 U108 ( .A(n101), .B(n149), .ZN(SUM[9]) );
  XNOR2_X1 U109 ( .A(n102), .B(n166), .ZN(SUM[8]) );
  XNOR2_X1 U110 ( .A(n104), .B(n148), .ZN(SUM[7]) );
  XNOR2_X1 U111 ( .A(n105), .B(n165), .ZN(SUM[6]) );
  XNOR2_X1 U112 ( .A(n107), .B(n147), .ZN(SUM[5]) );
  XNOR2_X1 U113 ( .A(n164), .B(n108), .ZN(SUM[4]) );
  NOR3_X1 U114 ( .A1(n162), .A2(n161), .A3(n160), .ZN(n109) );
  XOR2_X1 U115 ( .A(n163), .B(n109), .Z(SUM[3]) );
  XNOR2_X1 U116 ( .A(n168), .B(n110), .ZN(SUM[30]) );
  NOR2_X1 U117 ( .A1(n161), .A2(n160), .ZN(n111) );
  XOR2_X1 U118 ( .A(n162), .B(n111), .Z(SUM[2]) );
  XNOR2_X1 U119 ( .A(n113), .B(n146), .ZN(SUM[29]) );
  XNOR2_X1 U120 ( .A(n159), .B(n114), .ZN(SUM[28]) );
  XNOR2_X1 U121 ( .A(n116), .B(n144), .ZN(SUM[27]) );
  XNOR2_X1 U122 ( .A(n158), .B(n117), .ZN(SUM[26]) );
  XNOR2_X1 U123 ( .A(n119), .B(n143), .ZN(SUM[25]) );
  XNOR2_X1 U124 ( .A(n157), .B(n120), .ZN(SUM[24]) );
  XNOR2_X1 U125 ( .A(n122), .B(n142), .ZN(SUM[23]) );
  XNOR2_X1 U126 ( .A(n156), .B(n123), .ZN(SUM[22]) );
  XNOR2_X1 U127 ( .A(n125), .B(n155), .ZN(SUM[21]) );
  XNOR2_X1 U128 ( .A(n173), .B(n126), .ZN(SUM[20]) );
  XNOR2_X1 U129 ( .A(n161), .B(n160), .ZN(SUM[1]) );
  XNOR2_X1 U130 ( .A(n128), .B(n154), .ZN(SUM[19]) );
  XNOR2_X1 U131 ( .A(n172), .B(n129), .ZN(SUM[18]) );
  XNOR2_X1 U132 ( .A(n131), .B(n153), .ZN(SUM[17]) );
  XNOR2_X1 U133 ( .A(n132), .B(n171), .ZN(SUM[16]) );
  XNOR2_X1 U134 ( .A(n134), .B(n152), .ZN(SUM[15]) );
  XNOR2_X1 U135 ( .A(n135), .B(n170), .ZN(SUM[14]) );
  XNOR2_X1 U136 ( .A(n137), .B(n151), .ZN(SUM[13]) );
  XNOR2_X1 U137 ( .A(n138), .B(n169), .ZN(SUM[12]) );
  XNOR2_X1 U138 ( .A(n140), .B(n150), .ZN(SUM[11]) );
  XNOR2_X1 U139 ( .A(n141), .B(n167), .ZN(SUM[10]) );
  INV_X1 U67 ( .A(A[23]), .ZN(n142) );
  INV_X1 U70 ( .A(A[25]), .ZN(n143) );
  INV_X1 U73 ( .A(A[27]), .ZN(n144) );
  INV_X1 U76 ( .A(n160), .ZN(SUM[0]) );
  INV_X1 U79 ( .A(A[29]), .ZN(n146) );
  INV_X1 U82 ( .A(A[5]), .ZN(n147) );
  INV_X1 U85 ( .A(A[7]), .ZN(n148) );
  INV_X1 U88 ( .A(A[9]), .ZN(n149) );
  INV_X1 U91 ( .A(A[11]), .ZN(n150) );
  INV_X1 U94 ( .A(A[13]), .ZN(n151) );
  INV_X1 U97 ( .A(A[15]), .ZN(n152) );
  INV_X1 U100 ( .A(A[17]), .ZN(n153) );
  INV_X1 U103 ( .A(A[19]), .ZN(n154) );
  INV_X1 U107 ( .A(A[21]), .ZN(n155) );
  NOR2_X2 U105 ( .A1(n168), .A2(n110), .ZN(n99) );
  NAND2_X2 U86 ( .A1(n131), .A2(n153), .ZN(n129) );
  NAND2_X2 U95 ( .A1(n122), .A2(n142), .ZN(n120) );
  NAND2_X2 U101 ( .A1(n116), .A2(n144), .ZN(n114) );
  NAND2_X2 U104 ( .A1(n113), .A2(n146), .ZN(n110) );
  NAND2_X2 U92 ( .A1(n125), .A2(n155), .ZN(n123) );
  NAND2_X2 U98 ( .A1(n119), .A2(n143), .ZN(n117) );
  BUF_X1 U140 ( .A(A[1]), .Z(n161) );
  CLKBUF_X1 U141 ( .A(A[22]), .Z(n156) );
  CLKBUF_X1 U142 ( .A(A[24]), .Z(n157) );
  CLKBUF_X1 U143 ( .A(A[26]), .Z(n158) );
  CLKBUF_X1 U144 ( .A(A[28]), .Z(n159) );
  CLKBUF_X1 U145 ( .A(A[0]), .Z(n160) );
  CLKBUF_X1 U146 ( .A(A[2]), .Z(n162) );
  CLKBUF_X1 U147 ( .A(A[3]), .Z(n163) );
  CLKBUF_X1 U148 ( .A(A[4]), .Z(n164) );
  CLKBUF_X1 U149 ( .A(A[6]), .Z(n165) );
  CLKBUF_X1 U150 ( .A(A[8]), .Z(n166) );
  CLKBUF_X1 U151 ( .A(A[10]), .Z(n167) );
  CLKBUF_X1 U152 ( .A(A[30]), .Z(n168) );
  CLKBUF_X1 U153 ( .A(A[12]), .Z(n169) );
  CLKBUF_X1 U154 ( .A(A[14]), .Z(n170) );
  CLKBUF_X1 U155 ( .A(A[16]), .Z(n171) );
  CLKBUF_X1 U156 ( .A(A[18]), .Z(n172) );
  CLKBUF_X1 U157 ( .A(A[20]), .Z(n173) );
endmodule


module SramWrapper_SramWrapper_DW01_inc_0_0 ( A, SUM );
  input [31:0] A;
  output [31:0] SUM;
  wire   n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212;

  INV_X1 U102 ( .A(A[0]), .ZN(SUM[0]) );
  INV_X1 U103 ( .A(A[1]), .ZN(n151) );
  XNOR2_X1 U104 ( .A(n151), .B(A[0]), .ZN(SUM[1]) );
  INV_X1 U105 ( .A(A[2]), .ZN(n152) );
  NAND2_X1 U106 ( .A1(A[1]), .A2(A[0]), .ZN(n153) );
  INV_X1 U107 ( .A(n153), .ZN(n183) );
  XNOR2_X1 U108 ( .A(n152), .B(n183), .ZN(SUM[2]) );
  NAND2_X1 U109 ( .A1(A[2]), .A2(A[3]), .ZN(n154) );
  NOR2_X1 U110 ( .A1(n154), .A2(n153), .ZN(n158) );
  INV_X1 U111 ( .A(n158), .ZN(n187) );
  INV_X1 U112 ( .A(A[4]), .ZN(n186) );
  NOR2_X1 U113 ( .A1(n187), .A2(n186), .ZN(n156) );
  INV_X1 U114 ( .A(A[5]), .ZN(n155) );
  XNOR2_X1 U115 ( .A(n156), .B(n155), .ZN(SUM[5]) );
  NAND2_X1 U116 ( .A1(A[4]), .A2(A[5]), .ZN(n161) );
  NAND2_X1 U117 ( .A1(A[6]), .A2(A[7]), .ZN(n157) );
  NOR2_X1 U118 ( .A1(n161), .A2(n157), .ZN(n159) );
  NAND2_X1 U119 ( .A1(n159), .A2(n158), .ZN(n180) );
  INV_X1 U120 ( .A(n180), .ZN(n191) );
  INV_X1 U121 ( .A(A[8]), .ZN(n160) );
  XNOR2_X1 U122 ( .A(n191), .B(n160), .ZN(SUM[8]) );
  NOR2_X1 U123 ( .A1(n187), .A2(n161), .ZN(n188) );
  INV_X1 U124 ( .A(A[6]), .ZN(n162) );
  XNOR2_X1 U125 ( .A(n188), .B(n162), .ZN(SUM[6]) );
  NAND2_X1 U126 ( .A1(A[8]), .A2(A[9]), .ZN(n164) );
  NAND2_X1 U127 ( .A1(A[10]), .A2(A[11]), .ZN(n163) );
  NOR2_X1 U128 ( .A1(n164), .A2(n163), .ZN(n179) );
  NAND2_X1 U129 ( .A1(n191), .A2(n179), .ZN(n169) );
  INV_X1 U130 ( .A(n169), .ZN(n173) );
  INV_X1 U131 ( .A(A[12]), .ZN(n168) );
  XNOR2_X1 U132 ( .A(n173), .B(n168), .ZN(SUM[12]) );
  INV_X1 U133 ( .A(n164), .ZN(n165) );
  NAND2_X1 U134 ( .A1(n191), .A2(n165), .ZN(n195) );
  INV_X1 U135 ( .A(A[10]), .ZN(n194) );
  NOR2_X1 U136 ( .A1(n195), .A2(n194), .ZN(n167) );
  INV_X1 U137 ( .A(A[11]), .ZN(n166) );
  XNOR2_X1 U138 ( .A(n167), .B(n166), .ZN(SUM[11]) );
  NOR2_X1 U139 ( .A1(n169), .A2(n168), .ZN(n171) );
  INV_X1 U140 ( .A(A[13]), .ZN(n170) );
  XNOR2_X1 U141 ( .A(n171), .B(n170), .ZN(SUM[13]) );
  NAND2_X1 U142 ( .A1(A[12]), .A2(A[13]), .ZN(n177) );
  INV_X1 U143 ( .A(n177), .ZN(n172) );
  NAND2_X1 U144 ( .A1(n173), .A2(n172), .ZN(n197) );
  INV_X1 U145 ( .A(A[14]), .ZN(n196) );
  NOR2_X1 U146 ( .A1(n197), .A2(n196), .ZN(n175) );
  INV_X1 U147 ( .A(A[15]), .ZN(n174) );
  XNOR2_X1 U148 ( .A(n175), .B(n174), .ZN(SUM[15]) );
  NAND2_X1 U149 ( .A1(A[14]), .A2(A[15]), .ZN(n176) );
  NOR2_X1 U150 ( .A1(n177), .A2(n176), .ZN(n178) );
  NAND2_X1 U151 ( .A1(n179), .A2(n178), .ZN(n181) );
  NOR2_X1 U152 ( .A1(n181), .A2(n180), .ZN(n198) );
  XOR2_X1 U153 ( .A(n182), .B(A[31]), .Z(SUM[31]) );
  NAND2_X1 U154 ( .A1(n183), .A2(A[2]), .ZN(n185) );
  INV_X1 U155 ( .A(A[3]), .ZN(n184) );
  XOR2_X1 U156 ( .A(n185), .B(n184), .Z(SUM[3]) );
  XOR2_X1 U157 ( .A(n187), .B(n186), .Z(SUM[4]) );
  NAND2_X1 U158 ( .A1(n188), .A2(A[6]), .ZN(n190) );
  INV_X1 U159 ( .A(A[7]), .ZN(n189) );
  XOR2_X1 U160 ( .A(n190), .B(n189), .Z(SUM[7]) );
  NAND2_X1 U161 ( .A1(n191), .A2(A[8]), .ZN(n193) );
  INV_X1 U162 ( .A(A[9]), .ZN(n192) );
  XOR2_X1 U163 ( .A(n193), .B(n192), .Z(SUM[9]) );
  XOR2_X1 U164 ( .A(n195), .B(n194), .Z(SUM[10]) );
  XOR2_X1 U165 ( .A(n197), .B(n196), .Z(SUM[14]) );
  HA_X1 U166 ( .A(n198), .B(A[16]), .CO(n199), .S(SUM[16]) );
  HA_X1 U167 ( .A(n199), .B(A[17]), .CO(n200), .S(SUM[17]) );
  HA_X1 U168 ( .A(n200), .B(A[18]), .CO(n201), .S(SUM[18]) );
  HA_X1 U169 ( .A(n201), .B(A[19]), .CO(n202), .S(SUM[19]) );
  HA_X1 U170 ( .A(n202), .B(A[20]), .CO(n203), .S(SUM[20]) );
  HA_X1 U171 ( .A(n203), .B(A[21]), .CO(n204), .S(SUM[21]) );
  HA_X1 U172 ( .A(n204), .B(A[22]), .CO(n205), .S(SUM[22]) );
  HA_X1 U173 ( .A(n205), .B(A[23]), .CO(n206), .S(SUM[23]) );
  HA_X1 U174 ( .A(n206), .B(A[24]), .CO(n207), .S(SUM[24]) );
  HA_X1 U175 ( .A(n207), .B(A[25]), .CO(n208), .S(SUM[25]) );
  HA_X1 U176 ( .A(n208), .B(A[26]), .CO(n209), .S(SUM[26]) );
  HA_X1 U177 ( .A(n209), .B(A[27]), .CO(n210), .S(SUM[27]) );
  HA_X1 U178 ( .A(n210), .B(A[28]), .CO(n211), .S(SUM[28]) );
  HA_X1 U179 ( .A(n211), .B(A[29]), .CO(n212), .S(SUM[29]) );
  HA_X1 U180 ( .A(n212), .B(A[30]), .CO(n182), .S(SUM[30]) );
endmodule


module SramWrapper ( clk, csb, web, addr, din, dout );
  input [6:0] addr;
  input [31:0] din;
  output [31:0] dout;
  input clk, csb, web;

  wire   [6:0] sram_addr;
  wire   [31:0] sram_din;
  wire   [31:0] sram_dout;

  sram sram ( .din0(sram_din), .dout0(sram_dout), .addr0(sram_addr), .csb0(csb), .web0(web), .clk0(clk) );
  SramWrapper_SramWrapper_DW01_dec_J1_0_0 sub_x_2 ( .A(sram_dout), .SUM(dout)
         );
  INV_X1 U2 ( .A(addr[0]), .ZN(sram_addr[0]) );
  INV_X1 U3 ( .A(addr[1]), .ZN(sram_addr[1]) );
  INV_X1 U4 ( .A(addr[2]), .ZN(sram_addr[2]) );
  INV_X1 U5 ( .A(addr[3]), .ZN(sram_addr[3]) );
  INV_X1 U6 ( .A(addr[4]), .ZN(sram_addr[4]) );
  INV_X1 U7 ( .A(addr[5]), .ZN(sram_addr[5]) );
  INV_X1 U8 ( .A(addr[6]), .ZN(sram_addr[6]) );
  SramWrapper_SramWrapper_DW01_inc_0_0 add_x_1 ( .A(din), .SUM(sram_din) );
endmodule


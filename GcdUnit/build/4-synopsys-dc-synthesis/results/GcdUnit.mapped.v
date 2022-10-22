/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in topographical mode
// Version   : L-2016.03-SP5-5
// Date      : Fri Oct 21 23:07:08 2022
/////////////////////////////////////////////////////////////


module GcdUnit_RegRst_0x9f365fdf6c8998a_0 ( clk, in_, out, reset );
  input [0:0] clk;
  input [1:0] in_;
  output [1:0] out;
  input [0:0] reset;
  wire   n1, n3;

  SDFF_X1 out_reg_1_ ( .D(reset[0]), .SI(1'b1), .SE(n3), .CK(clk[0]), .QN(
        out[1]) );
  SDFF_X1 out_reg_0_ ( .D(reset[0]), .SI(1'b1), .SE(n1), .CK(clk[0]), .QN(
        out[0]) );
  INV_X1 U3 ( .A(in_[0]), .ZN(n1) );
  INV_X1 U5 ( .A(in_[1]), .ZN(n3) );
endmodule


module GcdUnit_GcdUnitCtrlRTL_0x29124399ca008c5e_0 ( a_mux_sel, a_reg_en, 
        b_mux_sel, b_reg_en, clk, is_a_lt_b, is_b_zero, req_rdy, req_val, 
        reset, resp_rdy, resp_val );
  output [1:0] a_mux_sel;
  output [0:0] a_reg_en;
  output [0:0] b_mux_sel;
  output [0:0] b_reg_en;
  input [0:0] clk;
  input [0:0] is_a_lt_b;
  input [0:0] is_b_zero;
  output [0:0] req_rdy;
  input [0:0] req_val;
  input [0:0] reset;
  input [0:0] resp_rdy;
  output [0:0] resp_val;
  wire   n1, n2, n3, n4;
  wire   [1:0] state_out;
  wire   [1:0] next_state__0;

  GcdUnit_RegRst_0x9f365fdf6c8998a_0 state ( .clk(clk[0]), .in_(next_state__0), 
        .out(state_out), .reset(reset[0]) );
  INV_X1 U5 ( .A(state_out[1]), .ZN(a_reg_en[0]) );
  AND3_X1 U6 ( .A1(is_a_lt_b[0]), .A2(state_out[0]), .A3(a_reg_en[0]), .ZN(
        a_mux_sel[1]) );
  INV_X1 U7 ( .A(state_out[0]), .ZN(n3) );
  NOR3_X1 U8 ( .A1(state_out[1]), .A2(is_a_lt_b[0]), .A3(n3), .ZN(a_mux_sel[0]) );
  AOI21_X1 U9 ( .B1(req_val[0]), .B2(a_reg_en[0]), .A(state_out[0]), .ZN(n1)
         );
  AOI21_X1 U10 ( .B1(is_b_zero[0]), .B2(a_mux_sel[0]), .A(n1), .ZN(
        next_state__0[0]) );
  NOR2_X1 U11 ( .A1(state_out[0]), .A2(a_reg_en[0]), .ZN(resp_val[0]) );
  NAND2_X1 U12 ( .A1(a_mux_sel[0]), .A2(is_b_zero[0]), .ZN(n2) );
  OAI221_X1 U13 ( .B1(a_reg_en[0]), .B2(resp_rdy[0]), .C1(a_reg_en[0]), .C2(n3), .A(n2), .ZN(next_state__0[1]) );
  NOR2_X1 U14 ( .A1(is_a_lt_b[0]), .A2(n3), .ZN(n4) );
  NOR2_X1 U15 ( .A1(state_out[1]), .A2(n4), .ZN(b_reg_en[0]) );
  NOR2_X1 U3 ( .A1(state_out[1]), .A2(state_out[0]), .ZN(b_mux_sel[0]) );
  CLKBUF_X1 U4 ( .A(b_mux_sel[0]), .Z(req_rdy[0]) );
endmodule


module GcdUnit_LtComparator_0x422b1f52edd46a85_0 ( clk, in0, in1, out, reset
 );
  input [0:0] clk;
  input [15:0] in0;
  input [15:0] in1;
  output [0:0] out;
  input [0:0] reset;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47;

  INV_X1 U1 ( .A(in0[12]), .ZN(n35) );
  INV_X1 U2 ( .A(in1[11]), .ZN(n32) );
  INV_X1 U3 ( .A(in1[10]), .ZN(n27) );
  INV_X1 U4 ( .A(in1[9]), .ZN(n1) );
  OAI21_X1 U5 ( .B1(in0[9]), .B2(n1), .A(in0[8]), .ZN(n2) );
  INV_X1 U6 ( .A(in0[9]), .ZN(n23) );
  OAI22_X1 U7 ( .A1(in1[8]), .A2(n2), .B1(in1[9]), .B2(n23), .ZN(n3) );
  AOI21_X1 U8 ( .B1(in0[10]), .B2(n27), .A(n3), .ZN(n30) );
  INV_X1 U9 ( .A(in1[8]), .ZN(n26) );
  INV_X1 U10 ( .A(in0[7]), .ZN(n22) );
  INV_X1 U11 ( .A(in0[5]), .ZN(n16) );
  INV_X1 U12 ( .A(in0[1]), .ZN(n6) );
  INV_X1 U13 ( .A(in1[1]), .ZN(n4) );
  AOI21_X1 U14 ( .B1(in0[1]), .B2(n4), .A(in0[0]), .ZN(n5) );
  AOI22_X1 U15 ( .A1(in1[1]), .A2(n6), .B1(in1[0]), .B2(n5), .ZN(n8) );
  INV_X1 U16 ( .A(in1[2]), .ZN(n7) );
  AOI222_X1 U17 ( .A1(n8), .A2(in0[2]), .B1(n8), .B2(n7), .C1(in0[2]), .C2(n7), 
        .ZN(n10) );
  INV_X1 U18 ( .A(in0[3]), .ZN(n9) );
  AOI222_X1 U19 ( .A1(in1[3]), .A2(n10), .B1(in1[3]), .B2(n9), .C1(n10), .C2(
        n9), .ZN(n14) );
  NAND2_X1 U20 ( .A1(n14), .A2(in0[4]), .ZN(n11) );
  NAND2_X1 U21 ( .A1(n11), .A2(in1[4]), .ZN(n13) );
  NAND2_X1 U22 ( .A1(in1[5]), .A2(n16), .ZN(n12) );
  OAI211_X1 U23 ( .C1(n14), .C2(in0[4]), .A(n13), .B(n12), .ZN(n15) );
  OAI21_X1 U24 ( .B1(in1[5]), .B2(n16), .A(n15), .ZN(n20) );
  NAND2_X1 U25 ( .A1(n20), .A2(in0[6]), .ZN(n17) );
  NAND2_X1 U26 ( .A1(n17), .A2(in1[6]), .ZN(n19) );
  NAND2_X1 U27 ( .A1(in1[7]), .A2(n22), .ZN(n18) );
  OAI211_X1 U28 ( .C1(n20), .C2(in0[6]), .A(n19), .B(n18), .ZN(n21) );
  OAI21_X1 U29 ( .B1(in1[7]), .B2(n22), .A(n21), .ZN(n25) );
  NAND2_X1 U30 ( .A1(in1[9]), .A2(n23), .ZN(n24) );
  OAI211_X1 U31 ( .C1(in0[8]), .C2(n26), .A(n25), .B(n24), .ZN(n29) );
  OAI22_X1 U32 ( .A1(in0[11]), .A2(n32), .B1(in0[10]), .B2(n27), .ZN(n28) );
  AOI21_X1 U33 ( .B1(n30), .B2(n29), .A(n28), .ZN(n31) );
  AOI21_X1 U34 ( .B1(in0[11]), .B2(n32), .A(n31), .ZN(n34) );
  INV_X1 U35 ( .A(in1[13]), .ZN(n38) );
  NOR2_X1 U36 ( .A1(in0[13]), .A2(n38), .ZN(n33) );
  AOI211_X1 U37 ( .C1(in1[12]), .C2(n35), .A(n34), .B(n33), .ZN(n47) );
  INV_X1 U38 ( .A(in0[14]), .ZN(n37) );
  INV_X1 U39 ( .A(in1[15]), .ZN(n41) );
  NOR2_X1 U40 ( .A1(in0[15]), .A2(n41), .ZN(n36) );
  AOI21_X1 U41 ( .B1(in1[14]), .B2(n37), .A(n36), .ZN(n46) );
  OAI21_X1 U42 ( .B1(in0[13]), .B2(n38), .A(in0[12]), .ZN(n40) );
  INV_X1 U43 ( .A(in0[13]), .ZN(n39) );
  OAI22_X1 U44 ( .A1(in1[12]), .A2(n40), .B1(in1[13]), .B2(n39), .ZN(n45) );
  OAI21_X1 U45 ( .B1(in0[15]), .B2(n41), .A(in0[14]), .ZN(n43) );
  INV_X1 U46 ( .A(in0[15]), .ZN(n42) );
  OAI22_X1 U47 ( .A1(in1[14]), .A2(n43), .B1(in1[15]), .B2(n42), .ZN(n44) );
  AOI221_X1 U48 ( .B1(n47), .B2(n46), .C1(n45), .C2(n46), .A(n44), .ZN(out[0])
         );
endmodule


module GcdUnit_ZeroComparator_0x422b1f52edd46a85_0 ( clk, in_, out, reset );
  input [0:0] clk;
  input [15:0] in_;
  output [0:0] out;
  input [0:0] reset;
  wire   n1, n2, n3, n4;

  NOR4_X1 U1 ( .A1(in_[12]), .A2(in_[13]), .A3(in_[14]), .A4(in_[15]), .ZN(n4)
         );
  NOR4_X1 U2 ( .A1(in_[8]), .A2(in_[9]), .A3(in_[10]), .A4(in_[11]), .ZN(n3)
         );
  NOR4_X1 U3 ( .A1(in_[4]), .A2(in_[5]), .A3(in_[6]), .A4(in_[7]), .ZN(n2) );
  NOR4_X1 U4 ( .A1(in_[0]), .A2(in_[1]), .A3(in_[2]), .A4(in_[3]), .ZN(n1) );
  AND4_X1 U5 ( .A1(n4), .A2(n3), .A3(n2), .A4(n1), .ZN(out[0]) );
endmodule


module GcdUnit_Mux_0x683fa1a418b072c9_0 ( clk, in__000, in__001, in__002, out, 
        reset, sel );
  input [0:0] clk;
  input [15:0] in__000;
  input [15:0] in__001;
  input [15:0] in__002;
  output [15:0] out;
  input [0:0] reset;
  input [1:0] sel;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19;

  INV_X1 U1 ( .A(sel[0]), .ZN(n1) );
  AOI222_X1 U4 ( .A1(sel[1]), .A2(in__002[0]), .B1(n18), .B2(in__001[0]), .C1(
        n17), .C2(in__000[0]), .ZN(n2) );
  INV_X1 U5 ( .A(n2), .ZN(out[0]) );
  AOI222_X1 U6 ( .A1(sel[1]), .A2(in__002[1]), .B1(n18), .B2(in__001[1]), .C1(
        n17), .C2(in__000[1]), .ZN(n3) );
  INV_X1 U7 ( .A(n3), .ZN(out[1]) );
  AOI222_X1 U8 ( .A1(sel[1]), .A2(in__002[2]), .B1(n18), .B2(in__001[2]), .C1(
        n17), .C2(in__000[2]), .ZN(n4) );
  INV_X1 U9 ( .A(n4), .ZN(out[2]) );
  AOI222_X1 U10 ( .A1(sel[1]), .A2(in__002[3]), .B1(n18), .B2(in__001[3]), 
        .C1(n17), .C2(in__000[3]), .ZN(n5) );
  INV_X1 U11 ( .A(n5), .ZN(out[3]) );
  AOI222_X1 U12 ( .A1(sel[1]), .A2(in__002[4]), .B1(n18), .B2(in__001[4]), 
        .C1(n17), .C2(in__000[4]), .ZN(n6) );
  INV_X1 U13 ( .A(n6), .ZN(out[4]) );
  AOI222_X1 U14 ( .A1(sel[1]), .A2(in__002[5]), .B1(n18), .B2(in__001[5]), 
        .C1(n17), .C2(in__000[5]), .ZN(n7) );
  INV_X1 U15 ( .A(n7), .ZN(out[5]) );
  AOI222_X1 U16 ( .A1(sel[1]), .A2(in__002[6]), .B1(n18), .B2(in__001[6]), 
        .C1(n17), .C2(in__000[6]), .ZN(n8) );
  INV_X1 U17 ( .A(n8), .ZN(out[6]) );
  AOI222_X1 U18 ( .A1(sel[1]), .A2(in__002[7]), .B1(n18), .B2(in__001[7]), 
        .C1(n17), .C2(in__000[7]), .ZN(n9) );
  INV_X1 U19 ( .A(n9), .ZN(out[7]) );
  AOI222_X1 U20 ( .A1(sel[1]), .A2(in__002[8]), .B1(n18), .B2(in__001[8]), 
        .C1(n17), .C2(in__000[8]), .ZN(n10) );
  INV_X1 U21 ( .A(n10), .ZN(out[8]) );
  AOI222_X1 U22 ( .A1(sel[1]), .A2(in__002[9]), .B1(n18), .B2(in__001[9]), 
        .C1(n17), .C2(in__000[9]), .ZN(n11) );
  INV_X1 U23 ( .A(n11), .ZN(out[9]) );
  AOI222_X1 U24 ( .A1(sel[1]), .A2(in__002[10]), .B1(n18), .B2(in__001[10]), 
        .C1(n17), .C2(in__000[10]), .ZN(n12) );
  INV_X1 U25 ( .A(n12), .ZN(out[10]) );
  AOI222_X1 U26 ( .A1(sel[1]), .A2(in__002[11]), .B1(n18), .B2(in__001[11]), 
        .C1(n17), .C2(in__000[11]), .ZN(n13) );
  INV_X1 U27 ( .A(n13), .ZN(out[11]) );
  AOI222_X1 U28 ( .A1(sel[1]), .A2(in__002[12]), .B1(n18), .B2(in__001[12]), 
        .C1(n17), .C2(in__000[12]), .ZN(n14) );
  INV_X1 U29 ( .A(n14), .ZN(out[12]) );
  AOI222_X1 U30 ( .A1(sel[1]), .A2(in__002[13]), .B1(n18), .B2(in__001[13]), 
        .C1(n17), .C2(in__000[13]), .ZN(n15) );
  INV_X1 U31 ( .A(n15), .ZN(out[13]) );
  AOI222_X1 U32 ( .A1(sel[1]), .A2(in__002[14]), .B1(n18), .B2(in__001[14]), 
        .C1(n17), .C2(in__000[14]), .ZN(n16) );
  INV_X1 U33 ( .A(n16), .ZN(out[14]) );
  AOI222_X1 U34 ( .A1(sel[1]), .A2(in__002[15]), .B1(n18), .B2(in__001[15]), 
        .C1(n17), .C2(in__000[15]), .ZN(n19) );
  INV_X1 U35 ( .A(n19), .ZN(out[15]) );
  NOR2_X2 U2 ( .A1(sel[1]), .A2(n1), .ZN(n18) );
  NOR2_X1 U3 ( .A1(sel[1]), .A2(sel[0]), .ZN(n17) );
endmodule


module GcdUnit_Mux_0xdd6473406d1a99a_0 ( clk, in__000, in__001, out, reset, 
        sel );
  input [0:0] clk;
  input [15:0] in__000;
  input [15:0] in__001;
  output [15:0] out;
  input [0:0] reset;
  input [0:0] sel;


  MUX2_X1 U1 ( .A(in__000[0]), .B(in__001[0]), .S(sel[0]), .Z(out[0]) );
  MUX2_X1 U2 ( .A(in__000[1]), .B(in__001[1]), .S(sel[0]), .Z(out[1]) );
  MUX2_X1 U3 ( .A(in__000[2]), .B(in__001[2]), .S(sel[0]), .Z(out[2]) );
  MUX2_X1 U4 ( .A(in__000[3]), .B(in__001[3]), .S(sel[0]), .Z(out[3]) );
  MUX2_X1 U5 ( .A(in__000[4]), .B(in__001[4]), .S(sel[0]), .Z(out[4]) );
  MUX2_X1 U6 ( .A(in__000[5]), .B(in__001[5]), .S(sel[0]), .Z(out[5]) );
  MUX2_X1 U7 ( .A(in__000[6]), .B(in__001[6]), .S(sel[0]), .Z(out[6]) );
  MUX2_X1 U8 ( .A(in__000[7]), .B(in__001[7]), .S(sel[0]), .Z(out[7]) );
  MUX2_X1 U9 ( .A(in__000[8]), .B(in__001[8]), .S(sel[0]), .Z(out[8]) );
  MUX2_X1 U10 ( .A(in__000[9]), .B(in__001[9]), .S(sel[0]), .Z(out[9]) );
  MUX2_X1 U11 ( .A(in__000[10]), .B(in__001[10]), .S(sel[0]), .Z(out[10]) );
  MUX2_X1 U12 ( .A(in__000[11]), .B(in__001[11]), .S(sel[0]), .Z(out[11]) );
  MUX2_X1 U13 ( .A(in__000[12]), .B(in__001[12]), .S(sel[0]), .Z(out[12]) );
  MUX2_X1 U14 ( .A(in__000[13]), .B(in__001[13]), .S(sel[0]), .Z(out[13]) );
  MUX2_X1 U15 ( .A(in__000[14]), .B(in__001[14]), .S(sel[0]), .Z(out[14]) );
  MUX2_X1 U16 ( .A(in__000[15]), .B(in__001[15]), .S(sel[0]), .Z(out[15]) );
endmodule


module GcdUnit_Subtractor_0x422b1f52edd46a85_DW01_sub_J1_0_0 ( A, B, CI, DIFF, 
        CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] DIFF;
  input CI;
  output CO;
  wire   n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117;

  INV_X1 U38 ( .A(B[14]), .ZN(n117) );
  INV_X1 U39 ( .A(B[13]), .ZN(n115) );
  INV_X1 U40 ( .A(B[12]), .ZN(n113) );
  INV_X1 U41 ( .A(B[11]), .ZN(n111) );
  INV_X1 U42 ( .A(B[10]), .ZN(n109) );
  INV_X1 U43 ( .A(B[9]), .ZN(n107) );
  INV_X1 U44 ( .A(B[8]), .ZN(n105) );
  INV_X1 U45 ( .A(B[7]), .ZN(n103) );
  INV_X1 U46 ( .A(B[6]), .ZN(n101) );
  INV_X1 U47 ( .A(B[5]), .ZN(n99) );
  INV_X1 U48 ( .A(B[4]), .ZN(n97) );
  INV_X1 U49 ( .A(B[3]), .ZN(n95) );
  INV_X1 U50 ( .A(B[2]), .ZN(n93) );
  INV_X1 U51 ( .A(B[1]), .ZN(n91) );
  INV_X1 U52 ( .A(A[0]), .ZN(n87) );
  NAND2_X1 U53 ( .A1(B[0]), .A2(n87), .ZN(n90) );
  XOR2_X1 U54 ( .A(A[15]), .B(n88), .Z(n89) );
  XNOR2_X1 U55 ( .A(B[15]), .B(n89), .ZN(DIFF[15]) );
  XOR2_X1 U56 ( .A(A[0]), .B(B[0]), .Z(DIFF[0]) );
  FA_X1 U57 ( .A(n91), .B(A[1]), .CI(n90), .CO(n92), .S(DIFF[1]) );
  FA_X1 U58 ( .A(n93), .B(A[2]), .CI(n92), .CO(n94), .S(DIFF[2]) );
  FA_X1 U59 ( .A(n95), .B(A[3]), .CI(n94), .CO(n96), .S(DIFF[3]) );
  FA_X1 U60 ( .A(n97), .B(A[4]), .CI(n96), .CO(n98), .S(DIFF[4]) );
  FA_X1 U61 ( .A(n99), .B(A[5]), .CI(n98), .CO(n100), .S(DIFF[5]) );
  FA_X1 U62 ( .A(n101), .B(A[6]), .CI(n100), .CO(n102), .S(DIFF[6]) );
  FA_X1 U63 ( .A(n103), .B(A[7]), .CI(n102), .CO(n104), .S(DIFF[7]) );
  FA_X1 U64 ( .A(n105), .B(A[8]), .CI(n104), .CO(n106), .S(DIFF[8]) );
  FA_X1 U65 ( .A(n107), .B(A[9]), .CI(n106), .CO(n108), .S(DIFF[9]) );
  FA_X1 U66 ( .A(n109), .B(A[10]), .CI(n108), .CO(n110), .S(DIFF[10]) );
  FA_X1 U67 ( .A(n111), .B(A[11]), .CI(n110), .CO(n112), .S(DIFF[11]) );
  FA_X1 U68 ( .A(n113), .B(A[12]), .CI(n112), .CO(n114), .S(DIFF[12]) );
  FA_X1 U69 ( .A(n115), .B(A[13]), .CI(n114), .CO(n116), .S(DIFF[13]) );
  FA_X1 U70 ( .A(n117), .B(A[14]), .CI(n116), .CO(n88), .S(DIFF[14]) );
endmodule


module GcdUnit_Subtractor_0x422b1f52edd46a85_0 ( clk, in0, in1, out, reset );
  input [0:0] clk;
  input [15:0] in0;
  input [15:0] in1;
  output [15:0] out;
  input [0:0] reset;


  GcdUnit_Subtractor_0x422b1f52edd46a85_DW01_sub_J1_0_0 sub_x_1 ( .A(in0), .B(
        in1), .CI(1'b0), .DIFF(out) );
endmodule


module GcdUnit_SNPS_CLOCK_GATE_HIGH_RegEn_0x68db79c4ec1d6e5b_1_0 ( CLK, EN, 
        ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CLKGATETST_X1 latch ( .CK(CLK), .E(EN), .SE(TE), .GCK(ENCLK) );
endmodule


module GcdUnit_RegEn_0x68db79c4ec1d6e5b_0 ( clk, en, in_, out, reset );
  input [0:0] clk;
  input [0:0] en;
  input [15:0] in_;
  output [15:0] out;
  input [0:0] reset;
  wire   net336;

  GcdUnit_SNPS_CLOCK_GATE_HIGH_RegEn_0x68db79c4ec1d6e5b_1_0 clk_gate_out_reg ( 
        .CLK(clk[0]), .EN(en[0]), .ENCLK(net336), .TE(1'b0) );
  DFF_X1 out_reg_15_ ( .D(in_[15]), .CK(net336), .Q(out[15]) );
  DFF_X1 out_reg_14_ ( .D(in_[14]), .CK(net336), .Q(out[14]) );
  DFF_X1 out_reg_13_ ( .D(in_[13]), .CK(net336), .Q(out[13]) );
  DFF_X1 out_reg_12_ ( .D(in_[12]), .CK(net336), .Q(out[12]) );
  DFF_X1 out_reg_11_ ( .D(in_[11]), .CK(net336), .Q(out[11]) );
  DFF_X1 out_reg_10_ ( .D(in_[10]), .CK(net336), .Q(out[10]) );
  DFF_X1 out_reg_9_ ( .D(in_[9]), .CK(net336), .Q(out[9]) );
  DFF_X1 out_reg_8_ ( .D(in_[8]), .CK(net336), .Q(out[8]) );
  DFF_X1 out_reg_7_ ( .D(in_[7]), .CK(net336), .Q(out[7]) );
  DFF_X1 out_reg_6_ ( .D(in_[6]), .CK(net336), .Q(out[6]) );
  DFF_X1 out_reg_5_ ( .D(in_[5]), .CK(net336), .Q(out[5]) );
  DFF_X1 out_reg_4_ ( .D(in_[4]), .CK(net336), .Q(out[4]) );
  DFF_X1 out_reg_3_ ( .D(in_[3]), .CK(net336), .Q(out[3]) );
  DFF_X1 out_reg_2_ ( .D(in_[2]), .CK(net336), .Q(out[2]) );
  DFF_X1 out_reg_1_ ( .D(in_[1]), .CK(net336), .Q(out[1]) );
  DFF_X1 out_reg_0_ ( .D(in_[0]), .CK(net336), .Q(out[0]) );
endmodule


module GcdUnit_SNPS_CLOCK_GATE_HIGH_RegEn_0x68db79c4ec1d6e5b_0_0 ( CLK, EN, 
        ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CLKGATETST_X1 latch ( .CK(CLK), .E(EN), .SE(TE), .GCK(ENCLK) );
endmodule


module GcdUnit_RegEn_0x68db79c4ec1d6e5b_1 ( clk, en, in_, out, reset );
  input [0:0] clk;
  input [0:0] en;
  input [15:0] in_;
  output [15:0] out;
  input [0:0] reset;
  wire   net318;

  GcdUnit_SNPS_CLOCK_GATE_HIGH_RegEn_0x68db79c4ec1d6e5b_0_0 clk_gate_out_reg ( 
        .CLK(clk[0]), .EN(en[0]), .ENCLK(net318), .TE(1'b0) );
  DFF_X1 out_reg_15_ ( .D(in_[15]), .CK(net318), .Q(out[15]) );
  DFF_X1 out_reg_14_ ( .D(in_[14]), .CK(net318), .Q(out[14]) );
  DFF_X1 out_reg_13_ ( .D(in_[13]), .CK(net318), .Q(out[13]) );
  DFF_X1 out_reg_12_ ( .D(in_[12]), .CK(net318), .Q(out[12]) );
  DFF_X1 out_reg_11_ ( .D(in_[11]), .CK(net318), .Q(out[11]) );
  DFF_X1 out_reg_10_ ( .D(in_[10]), .CK(net318), .Q(out[10]) );
  DFF_X1 out_reg_9_ ( .D(in_[9]), .CK(net318), .Q(out[9]) );
  DFF_X1 out_reg_8_ ( .D(in_[8]), .CK(net318), .Q(out[8]) );
  DFF_X1 out_reg_7_ ( .D(in_[7]), .CK(net318), .Q(out[7]) );
  DFF_X1 out_reg_6_ ( .D(in_[6]), .CK(net318), .Q(out[6]) );
  DFF_X1 out_reg_5_ ( .D(in_[5]), .CK(net318), .Q(out[5]) );
  DFF_X1 out_reg_4_ ( .D(in_[4]), .CK(net318), .Q(out[4]) );
  DFF_X1 out_reg_3_ ( .D(in_[3]), .CK(net318), .Q(out[3]) );
  DFF_X1 out_reg_2_ ( .D(in_[2]), .CK(net318), .Q(out[2]) );
  DFF_X1 out_reg_1_ ( .D(in_[1]), .CK(net318), .Q(out[1]) );
  DFF_X1 out_reg_0_ ( .D(in_[0]), .CK(net318), .Q(out[0]) );
endmodule


module GcdUnit_GcdUnitDpathRTL_0x29124399ca008c5e_0 ( a_mux_sel, a_reg_en, 
        b_mux_sel, b_reg_en, clk, is_a_lt_b, is_b_zero, req_msg_a, req_msg_b, 
        reset, resp_msg );
  input [1:0] a_mux_sel;
  input [0:0] a_reg_en;
  input [0:0] b_mux_sel;
  input [0:0] b_reg_en;
  input [0:0] clk;
  output [0:0] is_a_lt_b;
  output [0:0] is_b_zero;
  input [15:0] req_msg_a;
  input [15:0] req_msg_b;
  input [0:0] reset;
  output [15:0] resp_msg;
  wire   n13, n14;
  wire   [15:0] a_reg_out;
  wire   [15:0] a_mux_out;
  wire   [15:0] b_mux_out;
  wire   [15:0] b_reg_out;

  GcdUnit_RegEn_0x68db79c4ec1d6e5b_0 a_reg ( .clk(clk[0]), .en(a_reg_en[0]), 
        .in_(a_mux_out), .out(a_reg_out), .reset(1'b0) );
  GcdUnit_LtComparator_0x422b1f52edd46a85_0 a_lt_b ( .clk(1'b0), .in0(
        a_reg_out), .in1(b_reg_out), .out(is_a_lt_b[0]), .reset(1'b0) );
  GcdUnit_ZeroComparator_0x422b1f52edd46a85_0 b_zero ( .clk(1'b0), .in_(
        b_reg_out), .out(is_b_zero[0]), .reset(1'b0) );
  GcdUnit_Mux_0x683fa1a418b072c9_0 a_mux ( .clk(1'b0), .in__000(req_msg_a), 
        .in__001(resp_msg), .in__002(b_reg_out), .out(a_mux_out), .reset(1'b0), 
        .sel({n14, a_mux_sel[0]}) );
  GcdUnit_Mux_0xdd6473406d1a99a_0 b_mux ( .clk(1'b0), .in__000(a_reg_out), 
        .in__001(req_msg_b), .out(b_mux_out), .reset(1'b0), .sel(n13) );
  GcdUnit_Subtractor_0x422b1f52edd46a85_0 sub ( .clk(1'b0), .in0(a_reg_out), 
        .in1(b_reg_out), .out(resp_msg), .reset(1'b0) );
  GcdUnit_RegEn_0x68db79c4ec1d6e5b_1 b_reg ( .clk(clk[0]), .en(b_reg_en[0]), 
        .in_(b_mux_out), .out(b_reg_out), .reset(1'b0) );
  CLKBUF_X1 U13 ( .A(b_mux_sel[0]), .Z(n13) );
  CLKBUF_X1 U14 ( .A(a_mux_sel[1]), .Z(n14) );
endmodule


module GcdUnit ( clk, req_msg, req_rdy, req_val, reset, resp_msg, resp_rdy, 
        resp_val );
  input [0:0] clk;
  input [31:0] req_msg;
  output [0:0] req_rdy;
  input [0:0] req_val;
  input [0:0] reset;
  output [15:0] resp_msg;
  input [0:0] resp_rdy;
  output [0:0] resp_val;
  wire   ctrl_b_mux_sel_0_, ctrl_b_reg_en_0_, ctrl_a_reg_en_0_,
         dpath_is_b_zero_0_, dpath_is_a_lt_b_0_;
  wire   [1:0] ctrl_a_mux_sel;

  GcdUnit_GcdUnitCtrlRTL_0x29124399ca008c5e_0 ctrl ( .a_mux_sel(ctrl_a_mux_sel), .a_reg_en(ctrl_a_reg_en_0_), .b_mux_sel(ctrl_b_mux_sel_0_), .b_reg_en(
        ctrl_b_reg_en_0_), .clk(clk[0]), .is_a_lt_b(dpath_is_a_lt_b_0_), 
        .is_b_zero(dpath_is_b_zero_0_), .req_rdy(req_rdy[0]), .req_val(
        req_val[0]), .reset(reset[0]), .resp_rdy(resp_rdy[0]), .resp_val(
        resp_val[0]) );
  GcdUnit_GcdUnitDpathRTL_0x29124399ca008c5e_0 dpath ( .a_mux_sel(
        ctrl_a_mux_sel), .a_reg_en(ctrl_a_reg_en_0_), .b_mux_sel(
        ctrl_b_mux_sel_0_), .b_reg_en(ctrl_b_reg_en_0_), .clk(clk[0]), 
        .is_a_lt_b(dpath_is_a_lt_b_0_), .is_b_zero(dpath_is_b_zero_0_), 
        .req_msg_a(req_msg[31:16]), .req_msg_b(req_msg[15:0]), .reset(1'b0), 
        .resp_msg(resp_msg) );
endmodule


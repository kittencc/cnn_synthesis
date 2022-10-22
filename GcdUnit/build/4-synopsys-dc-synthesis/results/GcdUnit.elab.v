/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : L-2016.03-SP5-5
// Date      : Fri Oct 21 23:06:52 2022
/////////////////////////////////////////////////////////////


module RegRst_0x9f365fdf6c8998a ( clk, in_, out, reset );
  input [0:0] clk;
  input [1:0] in_;
  output [1:0] out;
  input [0:0] reset;


  \**SEQGEN**  \out_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(in_[1]), 
        .clocked_on(clk[0]), .data_in(1'b0), .enable(1'b0), .Q(out[1]), 
        .synch_clear(reset[0]), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  \out_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(in_[0]), 
        .clocked_on(clk[0]), .data_in(1'b0), .enable(1'b0), .Q(out[0]), 
        .synch_clear(reset[0]), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
endmodule


module GcdUnitCtrlRTL_0x29124399ca008c5e ( a_mux_sel, a_reg_en, b_mux_sel, 
        b_reg_en, clk, is_a_lt_b, is_b_zero, req_rdy, req_val, reset, resp_rdy, 
        resp_val );
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
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43,
         N44, N45;
  wire   [1:0] state$out;
  wire   [1:0] next_state__0;
  assign req_rdy[0] = b_mux_sel[0];

  RegRst_0x9f365fdf6c8998a state ( .clk(clk[0]), .in_(next_state__0), .out(
        state$out), .reset(reset[0]) );
  GTECH_NOT I_0 ( .A(state$out[1]), .Z(N31) );
  GTECH_OR2 C83 ( .A(state$out[0]), .B(N31), .Z(N32) );
  GTECH_NOT I_1 ( .A(N32), .Z(N33) );
  GTECH_NOT I_2 ( .A(state$out[0]), .Z(N34) );
  GTECH_OR2 C86 ( .A(N34), .B(state$out[1]), .Z(N35) );
  GTECH_NOT I_3 ( .A(N35), .Z(N36) );
  GTECH_OR2 C89 ( .A(N34), .B(state$out[1]), .Z(N37) );
  GTECH_NOT I_4 ( .A(N37), .Z(N38) );
  GTECH_OR2 C91 ( .A(state$out[0]), .B(state$out[1]), .Z(N39) );
  GTECH_NOT I_5 ( .A(N39), .Z(N40) );
  GTECH_OR2 C94 ( .A(state$out[0]), .B(N31), .Z(N41) );
  GTECH_NOT I_6 ( .A(N41), .Z(N42) );
  GTECH_OR2 C96 ( .A(state$out[0]), .B(state$out[1]), .Z(N43) );
  GTECH_NOT I_7 ( .A(N43), .Z(N44) );
  SELECT_OP C98 ( .DATA1({1'b0, 1'b1}), .DATA2(state$out), .CONTROL1(N0), 
        .CONTROL2(N14), .Z({N16, N15}) );
  GTECH_BUF B_0 ( .A(N13), .Z(N0) );
  SELECT_OP C99 ( .DATA1({N16, N15}), .DATA2(state$out), .CONTROL1(N1), 
        .CONTROL2(N2), .Z({N18, N17}) );
  GTECH_BUF B_1 ( .A(N40), .Z(N1) );
  GTECH_BUF B_2 ( .A(N39), .Z(N2) );
  SELECT_OP C100 ( .DATA1({1'b1, 1'b0}), .DATA2({N18, N17}), .CONTROL1(N3), 
        .CONTROL2(N20), .Z({N22, N21}) );
  GTECH_BUF B_3 ( .A(N19), .Z(N3) );
  SELECT_OP C101 ( .DATA1({N22, N21}), .DATA2({N18, N17}), .CONTROL1(N4), 
        .CONTROL2(N5), .Z({N24, N23}) );
  GTECH_BUF B_4 ( .A(N38), .Z(N4) );
  GTECH_BUF B_5 ( .A(N37), .Z(N5) );
  SELECT_OP C102 ( .DATA1({1'b0, 1'b0}), .DATA2({N24, N23}), .CONTROL1(N6), 
        .CONTROL2(N26), .Z({N28, N27}) );
  GTECH_BUF B_6 ( .A(N25), .Z(N6) );
  SELECT_OP C103 ( .DATA1({N28, N27}), .DATA2({N24, N23}), .CONTROL1(N7), 
        .CONTROL2(N8), .Z(next_state__0) );
  GTECH_BUF B_7 ( .A(N33), .Z(N7) );
  GTECH_BUF B_8 ( .A(N32), .Z(N8) );
  SELECT_OP C104 ( .DATA1({is_a_lt_b[0], N45}), .DATA2({1'b0, 1'b0}), 
        .CONTROL1(N9), .CONTROL2(N30), .Z(a_mux_sel) );
  GTECH_BUF B_9 ( .A(N36), .Z(N9) );
  SELECT_OP C105 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b0), .DATA4(1'b0), 
        .CONTROL1(N10), .CONTROL2(N9), .CONTROL3(N11), .CONTROL4(N12), .Z(
        a_reg_en[0]) );
  GTECH_BUF B_10 ( .A(b_mux_sel[0]), .Z(N10) );
  GTECH_BUF B_11 ( .A(resp_val[0]), .Z(N11) );
  GTECH_BUF B_12 ( .A(N29), .Z(N12) );
  SELECT_OP C106 ( .DATA1(1'b1), .DATA2(is_a_lt_b[0]), .DATA3(1'b0), .DATA4(
        1'b0), .CONTROL1(N10), .CONTROL2(N9), .CONTROL3(N11), .CONTROL4(N12), 
        .Z(b_reg_en[0]) );
  GTECH_AND2 C111 ( .A(req_val[0]), .B(b_mux_sel[0]), .Z(N13) );
  GTECH_NOT I_8 ( .A(N13), .Z(N14) );
  GTECH_AND2 C116 ( .A(N45), .B(is_b_zero[0]), .Z(N19) );
  GTECH_NOT I_9 ( .A(is_a_lt_b[0]), .Z(N45) );
  GTECH_NOT I_10 ( .A(N19), .Z(N20) );
  GTECH_AND2 C122 ( .A(resp_val[0]), .B(resp_rdy[0]), .Z(N25) );
  GTECH_NOT I_11 ( .A(N25), .Z(N26) );
  GTECH_AND2 C125 ( .A(state$out[1]), .B(state$out[0]), .Z(N29) );
  GTECH_BUF B_13 ( .A(N44), .Z(b_mux_sel[0]) );
  GTECH_BUF B_14 ( .A(N42), .Z(resp_val[0]) );
  GTECH_BUF B_15 ( .A(N35), .Z(N30) );
endmodule


module RegEn_0x68db79c4ec1d6e5b ( clk, en, in_, out, reset );
  input [0:0] clk;
  input [0:0] en;
  input [15:0] in_;
  output [15:0] out;
  input [0:0] reset;


  \**SEQGEN**  \out_reg[15]  ( .clear(1'b0), .preset(1'b0), .next_state(
        in_[15]), .clocked_on(clk[0]), .data_in(1'b0), .enable(1'b0), .Q(
        out[15]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(en[0]) );
  \**SEQGEN**  \out_reg[14]  ( .clear(1'b0), .preset(1'b0), .next_state(
        in_[14]), .clocked_on(clk[0]), .data_in(1'b0), .enable(1'b0), .Q(
        out[14]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(en[0]) );
  \**SEQGEN**  \out_reg[13]  ( .clear(1'b0), .preset(1'b0), .next_state(
        in_[13]), .clocked_on(clk[0]), .data_in(1'b0), .enable(1'b0), .Q(
        out[13]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(en[0]) );
  \**SEQGEN**  \out_reg[12]  ( .clear(1'b0), .preset(1'b0), .next_state(
        in_[12]), .clocked_on(clk[0]), .data_in(1'b0), .enable(1'b0), .Q(
        out[12]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(en[0]) );
  \**SEQGEN**  \out_reg[11]  ( .clear(1'b0), .preset(1'b0), .next_state(
        in_[11]), .clocked_on(clk[0]), .data_in(1'b0), .enable(1'b0), .Q(
        out[11]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(en[0]) );
  \**SEQGEN**  \out_reg[10]  ( .clear(1'b0), .preset(1'b0), .next_state(
        in_[10]), .clocked_on(clk[0]), .data_in(1'b0), .enable(1'b0), .Q(
        out[10]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(en[0]) );
  \**SEQGEN**  \out_reg[9]  ( .clear(1'b0), .preset(1'b0), .next_state(in_[9]), 
        .clocked_on(clk[0]), .data_in(1'b0), .enable(1'b0), .Q(out[9]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(en[0]) );
  \**SEQGEN**  \out_reg[8]  ( .clear(1'b0), .preset(1'b0), .next_state(in_[8]), 
        .clocked_on(clk[0]), .data_in(1'b0), .enable(1'b0), .Q(out[8]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(en[0]) );
  \**SEQGEN**  \out_reg[7]  ( .clear(1'b0), .preset(1'b0), .next_state(in_[7]), 
        .clocked_on(clk[0]), .data_in(1'b0), .enable(1'b0), .Q(out[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(en[0]) );
  \**SEQGEN**  \out_reg[6]  ( .clear(1'b0), .preset(1'b0), .next_state(in_[6]), 
        .clocked_on(clk[0]), .data_in(1'b0), .enable(1'b0), .Q(out[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(en[0]) );
  \**SEQGEN**  \out_reg[5]  ( .clear(1'b0), .preset(1'b0), .next_state(in_[5]), 
        .clocked_on(clk[0]), .data_in(1'b0), .enable(1'b0), .Q(out[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(en[0]) );
  \**SEQGEN**  \out_reg[4]  ( .clear(1'b0), .preset(1'b0), .next_state(in_[4]), 
        .clocked_on(clk[0]), .data_in(1'b0), .enable(1'b0), .Q(out[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(en[0]) );
  \**SEQGEN**  \out_reg[3]  ( .clear(1'b0), .preset(1'b0), .next_state(in_[3]), 
        .clocked_on(clk[0]), .data_in(1'b0), .enable(1'b0), .Q(out[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(en[0]) );
  \**SEQGEN**  \out_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(in_[2]), 
        .clocked_on(clk[0]), .data_in(1'b0), .enable(1'b0), .Q(out[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(en[0]) );
  \**SEQGEN**  \out_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(in_[1]), 
        .clocked_on(clk[0]), .data_in(1'b0), .enable(1'b0), .Q(out[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(en[0]) );
  \**SEQGEN**  \out_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(in_[0]), 
        .clocked_on(clk[0]), .data_in(1'b0), .enable(1'b0), .Q(out[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(en[0]) );
endmodule


module LtComparator_0x422b1f52edd46a85 ( clk, in0, in1, out, reset );
  input [0:0] clk;
  input [15:0] in0;
  input [15:0] in1;
  output [0:0] out;
  input [0:0] reset;


  LT_UNS_OP lt_617 ( .A(in0), .B(in1), .Z(out[0]) );
endmodule


module ZeroComparator_0x422b1f52edd46a85 ( clk, in_, out, reset );
  input [0:0] clk;
  input [15:0] in_;
  output [0:0] out;
  input [0:0] reset;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15;
  assign out[0] = N15;

  GTECH_OR2 C5 ( .A(in_[14]), .B(in_[15]), .Z(N0) );
  GTECH_OR2 C6 ( .A(in_[13]), .B(N0), .Z(N1) );
  GTECH_OR2 C7 ( .A(in_[12]), .B(N1), .Z(N2) );
  GTECH_OR2 C8 ( .A(in_[11]), .B(N2), .Z(N3) );
  GTECH_OR2 C9 ( .A(in_[10]), .B(N3), .Z(N4) );
  GTECH_OR2 C10 ( .A(in_[9]), .B(N4), .Z(N5) );
  GTECH_OR2 C11 ( .A(in_[8]), .B(N5), .Z(N6) );
  GTECH_OR2 C12 ( .A(in_[7]), .B(N6), .Z(N7) );
  GTECH_OR2 C13 ( .A(in_[6]), .B(N7), .Z(N8) );
  GTECH_OR2 C14 ( .A(in_[5]), .B(N8), .Z(N9) );
  GTECH_OR2 C15 ( .A(in_[4]), .B(N9), .Z(N10) );
  GTECH_OR2 C16 ( .A(in_[3]), .B(N10), .Z(N11) );
  GTECH_OR2 C17 ( .A(in_[2]), .B(N11), .Z(N12) );
  GTECH_OR2 C18 ( .A(in_[1]), .B(N12), .Z(N13) );
  GTECH_OR2 C19 ( .A(in_[0]), .B(N13), .Z(N14) );
  GTECH_NOT I_0 ( .A(N14), .Z(N15) );
endmodule


module Mux_0x683fa1a418b072c9 ( clk, in_$000, in_$001, in_$002, out, reset, 
        sel );
  input [0:0] clk;
  input [15:0] in_$000;
  input [15:0] in_$001;
  input [15:0] in_$002;
  output [15:0] out;
  input [0:0] reset;
  input [1:0] sel;
  wire   N0, N1, N2, N3, N4, N5;

  GTECH_AND2 C43 ( .A(N0), .B(N1), .Z(N5) );
  GTECH_NOT I_0 ( .A(sel[0]), .Z(N0) );
  GTECH_NOT I_1 ( .A(sel[1]), .Z(N1) );
  SELECT_OP C44 ( .DATA1(in_$000[15]), .DATA2(in_$001[15]), .DATA3(in_$002[15]), .CONTROL1(N2), .CONTROL2(N3), .CONTROL3(N4), .Z(out[15]) );
  GTECH_BUF B_0 ( .A(N5), .Z(N2) );
  GTECH_BUF B_1 ( .A(sel[0]), .Z(N3) );
  GTECH_BUF B_2 ( .A(sel[1]), .Z(N4) );
  SELECT_OP C45 ( .DATA1(in_$000[14]), .DATA2(in_$001[14]), .DATA3(in_$002[14]), .CONTROL1(N2), .CONTROL2(N3), .CONTROL3(N4), .Z(out[14]) );
  SELECT_OP C46 ( .DATA1(in_$000[13]), .DATA2(in_$001[13]), .DATA3(in_$002[13]), .CONTROL1(N2), .CONTROL2(N3), .CONTROL3(N4), .Z(out[13]) );
  SELECT_OP C47 ( .DATA1(in_$000[12]), .DATA2(in_$001[12]), .DATA3(in_$002[12]), .CONTROL1(N2), .CONTROL2(N3), .CONTROL3(N4), .Z(out[12]) );
  SELECT_OP C48 ( .DATA1(in_$000[11]), .DATA2(in_$001[11]), .DATA3(in_$002[11]), .CONTROL1(N2), .CONTROL2(N3), .CONTROL3(N4), .Z(out[11]) );
  SELECT_OP C49 ( .DATA1(in_$000[10]), .DATA2(in_$001[10]), .DATA3(in_$002[10]), .CONTROL1(N2), .CONTROL2(N3), .CONTROL3(N4), .Z(out[10]) );
  SELECT_OP C50 ( .DATA1(in_$000[9]), .DATA2(in_$001[9]), .DATA3(in_$002[9]), 
        .CONTROL1(N2), .CONTROL2(N3), .CONTROL3(N4), .Z(out[9]) );
  SELECT_OP C51 ( .DATA1(in_$000[8]), .DATA2(in_$001[8]), .DATA3(in_$002[8]), 
        .CONTROL1(N2), .CONTROL2(N3), .CONTROL3(N4), .Z(out[8]) );
  SELECT_OP C52 ( .DATA1(in_$000[7]), .DATA2(in_$001[7]), .DATA3(in_$002[7]), 
        .CONTROL1(N2), .CONTROL2(N3), .CONTROL3(N4), .Z(out[7]) );
  SELECT_OP C53 ( .DATA1(in_$000[6]), .DATA2(in_$001[6]), .DATA3(in_$002[6]), 
        .CONTROL1(N2), .CONTROL2(N3), .CONTROL3(N4), .Z(out[6]) );
  SELECT_OP C54 ( .DATA1(in_$000[5]), .DATA2(in_$001[5]), .DATA3(in_$002[5]), 
        .CONTROL1(N2), .CONTROL2(N3), .CONTROL3(N4), .Z(out[5]) );
  SELECT_OP C55 ( .DATA1(in_$000[4]), .DATA2(in_$001[4]), .DATA3(in_$002[4]), 
        .CONTROL1(N2), .CONTROL2(N3), .CONTROL3(N4), .Z(out[4]) );
  SELECT_OP C56 ( .DATA1(in_$000[3]), .DATA2(in_$001[3]), .DATA3(in_$002[3]), 
        .CONTROL1(N2), .CONTROL2(N3), .CONTROL3(N4), .Z(out[3]) );
  SELECT_OP C57 ( .DATA1(in_$000[2]), .DATA2(in_$001[2]), .DATA3(in_$002[2]), 
        .CONTROL1(N2), .CONTROL2(N3), .CONTROL3(N4), .Z(out[2]) );
  SELECT_OP C58 ( .DATA1(in_$000[1]), .DATA2(in_$001[1]), .DATA3(in_$002[1]), 
        .CONTROL1(N2), .CONTROL2(N3), .CONTROL3(N4), .Z(out[1]) );
  SELECT_OP C59 ( .DATA1(in_$000[0]), .DATA2(in_$001[0]), .DATA3(in_$002[0]), 
        .CONTROL1(N2), .CONTROL2(N3), .CONTROL3(N4), .Z(out[0]) );
endmodule


module Mux_0xdd6473406d1a99a ( clk, in_$000, in_$001, out, reset, sel );
  input [0:0] clk;
  input [15:0] in_$000;
  input [15:0] in_$001;
  output [15:0] out;
  input [0:0] reset;
  input [0:0] sel;
  wire   N0, N1;

  SELECT_OP C5 ( .DATA1(in_$000[15]), .DATA2(in_$001[15]), .CONTROL1(N1), 
        .CONTROL2(N0), .Z(out[15]) );
  GTECH_BUF B_0 ( .A(sel[0]), .Z(N0) );
  SELECT_OP C6 ( .DATA1(in_$000[14]), .DATA2(in_$001[14]), .CONTROL1(N1), 
        .CONTROL2(N0), .Z(out[14]) );
  SELECT_OP C7 ( .DATA1(in_$000[13]), .DATA2(in_$001[13]), .CONTROL1(N1), 
        .CONTROL2(N0), .Z(out[13]) );
  SELECT_OP C8 ( .DATA1(in_$000[12]), .DATA2(in_$001[12]), .CONTROL1(N1), 
        .CONTROL2(N0), .Z(out[12]) );
  SELECT_OP C9 ( .DATA1(in_$000[11]), .DATA2(in_$001[11]), .CONTROL1(N1), 
        .CONTROL2(N0), .Z(out[11]) );
  SELECT_OP C10 ( .DATA1(in_$000[10]), .DATA2(in_$001[10]), .CONTROL1(N1), 
        .CONTROL2(N0), .Z(out[10]) );
  SELECT_OP C11 ( .DATA1(in_$000[9]), .DATA2(in_$001[9]), .CONTROL1(N1), 
        .CONTROL2(N0), .Z(out[9]) );
  SELECT_OP C12 ( .DATA1(in_$000[8]), .DATA2(in_$001[8]), .CONTROL1(N1), 
        .CONTROL2(N0), .Z(out[8]) );
  SELECT_OP C13 ( .DATA1(in_$000[7]), .DATA2(in_$001[7]), .CONTROL1(N1), 
        .CONTROL2(N0), .Z(out[7]) );
  SELECT_OP C14 ( .DATA1(in_$000[6]), .DATA2(in_$001[6]), .CONTROL1(N1), 
        .CONTROL2(N0), .Z(out[6]) );
  SELECT_OP C15 ( .DATA1(in_$000[5]), .DATA2(in_$001[5]), .CONTROL1(N1), 
        .CONTROL2(N0), .Z(out[5]) );
  SELECT_OP C16 ( .DATA1(in_$000[4]), .DATA2(in_$001[4]), .CONTROL1(N1), 
        .CONTROL2(N0), .Z(out[4]) );
  SELECT_OP C17 ( .DATA1(in_$000[3]), .DATA2(in_$001[3]), .CONTROL1(N1), 
        .CONTROL2(N0), .Z(out[3]) );
  SELECT_OP C18 ( .DATA1(in_$000[2]), .DATA2(in_$001[2]), .CONTROL1(N1), 
        .CONTROL2(N0), .Z(out[2]) );
  SELECT_OP C19 ( .DATA1(in_$000[1]), .DATA2(in_$001[1]), .CONTROL1(N1), 
        .CONTROL2(N0), .Z(out[1]) );
  SELECT_OP C20 ( .DATA1(in_$000[0]), .DATA2(in_$001[0]), .CONTROL1(N1), 
        .CONTROL2(N0), .Z(out[0]) );
  GTECH_NOT I_0 ( .A(sel[0]), .Z(N1) );
endmodule


module Subtractor_0x422b1f52edd46a85 ( clk, in0, in1, out, reset );
  input [0:0] clk;
  input [15:0] in0;
  input [15:0] in1;
  output [15:0] out;
  input [0:0] reset;


  SUB_UNS_OP sub_770 ( .A(in0), .B(in1), .Z(out) );
endmodule


module GcdUnitDpathRTL_0x29124399ca008c5e ( a_mux_sel, a_reg_en, b_mux_sel, 
        b_reg_en, clk, is_a_lt_b, is_b_zero, req_msg_a, req_msg_b, reset, 
        resp_msg );
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

  wire   [15:0] a_reg$out;
  wire   [15:0] a_mux$out;
  wire   [15:0] b_mux$out;
  wire   [15:0] b_reg$out;

  RegEn_0x68db79c4ec1d6e5b a_reg ( .clk(clk[0]), .en(a_reg_en[0]), .in_(
        a_mux$out), .out(a_reg$out), .reset(reset[0]) );
  LtComparator_0x422b1f52edd46a85 a_lt_b ( .clk(clk[0]), .in0(a_reg$out), 
        .in1(b_reg$out), .out(is_a_lt_b[0]), .reset(reset[0]) );
  ZeroComparator_0x422b1f52edd46a85 b_zero ( .clk(clk[0]), .in_(b_reg$out), 
        .out(is_b_zero[0]), .reset(reset[0]) );
  Mux_0x683fa1a418b072c9 a_mux ( .clk(clk[0]), .in_$000(req_msg_a), .in_$001(
        resp_msg), .in_$002(b_reg$out), .out(a_mux$out), .reset(reset[0]), 
        .sel(a_mux_sel) );
  Mux_0xdd6473406d1a99a b_mux ( .clk(clk[0]), .in_$000(a_reg$out), .in_$001(
        req_msg_b), .out(b_mux$out), .reset(reset[0]), .sel(b_mux_sel[0]) );
  Subtractor_0x422b1f52edd46a85 sub ( .clk(clk[0]), .in0(a_reg$out), .in1(
        b_reg$out), .out(resp_msg), .reset(reset[0]) );
  RegEn_0x68db79c4ec1d6e5b b_reg ( .clk(clk[0]), .en(b_reg_en[0]), .in_(
        b_mux$out), .out(b_reg$out), .reset(reset[0]) );
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

  wire   [1:0] ctrl$a_mux_sel;
  wire   [0:0] ctrl$b_mux_sel;
  wire   [0:0] ctrl$b_reg_en;
  wire   [0:0] ctrl$a_reg_en;
  wire   [0:0] dpath$is_b_zero;
  wire   [0:0] dpath$is_a_lt_b;

  GcdUnitCtrlRTL_0x29124399ca008c5e ctrl ( .a_mux_sel(ctrl$a_mux_sel), 
        .a_reg_en(ctrl$a_reg_en[0]), .b_mux_sel(ctrl$b_mux_sel[0]), .b_reg_en(
        ctrl$b_reg_en[0]), .clk(clk[0]), .is_a_lt_b(dpath$is_a_lt_b[0]), 
        .is_b_zero(dpath$is_b_zero[0]), .req_rdy(req_rdy[0]), .req_val(
        req_val[0]), .reset(reset[0]), .resp_rdy(resp_rdy[0]), .resp_val(
        resp_val[0]) );
  GcdUnitDpathRTL_0x29124399ca008c5e dpath ( .a_mux_sel(ctrl$a_mux_sel), 
        .a_reg_en(ctrl$a_reg_en[0]), .b_mux_sel(ctrl$b_mux_sel[0]), .b_reg_en(
        ctrl$b_reg_en[0]), .clk(clk[0]), .is_a_lt_b(dpath$is_a_lt_b[0]), 
        .is_b_zero(dpath$is_b_zero[0]), .req_msg_a(req_msg[31:16]), 
        .req_msg_b(req_msg[15:0]), .reset(reset[0]), .resp_msg(resp_msg) );
endmodule


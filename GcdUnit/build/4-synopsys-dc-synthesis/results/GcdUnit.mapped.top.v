/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in topographical mode
// Version   : L-2016.03-SP5-5
// Date      : Fri Oct 21 23:07:08 2022
/////////////////////////////////////////////////////////////


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


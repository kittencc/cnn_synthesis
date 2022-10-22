`ifndef SYNTHESIS

//
// This is an automatically generated file from 
// dc_shell Version L-2016.03-SP5-5 -- Apr 21, 2017
//

// For simulation only. Do not modify.

`default_nettype none

module GcdUnit_svsim
(
  input  wire [   0:0] clk,
  input  wire [  31:0] req_msg,
  output wire [   0:0] req_rdy,
  input  wire [   0:0] req_val,
  input  wire [   0:0] reset,
  output wire [  15:0] resp_msg,
  input  wire [   0:0] resp_rdy,
  output wire [   0:0] resp_val
);

    

  GcdUnit GcdUnit( {>>{ clk }}, {>>{ req_msg }}, {>>{ req_rdy }}, 
        {>>{ req_val }}, {>>{ reset }}, {>>{ resp_msg }}, {>>{ resp_rdy }}, 
        {>>{ resp_val }} );
endmodule
`endif

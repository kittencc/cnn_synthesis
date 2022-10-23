# Author: Cheryl (Yingqiu) Cao
# Updated on: 2022-09-18


set blockname [file rootname [file tail [info script] ]]

source scripts/common.tcl

directive set -DESIGN_HIERARCHY {
    {InputDoubleBuffer<512, 16, 16>}
}
    # remember to change these parameter values to match the actual size
    # of the MAC array


go compile

source scripts/set_libraries.tcl

go libraries
directive set -CLOCKS $clocks

go assembly

# -------------------------------
# Your code starts here
# Set the correct word widths and the stage replication
# -------------------------------

# mem is the internal double buffer
# when changing the word width for the double buffer, it automatically
# changes the word with for din and dout of reader/writer() that uses the
# mem.
directive set /InputDoubleBuffer<512,16,16>/InputDoubleBufferReader<512,16,16>/din -WORD_WIDTH 128
directive set /InputDoubleBuffer<512,16,16>/InputDoubleBufferWriter<512,16,16>/dout -WORD_WIDTH 128
directive set /InputDoubleBuffer<512,16,16>/mem -WORD_WIDTH 128
# stage replication 2 for the double buffer (tool should set it even it
# you don't specify it here)
directive set /InputDoubleBuffer<512,16,16>/mem:cns -STAGE_REPLICATION 2


#for the current_buffer in reader():
directive set /InputDoubleBuffer<512,16,16>/InputDoubleBufferReader<512,16,16>/run/while:current_buffer.data.value -WORD_WIDTH 128
# reader gets one chained_data from the internal mem each cycle
# (init_interval 1).
# This requires the mem to have a word width = precision * IC0 = 8 * 16 =
# 128
# Otherwise, it will take multiple clk cycles to read one chained_data,
# which violates the requirement for init_interval.

# for the current_buffer in writer():
directive set /InputDoubleBuffer<512,16,16>/InputDoubleBufferWriter<512,16,16>/run/while:current_buffer.data.value -WORD_WIDTH 128

#return -code error "Remove this once implemented."
# Your code ends here
# -------------------------------

go architect

go allocate
go extract

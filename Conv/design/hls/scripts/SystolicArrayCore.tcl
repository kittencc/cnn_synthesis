# Updated on: 2022-09-25
# Author: Cheryl (Yingqiu) Cao


set blockname [file rootname [file tail [info script] ]]

source scripts/common.tcl

directive set -DESIGN_HIERARCHY {
    {SystolicArrayCore<IDTYPE, WDTYPE, ODTYPE, 16, 16>}
}

go compile

source scripts/set_libraries.tcl

# add custom module "ProcessingElement as a library module for
# SystolicArrayCore"
solution library add {[CCORE] ProcessingElement<IDTYPE,WDTYPE,ODTYPE>.v1}

go libraries
directive set -CLOCKS $clocks

# when calling the ProcessingElement module in SystolicArray, map it to
# the pre-built module.
directive set /SystolicArrayCore<IDTYPE,WDTYPE,ODTYPE,16,16>/ProcessingElement<IDTYPE,WDTYPE,ODTYPE> -MAP_TO_MODULE {[CCORE] ProcessingElement<IDTYPE,WDTYPE,ODTYPE>.v1}

# Variables requiring larger entries numbers than REGISTER_THRESHOLD will
# automatically be mapped to memory, otherwise to register files.
directive set /SystolicArrayCore<IDTYPE,WDTYPE,ODTYPE,16,16> -REGISTER_THRESHOLD 4096

go assembly

directive set /SystolicArrayCore<IDTYPE,WDTYPE,ODTYPE,16,16>/run -DESIGN_GOAL Latency
directive set /SystolicArrayCore<IDTYPE,WDTYPE,ODTYPE,16,16>/run -CLOCK_OVERHEAD 0.000000

# -------------------------------
# Your code starts here
# Make sure that the accumulation buffer has the appropriate word width
# -------------------------------
#directive set /SystolicArrayCore<IDTYPE,WDTYPE,ODTYPE,16,16>/run/accum_buf:rsc -INTERLEAVE 16
# interleave == OC0
# BLOCK_SIZE == buffer_size/interleave, here buffer_size = 4096
#directive set /SystolicArrayCore<IDTYPE,WDTYPE,ODTYPE,16,16>/run/accum_buf:rsc -BLOCK_SIZE 256
directive set /SystolicArrayCore<IDTYPE,WDTYPE,ODTYPE,16,16>/run/accum_buf -WORD_WIDTH 256

#return -code error "Remove this once implemented."
# -------------------------------
# Your code ends here
# -------------------------------


# -------------------------------
# Your code starts here
# Map the input register, partial sum register, and weight register to registers and not memories
# -------------------------------
directive set /SystolicArrayCore<IDTYPE,WDTYPE,ODTYPE,16,16> -REGISTER_THRESHOLD 4096

# map the following variables to registers
directive set /SystolicArrayCore<IDTYPE,WDTYPE,ODTYPE,16,16>/run/weight_reg_array:rsc -MAP_TO_MODULE {[Register]}
directive set /SystolicArrayCore<IDTYPE,WDTYPE,ODTYPE,16,16>/run/inputIn_reg_array:rsc -MAP_TO_MODULE {[Register]}
directive set /SystolicArrayCore<IDTYPE,WDTYPE,ODTYPE,16,16>/run/inputOut_reg_array:rsc -MAP_TO_MODULE {[Register]}
directive set /SystolicArrayCore<IDTYPE,WDTYPE,ODTYPE,16,16>/run/psumIn_reg_array:rsc -MAP_TO_MODULE {[Register]}
directive set /SystolicArrayCore<IDTYPE,WDTYPE,ODTYPE,16,16>/run/psumOut_reg_array:rsc -MAP_TO_MODULE {[Register]}

#return -code error "Remove this once implemented."
# -------------------------------
# Your code ends here
# -------------------------------

go architect

# -------------------------------
# Your code starts here
# If you try to schedule with an initiation interval of 1, you might run into a dependency error involving the accumulation buffer
# To solve this, you need to use 'ignore_memory_precedences'
# -------------------------------
#ignore_memory_precedences -from write_accum* -to read_accum*
#ignore_memory_precedences -from step:if#3:for:write_mem(accum_buf:rsc.@)#15 -to step:if#2:else:for:read_mem(accum_buf:rsc(0)(0).@)

#ignore_memory_precedences -from step:if#3:for:write_mem(accum_buf:rsc(0)(0).@) -to step:if#2:else:for:read_mem(accum_buf:rsc(0)(0).@)


#for {set i 1} {$i < 16} {incr i} {
#  ignore_memory_precedences -from step:if#3:for:write_mem(accum_buf:rsc(0)($i).@)#$i -to step:if#2:else:for:read_mem(accum_buf:rsc(0)($i).@)#$i
#}

# -------------------------------

go allocate
go extract

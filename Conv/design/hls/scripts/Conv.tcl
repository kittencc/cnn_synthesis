set blockname [file rootname [file tail [info script] ]]

source scripts/common.tcl

directive set -DESIGN_HIERARCHY { 
    {Conv}
}

go compile

source scripts/set_libraries.tcl

solution library add {[Block] InputDoubleBuffer<512,16,16>.v1}
solution library add {[Block] WeightDoubleBuffer<512,16,16>.v1}
solution library add {[Block] SystolicArrayCore<IDTYPE,WDTYPE,ODTYPE,16,16>.v1}

go libraries
directive set -CLOCKS $clocks 

directive set /Conv/SystolicArrayCore<IDTYPE,WDTYPE,ODTYPE,16,16> -MAP_TO_MODULE {[Block] SystolicArrayCore<IDTYPE,WDTYPE,ODTYPE,16,16>.v1}
directive set /Conv/InputDoubleBuffer<512,16,16> -MAP_TO_MODULE {[Block] InputDoubleBuffer<512,16,16>.v1}
directive set /Conv/WeightDoubleBuffer<512,16,16> -MAP_TO_MODULE {[Block] WeightDoubleBuffer<512,16,16>.v1}

directive set /Conv -FIFO_DEPTH 3
directive set /Conv/systolicArray -FIFO_DEPTH 3

go assembly

directive set /Conv/SystolicArrayCore<IDTYPE,WDTYPE,ODTYPE,16,16> -FIFO_DEPTH 3

go architect

go allocate

go extract

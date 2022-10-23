# Updated on: 2022-09-25
# Author: Cheryl (Yingqiu) Cao


set blockname [file rootname [file tail [info script] ]]

source scripts/common.tcl


#directive set -DESIGN_HIERARCHY {
#    {ProcessingElement<ac_int<8,true>, ac_int<8,true>, ac_int<16,true>>}
#}

directive set -DESIGN_HIERARCHY {
    {ProcessingElement<IDTYPE, WDTYPE, ODTYPE>}
}
# Note that the spacing of the template parameters must match exactly as
# those in the .h src file. Otherwise Catapult won't recognize the file
# For example, if you remove the space between "," and "WDTYPE", it will
# give you a directive "not found error".

go compile

source scripts/set_libraries.tcl

go libraries

directive set -CLOCKS $clocks

go assembly

directive set /ProcessingElement<IDTYPE,WDTYPE,ODTYPE>/run -DESIGN_GOAL Latency
directive set /ProcessingElement<IDTYPE,WDTYPE,ODTYPE>/run -CLOCK_OVERHEAD 0.000000

go extract

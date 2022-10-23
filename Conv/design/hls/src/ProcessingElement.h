// Description: combinational PE
//              Note the registers are instantiated in the
//              SystolicArrayCore
// Author: Cheryl (Yingqiu) Cao
// Date: 2022-09-11

#ifndef PROCESSING_ELEMENT_H
#define PROCESSING_ELEMENT_H

// Include mc_scverify.h for CCS_* macros
#include <mc_scverify.h>

template<typename IDTYPE, typename WDTYPE, typename ODTYPE>
class ProcessingElement{
public:
    ProcessingElement(){}

#pragma hls_design interface ccore
    void CCS_BLOCK(run)(IDTYPE &input_in,
                        ODTYPE &psum_in,
                        WDTYPE &weight,
                        IDTYPE &input_out,
                        ODTYPE &psum_out)
    {
        // -------------------------------
        // Your code starts here
        // Perform the MAC operation and forward inputs
        // -------------------------------
        input_out = input_in;
        psum_out = psum_in + input_in * weight;

        // -------------------------------
        // Your code ends here
        // -------------------------------
    }
};

#endif

#ifndef SYSTOLIC_ARRAY_H
#define SYSTOLIC_ARRAY_H

#include "ProcessingElement.h"
#include "conv.h"
#include "Fifo.h"
#include "SystolicArrayCore.h"

// Include mc_scverify.h for CCS_* macros
#include <mc_scverify.h>

class SystolicArrayLooper
{
public:
    SystolicArrayLooper() {}

#pragma hls_design interface
void run(ac_channel<Params> &paramsIn,
         ac_channel<Params> &paramsOut,
         ac_channel<LoopIndices> &loopIndicesOut)
    {
        // -------------------------------
        // Your code starts here
        // Generate the loop indices here for the systolic array.
        // Write the loop indices as well as the params out to channels.
        // -------------------------------
        Params params = paramsIn.read();

        uint_16 ofmap_bank_num = params.OY1 * params.OX1 * params.OC1;

        #pragma hls_unroll no
        LABEL(OY1_OX1_OC1) for (uint_16 idx = 0; idx < ofmap_bank_num; idx ++ ) {
          #pragma hls_unroll no
          LABEL(IC1) for (uint_16 ic1 = 0; ic1 < params.IC1; ic1++){
            #pragma hls_unroll no
            LABEL(FY) for (uint_16 fy = 0; fy < params.FY; fy++){
              #pragma hls_unroll no
              LABEL(FX) for (uint_16 fx = 0; fx < params.FX; fx++){

                paramsOut.write(params);

                LoopIndices loopIndices = {
                  ic1,
                  fy,
                  fx
                };

                loopIndicesOut.write(loopIndices);
              }
            }
          }
        }
        // -------------------------------
        // Your code ends here
        // -------------------------------
    }
};

template <typename IDTYPE, typename WDTYPE, typename ODTYPE, int OC0, int IC0>
class SystolicArrayWrapper
{
public:
    SystolicArrayWrapper(){}

#pragma hls_design interface
#pragma hls_pipeline_init_interval 1
    void run(ac_channel<PackedInt<INPUT_PRECISION, IC0> > &input,
             ac_channel<PackedInt<WEIGHT_PRECISION, OC0> > &weight,
             ac_channel<PackedInt<OUTPUT_PRECISION, OC0> > &output,
             ac_channel<Params> &paramsIn)
    {
        systolicArrayLooper.run(paramsIn, paramsChannel, loopIndicesChannel);
        systolicArrayCore.run(input, weight, output, paramsChannel, loopIndicesChannel);
    }
private:
    SystolicArrayCore<IDTYPE, WDTYPE, ODTYPE, OC0, IC0> systolicArrayCore;
    SystolicArrayLooper systolicArrayLooper;
    ac_channel<Params> paramsChannel;
    ac_channel<LoopIndices> loopIndicesChannel;
};

#endif

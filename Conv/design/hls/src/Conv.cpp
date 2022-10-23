// Description: HLS cnn acclerator top-level design
// commented by Cheryl (Yingqiu)  Cao
// Date: 2022-09-03


#ifndef CONV_TOP_CPP
#define CONV_TOP_CPP


#ifdef __SYNTHESIS__
    #define LABEL(x) x:
#else
    #define LABEL(x) {}
#endif

#include "conv.h"
#include <mc_scverify.h>

#include "Serializer.h"
#include "Deserializer.h"

#include "InputDoubleBuffer.h"
#include "WeightDoubleBuffer.h"
#include "SystolicArray.h"


#pragma hls_design top
class Conv{

public:
   // constructor
    Conv(){}

#pragma hls_design interface
    void CCS_BLOCK(run)(ac_channel<IDTYPE> &input_serial,
                        ac_channel<WDTYPE> &weight_serial,
                        ac_channel<ODTYPE> &output_serial,
                        ac_channel<uint_16> &paramsIn)
    {
        // takes the cnn parameters, determines the patermeter for each of
        // the sub-modules
        paramsDeserializer.run(paramsIn, inputDoubleBufferParams, weightDoubleBufferParams, systolicArrayParams);

        // sends input_out to the systolic array
        inputDoubleBuffer.run(input_serial, input_out, inputDoubleBufferParams);
        weightDoubleBuffer.run(weight_serial, weight_out, weightDoubleBufferParams);
        systolicArray.run(input_out, weight_out, output, systolicArrayParams);

        // takes output from the systolic array
        outputSerializer.run(output, output_serial);
    }

private:
    
    // local variables
    ac_channel<PackedInt<INPUT_PRECISION,ARRAY_DIMENSION> > input_out;
    ac_channel<PackedInt<WEIGHT_PRECISION,ARRAY_DIMENSION> > weight_out;
    ac_channel<PackedInt<OUTPUT_PRECISION,ARRAY_DIMENSION> > output;
    // each ac_channel contains chained version of data
    // for example, for ifmap, let's say we have IC0 = 4 = PE
    // ARRAY_DIMENSION.
    // each input_out data contains ifmap from 4 IC0 iterations


    // initialize local class
    ParamsDeserializer paramsDeserializer;
    Serializer<PackedInt<OUTPUT_PRECISION, ARRAY_DIMENSION>, ODTYPE, ARRAY_DIMENSION> outputSerializer;

    InputDoubleBuffer<INPUT_BUFFER_SIZE, ARRAY_DIMENSION, ARRAY_DIMENSION> inputDoubleBuffer;
    ac_channel<Params> inputDoubleBufferParams;

    WeightDoubleBuffer<WEIGHT_BUFFER_SIZE, ARRAY_DIMENSION, ARRAY_DIMENSION> weightDoubleBuffer;
    ac_channel<Params> weightDoubleBufferParams;

    SystolicArrayWrapper<IDTYPE,WDTYPE,ODTYPE, ARRAY_DIMENSION, ARRAY_DIMENSION> systolicArray;
    ac_channel<Params> systolicArrayParams;
};

#endif

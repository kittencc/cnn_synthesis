// Description: Takes a chained data, and unchain it
// commented by: Cheryl (Yingqiu) Cao
// Date: 2022-09-03


#ifndef SERIALIZER_H
#define SERIALIZER_H

// n is the chaining #
// n will be OC0 to output the ofmap to the testbench
template<typename DTYPE, typename DTYPE_SERIAL, int n>
class Serializer{

public:
    // constructor
    Serializer(){}

#pragma hls_design interface
#pragma hls_pipeline_init_interval 1
void CCS_BLOCK(run)(ac_channel<DTYPE> &inputChannel,
                    ac_channel<DTYPE_SERIAL> &serialOutChannel)
    {
        #ifndef __SYNTHESIS__
        // x.available(m) is a boolean method that checks if the
        // ac_channel has m available number for read operations
        while(inputChannel.available(1))
        #endif
        {
            DTYPE input = inputChannel.read();

            #pragma hls_pipeline_init_interval 1
            for(int i = 0; i < n; i++){
                serialOutChannel.write(input.value[i]);
            }
        }
    }
};

#endif

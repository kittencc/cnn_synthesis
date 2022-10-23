// Description: weight double buffer
// Author: Cheryl (Yingqiu) Cao
// Updated on 2022-09-10
//    - added code for writer();
//    - added code for reader();



#ifndef WEIGHT_DOUBLE_BUFFER_H
#define WEIGHT_DOUBLE_BUFFER_H

template <int size, int IC0, int OC0>
class WeightDoubleBufferWriter{
public:
    WeightDoubleBufferWriter(){}

    #pragma hls_design interface
    void CCS_BLOCK(run)(ac_channel<Params> &paramsIn,
                        ac_channel<WDTYPE> &din,
                        ac_channel<chanStruct<PackedInt<WEIGHT_PRECISION, OC0>, size> > &dout)
    {
        // -------------------------------
        // Your code starts here
        // -------------------------------

        // load input parameters
        Params params = paramsIn.read();

        // determine the weight block_size for each bank
        //  == IC0 * FX * FY
        ac_int<ac::log2_ceil<size>::val, false> block_size = IC0 * params.FX * params.FY;
        // The memory size must be big enough for 1 block to fit

        // calculate the total # of weight banks to be written
        uint_32 weight_write_bank_num = params.OY1 * params.OX1 * params.OC1 * params.IC1;


        while(weight_write_bank_num > 0) {  // there are still ifmap banks to be written

          uint_16 page_idx = 0;
          // The double buffer mem may hold more than one ifmap bank at
          // the same time.
          // Each page corresponds to one ifmap bank (IC1 * IY0 * IX0).
          // For example, if the mem can hold 2 ifmap banks, page_idx in
          // range of [0,1].

          // one buffer for the output ac_channel          chanStruct<PackedInt<INPUT_PRECISION,IC0>,size> current_buffer;
          chanStruct<PackedInt<WEIGHT_PRECISION, OC0>,size> current_buffer;

          while((weight_write_bank_num > 0) && ((page_idx + 1) * block_size <= size)) {
            // Exit condition 1: remaining mem cannot hold one more
            // page/ifmap bank;
            // Exit condition 2: all banks written. there may be extra
            // space in the mem.

            // write one bank
            for(ac_int<ac::log2_ceil<size>::val, false> i = 0; i < block_size; i++) {

               // variable to hold the input data
              PackedInt<WEIGHT_PRECISION, OC0> chained_data;

              // chaining the input data (deserialize)
              #pragma hls_pipeline_init_interval 1
              for(int j = 0; j < OC0; j++) {
                chained_data.value[j] = din.read();
              }

              current_buffer.data[page_idx * block_size + i] = chained_data;
            }

            // completes one page/bank
            page_idx++;
            weight_write_bank_num--;
          }

          // outputs one completed buffer to the ac_channel
          dout.write(current_buffer);
        }


        // -------------------------------
        // Your code ends here
        // -------------------------------
    }
};

template <int size, int IC0, int OC0>
class WeightDoubleBufferReader{
public:
    WeightDoubleBufferReader(){}

    #pragma hls_design interface
    void CCS_BLOCK(run)(ac_channel<Params> &paramsIn,
                        ac_channel<chanStruct<PackedInt<WEIGHT_PRECISION, OC0>,size> > &din,
                        ac_channel<PackedInt<WEIGHT_PRECISION, OC0> > &dout)
    {
        // -------------------------------
        // Your code starts here
        // -------------------------------

        // load input parameters
        Params params = paramsIn.read();

        // determine the weight block_size for each bank
        //  == IC0 * FX * FY
        ac_int<ac::log2_ceil<size>::val, false> block_size = IC0 * params.FX * params.FY;
        // The memory size must be big enough for 1 block to fit

        // calculate the total # of weight banks to be written
        uint_32 weight_read_bank_num = params.OY1 * params.OX1 * params.OC1 * params.IC1;

        while(weight_read_bank_num > 0){ // still weight banks to be read by the MAC array

          uint_16 page_idx = 0;
          // The double buffer mem may hold more than one ifmap bank at
          // the same time.
          // Each page corresponds to one ifmap bank (FY * FX * IC0).
          // For example, if the mem can hold 2 weight banks, page_idx in
          // range of [0,1].

          chanStruct<PackedInt<WEIGHT_PRECISION, OC0>,size> current_buffer;
          // read one block from the double buffer (may contain multiple
          // read banks)
          current_buffer = din.read();

          while((weight_read_bank_num > 0) && ((page_idx + 1) * block_size <= size)) {
 
          // output one bank of weight data
          #pragma hls_pipeline_init_interval 1
          for (uint_16 fy = 0; fy < params.FY; fy++)
            for (uint_16 fx = 0; fx < params.FX; fx++)
              for (uint_16 ic0 = 0; ic0< IC0; ic0++){
                
                // determine the flattened ifmap index
                ac_int<ac::log2_ceil<size>::val, false> idx = fy * params.FX * IC0 + fx * IC0 + ic0;

                // read from the double buffer
                // sends one output data
                PackedInt<WEIGHT_PRECISION, OC0> output_data = current_buffer.data[page_idx * block_size + idx];
                dout.write(output_data);
            }

            // completes reading  one bank/page
            page_idx++;
            weight_read_bank_num--;
          } 
        }

        // -------------------------------
        // Your code ends here
        // -------------------------------
    }
};


template <int size, int IC0, int OC0>
class WeightDoubleBuffer{
public:
  WeightDoubleBuffer(){}

  #pragma hls_design interface
  void CCS_BLOCK(run)(ac_channel<WDTYPE> &weights_in,
                      ac_channel<PackedInt<WEIGHT_PRECISION, OC0> > &weights_out,
                      ac_channel<Params> &paramsIn)
    {
        Params params = paramsIn.read();

        #ifndef __SYNTHESIS__
          //  ac_int<ac::log2_ceil<size>::val, false> block_size = IC0 * params.FX * params.FY;
          //  assert(block_size <= size);
        #endif

        weightDoubleBufferReaderParams.write(params);
        weightDoubleBufferWriterParams.write(params);

        weightDoubleBufferWriter.run(weightDoubleBufferWriterParams, weights_in, mem);
        weightDoubleBufferReader.run(weightDoubleBufferReaderParams, mem, weights_out);
    }

private:
    ac_channel<chanStruct<PackedInt<WEIGHT_PRECISION, OC0>,size> > mem;

    WeightDoubleBufferWriter<size, IC0, OC0> weightDoubleBufferWriter;
    ac_channel<Params> weightDoubleBufferWriterParams;

    WeightDoubleBufferReader<size, IC0, OC0> weightDoubleBufferReader;
    ac_channel<Params> weightDoubleBufferReaderParams;
};


#endif

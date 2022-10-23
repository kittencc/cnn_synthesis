// Description: input double buffer
// Author: Cheryl (Yingqiu) Cao
// Updated on 2022-09-06
//    - added code for writer();
// Updated on 2022-09-10
//    - added code for reader();

#ifndef INPUT_DOUBLE_BUFFER_H
#define INPUT_DOUBLE_BUFFER_H

template <int size, int IC0, int OC0>
class InputDoubleBufferWriter{
public:
    InputDoubleBufferWriter(){}

    #pragma hls_design interface
    void CCS_BLOCK(run)(ac_channel<Params> &paramsIn,
                        ac_channel<IDTYPE> &din,
                        ac_channel<chanStruct<PackedInt<INPUT_PRECISION,IC0>,size> > &dout)
    {
        // "size" is the depth for the memory used for the double buffer

        // -------------------------------
        // Your code starts here
        // -------------------------------

        // load input parameters
        Params params = paramsIn.read();

        // derive the remaining cnn parameters
        uint_16 IX0 = params.STRIDE*(params.OX0-1) + params.FX;
        uint_16 IY0 = params.STRIDE*(params.OY0-1) + params.FY;

        // determine the ifmap block_size for each bank
        //  == IC1 * IX0 * IY0
        // each ifmap block saves IC1*IY0*IX0 date entries
        ac_int<ac::log2_ceil<size>::val, false> block_size = params.IC1 * IX0 * IY0;
        // The memory size must be big enough for 1 block to fit

        // calculate the total # of ifmap banks to be written
        uint_32 ifmap_write_bank_num = params.OY1 * params.OX1;


        while(ifmap_write_bank_num > 0) {  // there are still ifmap banks to be written

          uint_16 page_idx = 0;
          // The double buffer mem may hold more than one ifmap bank at
          // the same time.
          // Each page corresponds to one ifmap bank (IC1 * IY0 * IX0).
          // For example, if the mem can hold 2 ifmap banks, page_idx in
          // range of [0,1].

          // one buffer for the output ac_channel          chanStruct<PackedInt<INPUT_PRECISION,IC0>,size> current_buffer;
          chanStruct<PackedInt<INPUT_PRECISION,IC0>,size> current_buffer;

          while((ifmap_write_bank_num > 0) && ((page_idx + 1) * block_size <= size)) {
            // Exit condition 1: remaining mem cannot hold one more
            // page/ifmap bank;
            // Exit condition 2: all banks written. there may be extra
            // space in the mem.

            // write one bank
            for(ac_int<ac::log2_ceil<size>::val, false> i = 0; i < block_size; i++) {

               // variable to hold the input data
              PackedInt<INPUT_PRECISION,IC0> chained_data;

              // chaining the input data (deserialize)
              #pragma hls_pipeline_init_interval 1
              for(int j = 0; j < IC0; j++) {
                chained_data.value[j] = din.read();
              }

              current_buffer.data[page_idx * block_size + i] = chained_data;
            }

            // completes one page/bank
            page_idx++;
            ifmap_write_bank_num--;
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
class InputDoubleBufferReader{
public:
    InputDoubleBufferReader(){}

    #pragma hls_design interface
    void CCS_BLOCK(run)(ac_channel<Params> &paramsIn,
                        ac_channel<chanStruct<PackedInt<INPUT_PRECISION, IC0>,size> > &din,
                        ac_channel<PackedInt<INPUT_PRECISION, IC0> > &dout)
    {
        // -------------------------------
        // Your code starts here
        // -------------------------------

        // load input parameters
        Params params = paramsIn.read();

        // derive the remaining cnn parameters
        uint_16 IX0 = params.STRIDE*(params.OX0-1) + params.FX;
        uint_16 IY0 = params.STRIDE*(params.OY0-1) + params.FY;

        // determine the ifmap block_size for each bank
        //  == IC1 * IX0 * IY0
        // each ifmap block saves IC1*IY0*IX0 date entries
        ac_int<ac::log2_ceil<size>::val, false> block_size = params.IC1 * IX0 * IY0;
        // The memory size must be big enough for 1 block to fit

        // calculate the total # of ifmap banks to be written
        uint_32 ifmap_read_bank_num = params.OY1 * params.OX1;


        while(ifmap_read_bank_num > 0){ // still ifmap banks to be read by the MAC array

          uint_16 page_idx = 0;
          // The double buffer mem may hold more than one ifmap bank at
          // the same time.
          // Each page corresponds to one ifmap bank (IC1 * IY0 * IX0).
          // For example, if the mem can hold 2 ifmap banks, page_idx in
          // range of [0,1].

          chanStruct<PackedInt<INPUT_PRECISION,IC0>,size> current_buffer;
          // read one block from the double buffer (may contain multiple
          // read banks)
          current_buffer = din.read();

          while((ifmap_read_bank_num > 0) && ((page_idx + 1) * block_size <= size)) {
 
          // output one bank of ifmap data
          #pragma hls_pipeline_init_interval 1
          for(uint_16 oc1 = 0; oc1 < params.OC1; oc1++)
            for (uint_16 ic1 = 0; ic1 < params.IC1; ic1++)
              for (uint_16 fy = 0; fy < params.FY; fy++)
                for (uint_16 fx = 0; fx < params.FX; fx++)
                  for (uint_16 oy0 = 0; oy0 < params.OY0; oy0++)
                    for (uint_16 ox0 = 0; ox0 < params.OX0; ox0++){

                   // determine ix0 and iy0 index
                  uint_32 ix0 = ox0 * params.STRIDE + fx;
                  uint_32 iy0 = oy0 * params.STRIDE + fy;

                  // determine the flattened ifmap index
                  ac_int<ac::log2_ceil<size>::val, false> idx = ic1 * IY0 * IX0 + iy0 * IX0 + ix0;

                  // read from the double buffer
                  // sends one output data
                  PackedInt<INPUT_PRECISION, IC0> output_data = current_buffer.data[page_idx * block_size + idx];
                  dout.write(output_data);
                    }

            // completes reading  one bank/page
            page_idx++;
            ifmap_read_bank_num--;
          } 
        }


        // -------------------------------
        // Your code ends here
        // -------------------------------
    }
};

// "size" is the depth for the memory used for the double buffer
template <int size, int IC0, int OC0>
class InputDoubleBuffer{
public:

  // constructor
  InputDoubleBuffer(){}

  #pragma hls_design interface
  void CCS_BLOCK(run)(ac_channel<IDTYPE> &inputs_in,
                      ac_channel<PackedInt<INPUT_PRECISION, IC0> > &inputs_out,
                      ac_channel<Params> &paramsIn)
    {
        // read the cnn parameters
        Params params = paramsIn.read();

        // derive the remaining cnn parameters
        uint_16 IX0 = params.STRIDE*(params.OX0-1) + params.FX;
        uint_16 IY0 = params.STRIDE*(params.OY0-1) + params.FY;

        #ifndef __SYNTHESIS__
        // each ifmap block saves IC1*IY0*IX0 date entries
        // ac_int<ac::log2_ceil<size>::val, false> block_size = params.IC1 * IX0 * IY0;
        // The memory size must be big enough for 1 block to fit
        // assert(block_size <= size);
        #endif

        inputDoubleBufferReaderParams.write(params);
        inputDoubleBufferWriterParams.write(params);

        // "mem" is the double buffer shared between the reader and the
        // writer.
        inputDoubleBufferWriter.run(inputDoubleBufferWriterParams, inputs_in, mem);
        inputDoubleBufferReader.run(inputDoubleBufferReaderParams, mem, inputs_out);
    }

private:
    ac_channel<chanStruct< PackedInt<INPUT_PRECISION, IC0>, size> > mem;
    // each entry in "mem" is an array data[size], where each data is the
    // chained (by IC0) version of ifmap.
    // The item passed by the ac_channel is the entire ifmap bank

    InputDoubleBufferWriter<size, IC0, OC0> inputDoubleBufferWriter;
    ac_channel<Params> inputDoubleBufferWriterParams;

    InputDoubleBufferReader<size, IC0, OC0> inputDoubleBufferReader;
    ac_channel<Params> inputDoubleBufferReaderParams;
};

#endif

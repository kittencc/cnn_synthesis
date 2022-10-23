// Description: SystolicArrayCore
//              - performs MAC operation for one cnn iteration
// Author: Cheryl (Yingqiu) Cao
// Date: 2022-09-11

#ifndef SYSTOLIC_ARRAY_CORE_H
#define SYSTOLIC_ARRAY_CORE_H

#include <boost/preprocessor/repetition/repeat.hpp>
#include <boost/preprocessor/punctuation/comma_if.hpp>
#include <boost/preprocessor/cat.hpp>
#include <boost/preprocessor/arithmetic/inc.hpp>
#include <boost/preprocessor/comparison/not_equal.hpp>
#include <boost/preprocessor/repetition/for.hpp>
#include <boost/preprocessor/tuple/elem.hpp>
#include <boost/preprocessor/tuple/size.hpp>
#include <boost/preprocessor/control/if.hpp>
#include <boost/preprocessor/punctuation/comma.hpp>
#include <boost/preprocessor/arithmetic/dec.hpp>

#include "ProcessingElement.h"
#include "Fifo.h"


struct LoopIndices{
    uint_16 ic1_idx;
    uint_16 fx_idx;
    uint_16 fy_idx;
};



template <typename IDTYPE, typename WDTYPE, typename ODTYPE, int OC0, int IC0>
class SystolicArrayCore
{
public:
    SystolicArrayCore() {}

#pragma hls_design interface
#pragma hls_pipeline_init_interval 1
    void run(
        ac_channel<PackedInt<INPUT_PRECISION, IC0> > &input,
        ac_channel<PackedInt<WEIGHT_PRECISION, OC0> > &weight,
        ac_channel<PackedInt<OUTPUT_PRECISION, OC0> > &output,
        ac_channel<Params> &paramsIn,
        ac_channel<LoopIndices> &loopIndicesIn)
    {
        #ifndef __SYNTHESIS__
        //assert(params.OX0 * params.OY0 * params.OC1 < ACCUMULATION_BUFFER_SIZE);
        #endif

        #ifndef __SYNTHESIS__
        while(paramsIn.available(1))
        #endif
        {
            // -------------------------------
            // Your code starts here
            // Read in the params and loop indices from the channel
            // -------------------------------
            Params params = paramsIn.read();
            LoopIndices loopIndices = loopIndicesIn.read();
            // -------------------------------
            // Your code ends here
            // -------------------------------


            // -------------------------------
            // Your code starts here
            // Create a loop for a "run" of the systolic array.
            // The number of steps in a run of the systolic array is equal to:
            // the ramp-up time + number of pixels + flush time
            // -------------------------------

            // the # of cycles for a psum value to go from the top of the
            // MAC array to the output of the accum_buf
            //  IC0 is the height of the MAC array.
            //  (OC0 - 1) is the height of the de-skewing fifo for the
            //  acuum_buf.
            uint_16 flush_time = IC0 + (OC0 - 1);

            // The number of ifmap data we go through in one iteration
            uint_16 num_pixels = params.OX0 * params.OY0;
            // This is a weight-stationary design, each ifmap data that
            // corresponds to the particular location in the ofmap, gets
            // convolved with one weight which is currently active.

            #pragma hls_unroll no
            #pragma hls_pipeline_init_interval 1
            LABEL(step) for(uint_16 step = 0; step < flush_time + num_pixels; step++ ){

            // -------------------------------
            // Your code ends here
            // You should now be in the body of the loop
            // -------------------------------

                // -------------------------------
                // Your code starts here
                // If you are in the ramp up time, read in weights from the channel
                // and store it in the weights array
                // -------------------------------
                if (step < IC0) {
                  // load weight values into each row of the MAC array
                  PackedInt<WEIGHT_PRECISION, OC0> weight_row = weight.read();

                  // send the weight data to the right row of the weight
                  // register for the MAC array
                  // unroll so that to load the entire row at the same
                  // time, each cycle.
                  # pragma hls_unroll yes
                  for (int j = 0; j < OC0; j++){
                    weight_reg_array[step][j] = weight_row.value[j];
                  }
                }

                // -------------------------------
                // Your code ends here
                // -------------------------------


                PackedInt<INPUT_PRECISION, IC0> in_col;

                // -------------------------------
                // Your code starts here
                // Read inputs from the channel and store in the variable in_col
                // Note: you don't read in any inputs during the flush time
                // -------------------------------
                if (step < num_pixels){
                  // read ifmapa from the input channel
                  in_col = input.read();
                }
                // -------------------------------
                // Your code ends here
                // -------------------------------


                /*
                 * FIFOs for inputs coming in to the systolic array
                 * assign values to in_col, and the skewed version will be in input_buf
                 */
                PackedInt<INPUT_PRECISION, IC0> input_buf;

                #define INPUT_FIFO_BODY(z,i,unused) \
                    IDTYPE BOOST_PP_CAT(input_fifo_output_, i); \
                    IDTYPE BOOST_PP_CAT(input_fifo_input_, i) = in_col.value[i]; \
                    BOOST_PP_CAT(input_fifo_, i).run( BOOST_PP_CAT(input_fifo_input_, i) , BOOST_PP_CAT(input_fifo_output_, i) ); \
                    input_buf.value[i] = BOOST_PP_CAT(input_fifo_output_, i);

                REPEAT(INPUT_FIFO_BODY)


                // -------------------------------
                // Your code starts here
                // Assign values from input_buf into the registers for the first column of PEs
                // -------------------------------
                // connects the ifmap fifo to the PE array
                #pragma hls_unroll yes
                LABEL(INIT_IN) for (int j = 0; j < IC0; j++)    // j is the row index
                  inputIn_reg_array[j+1][0] = input_buf.value[j];
                // -------------------------------
                // Your code ends here
                // -------------------------------


                // tmp_output_buf is the output from the
                // accum_double_buffer, and the input to the accumIn
                // skewing fifo.
                PackedInt<OUTPUT_PRECISION, OC0> tmp_output_buf;
                // -------------------------------
                // Your code starts here
                // Determine the partial sum to be fed into the PE array
                // Depending on the loop index, the partial output will be 0 or a value from the accumulation buffer
                // -------------------------------
                if (step < num_pixels){   // the on time for psumIn is the same as ifmap. We read both at the same time.

                  // for the 1st iteration of a new weight, there is no
                  // previous psum. Therefore we feed 0 as psum to the PE
                  // array.
                  if (loopIndices.ic1_idx == 0 && loopIndices.fy_idx == 0 && loopIndices.fx_idx == 0)
                    #pragma hls_unroll yes
                    for (int j = 0; j < OC0; j++){
                      // set_val<VAL>() is a special method for ac_int
                      // type
                      tmp_output_buf.value[j].template set_val<AC_VAL_0>();
                    }
                  else {
                    #pragma hls_unroll yes
                    for (int j = 0; j < OC0; j++){
                      tmp_output_buf.value[j] = accum_buf[step][j];
                      // accum_buf saves the psum from the previous weight
                      // iteration (the big run).
                      //  step ranges [0, num_pixels], corresponds to all
                      //  ofmap pixel that was convolved from 1 weight.
                    }
                  }
                }
                // -------------------------------
                // Your code ends here
                // -------------------------------

                /*
                 * FIFOs for partial outputs coming in to the systolic array
                 * assign values to tmp_output_buf, and the skewed version will be in output_buf
                 */
                PackedInt<OUTPUT_PRECISION, OC0> output_buf;
                // output_buf is the output from the accumIn skew fifo,
                // and the psumIn input to the PE array

                #define ACCUM_FIFO_BODY(z,i,unused) \
                    ODTYPE BOOST_PP_CAT(accum_fifo_output_, i); \
                    ODTYPE BOOST_PP_CAT(accum_fifo_input_, i) = tmp_output_buf.value[i]; \
                    BOOST_PP_CAT(accum_fifo_, i).run( BOOST_PP_CAT(accum_fifo_input_, i) , BOOST_PP_CAT(accum_fifo_output_, i) ); \
                    output_buf.value[i] = BOOST_PP_CAT(accum_fifo_output_, i);

                REPEAT(ACCUM_FIFO_BODY)

                // -------------------------------
                // Your code starts here
                // Connect  output_buf to the partial sum registers for the first column of PEs
                // -------------------------------
                #pragma hls_unroll yes
                for (int j = 0; j < OC0; j++){
                  psumIn_reg_array[0][j+1] = output_buf.value[j];
                }
                // -------------------------------
                // Your code ends here
                // -------------------------------


                // -------------------------------
                // Your code starts here
                // Run the 16x16 PE array
                // Make sure that the correct registers are given to the PE
                // -------------------------------
                #pragma hls_unroll yes
                LABEL(ROW) for (int i = 0; i < IC0; i++){
                  #pragma hls_unroll yes
                  LABEL(COL) for (int j = 0; j < OC0; j++){
                    pe_array[i][j].run(
                         inputIn_reg_array[i+1][j],
                         psumIn_reg_array[i][j+1],
                         weight_reg_array[i][j],
                         inputOut_reg_array[i+1][j+1],
                         psumOut_reg_array[i+1][j+1]);
                    // inputOut reg saved in the next PE
                    // psumOut_reg saved in the next PE
                  }
                }


                // -------------------------------
                // Your code ends here
                // -------------------------------

                /*
                 * FIFOs for partial outputs coming out of the systolic array
                 * The skewed version will be in the variable output_row
                 */
                PackedInt<OUTPUT_PRECISION, OC0> output_row;

                #define FIFO_WRITE_BODY_NEW(z,i,unused)\
                    ODTYPE BOOST_PP_CAT(output_fifo_output_, i); \
                    BOOST_PP_CAT(output_fifo_, i).run( psumIn_reg_array[IC0][i+1] , BOOST_PP_CAT(output_fifo_output_, i) );\
                    output_row.value[i] = BOOST_PP_CAT(output_fifo_output_,i); \

                REPEAT(FIFO_WRITE_BODY_NEW)

                // -------------------------------
                // Your code starts here
                // After a certain number of cycles, you will have valid output from the systolic array
                // Depending on the loop indices, this valid output will either be written into the accumulation buffer or written out
                // -------------------------------
                if (step >= flush_time){ // the number of cycles/steps for the 1st partial_sum to propagate through the MAC array and the accum_out fifo.

                  if (loopIndices.ic1_idx == (params.IC1 - 1) && loopIndices.fy_idx == (params.FY - 1) && loopIndices.fx_idx == (params.FX - 1) ) {     // completes one ic1_fy_fx iteration, ready to output ofmap
                    output.write(output_row);
                  }

                  // feeds accumOut_fifo output to the accum_buf
                  #pragma hls_unroll yes
                  for (int j = 0; j < OC0; j++){
                    accum_buf[step - flush_time][j] = output_row.value[j];
                    // accum_buf saves partial sum for OX0 * OY0
                    // the 0th ofmap partial sum takes flush_time to
                    // appear at the input of the accum_buf
                  }
                }
                // -------------------------------
                // Your code ends here
                // -------------------------------

                // -------------------------------
                // Your code starts here
                // Cycle the input/psum registers
                // inputIn/psumIn of this col/col is inputOut/psumOut from
                // the previous col/row.
                // -------------------------------
                #pragma hls_unroll yes
                for (int i = 0; i < IC0; i++){
                  #pragma hls_unroll yes
                  for (int j = 0; j < OC0; j++){
                    // proceed to next j/col
                    inputIn_reg_array[i+1][j+1] = inputOut_reg_array[i+1][j+1];
                    // inputIn_reg_array[][0] takes output from ifmap skew
                    // fifo.

                    // proceed to next i/row
                    psumIn_reg_array[i+1][j+1] = psumOut_reg_array[i+1][j+1];
                    // psumIn_reg_array[0][] takes output from accumIn
                    // skew fifo.
                  }
                }
                // -------------------------------
                // Your code ends here
                // -------------------------------
            }
        }

    }

private:

    // -------------------------------
    // Your code starts here
    // Create the following:
    //  - PE array
    //  - accumulation buffer
    //  - weight registers
    //  - input registers (two sets, one at the input of the PE and one at the output)
    //  - psum registers (two sets, one at the input of the PE and one at the output)
    // -------------------------------

    // declare the PE array
    ProcessingElement<IDTYPE, WDTYPE, ODTYPE> pe_array[IC0][OC0];

    // accum buffer
    ODTYPE accum_buf[ACCUMULATION_BUFFER_SIZE][OC0];        // why IC0? I think that's a typo
    // ACCUMULATION_BUFFER_SIZE is defined in conv.h, defaults to 256

    // weight registers
    WDTYPE weight_reg_array[IC0][OC0];

    // input registers
    IDTYPE inputIn_reg_array[IC0 + 1][OC0 + 1];
    IDTYPE inputOut_reg_array[IC0 + 1][OC0 + 1];

    // partial sum regs
    ODTYPE psumIn_reg_array[IC0 + 1][OC0 + 1];
    ODTYPE psumOut_reg_array[IC0 + 1][OC0 + 1];


    // -------------------------------
    // Your code ends here
    // -------------------------------


#define INPUT_FIFOS_INIT(z, i, unused) \
    Fifo<IDTYPE, i + 1> BOOST_PP_CAT(input_fifo_, i);

    REPEAT(INPUT_FIFOS_INIT)

#define ACCUM_FIFOS_INIT(z, i, unused) \
    Fifo<ODTYPE, i + 1> BOOST_PP_CAT(accum_fifo_, i);

    REPEAT(ACCUM_FIFOS_INIT)


#define OUTPUT_FIFOS_INIT(z, i, unused) \
    Fifo<ODTYPE, OC0 - i> BOOST_PP_CAT(output_fifo_, i);

    REPEAT(OUTPUT_FIFOS_INIT)
};

#endif

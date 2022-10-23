#ifndef _GLOBAL_SIMPLE_H
#define _GLOBAL_SIMPLE_H

#include <ac_int.h>
#include <ac_channel.h>

// "size_t" is a C++ keyword, the value must be a const or a constexpr!
template <size_t width, size_t EXTENT_0>
struct PackedInt {
  ac_int<width> value[EXTENT_0]; // basically and array, EXTENT_0 as array width
};


// "typename" is a C++ keyword, indicating the variable is a placeholder
// for a type
template<typename T, int N>
struct chanStruct{
  T data[N];
};

typedef ac_int<16, false> uint_16;
typedef ac_int<32, false> uint_32;
typedef ac_int<64, false> uint_64;

// parameters for the cnn
struct Params {
   uint_16 OY1;
   uint_16 OX1;
   uint_16 OY0;
   uint_16 OX0;

   uint_16 OC1;
   uint_16 IC1;
   uint_16 FX;
   uint_16 FY;
   uint_16 STRIDE;
};

#define ARRAY_DIMENSION 16
#define REPEAT(x) BOOST_PP_REPEAT(ARRAY_DIMENSION, x, 0)

#define INPUT_PRECISION 8
#define WEIGHT_PRECISION 8
#define OUTPUT_PRECISION (2*INPUT_PRECISION)

#define INPUT_BUFFER_SIZE  16/2*1024/ARRAY_DIMENSION // Input buffer size per IC0 per bank
#define WEIGHT_BUFFER_SIZE 16/2*1024/ARRAY_DIMENSION // Weight buffer size per OC0 per bank
#define ACCUMULATION_BUFFER_SIZE 64

//  data types for ifmap, weight and ofmap
typedef ac_int<INPUT_PRECISION,true> IDTYPE;
typedef ac_int<WEIGHT_PRECISION,true> WDTYPE;
typedef ac_int<OUTPUT_PRECISION,true> ODTYPE;


#endif


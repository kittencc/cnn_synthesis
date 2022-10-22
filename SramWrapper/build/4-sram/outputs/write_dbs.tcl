read_lib ./sram_TT_1p0V_25C.lib
write_lib sram_TT_1p0V_25C_lib -format db -output ./sram_TT_1p0V_25C.db
remove_lib sram_TT_1p0V_25C
read_lib ./sram_SS_1p0V_25C.lib
write_lib sram_SS_1p0V_25C_lib -format db -output ./sram_SS_1p0V_25C.db
remove_lib sram_SS_1p0V_25C
read_lib ./sram_FF_1p0V_25C.lib
write_lib sram_FF_1p0V_25C_lib -format db -output ./sram_FF_1p0V_25C.db
remove_lib sram_FF_1p0V_25C
read_lib ./sram_TT_3p3V_25C.lib
write_lib sram_TT_3p3V_25C_lib -format db -output ./sram_TT_3p3V_25C.db
remove_lib sram_TT_3p3V_25C
exit

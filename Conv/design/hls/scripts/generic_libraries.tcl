solution library add nangate-45nm_beh -- -rtlsyntool DesignCompiler -vendor Nangate -technology 045nm
#solution library add ccs_sample_mem
# add the generated SRAMs as lib cells
solution library add sram_512_128
solution library add sram_64_256

#solution library add ccs_sample_mem -- -rtlsyntool DesignCompiler -vendor Sample 

# set accum_buffer_module ccs_sample_mem.ccs_ram_sync_1R1W
# set double_buffer_module ccs_sample_mem.ccs_ram_sync_1R1W 

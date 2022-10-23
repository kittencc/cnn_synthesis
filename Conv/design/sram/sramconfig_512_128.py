# Updated by Cheryl (Yingqiu) Cao
# Date: 2022-10-21

# Data word size
word_size = 128
# Number of words in the memory
num_words = 512

# Technology to use in $OPENRAM_TECH
tech_name = "freepdk45"
# Process corners to characterize
process_corners = ["TT"]
# Voltage corners to characterize
supply_voltages = [ 1.1 ]
# Temperature corners to characterize
temperatures = [ 25 ]

# Output directory for the results
output_path = "outputs"
# Output file base name
# output_name = "sram"
# Helpful if you have multiple SRAMs
output_name = "sram_{0}_{1}".format(num_words,word_size)

# Disable analytical models for full characterization (WARNING: slow!)
# analytical_delay = False

# To force this to use calibre for DRC/LVS/PEX
drc_name = "calibre"
lvs_name = "calibre"
pex_name = "calibre"

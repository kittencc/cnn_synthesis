# Check if project folder " build" already exists
if {[file isdirectory build]} { 
    project load build
} else {
    project new -name build
    project save
}

options set Input/TargetPlatform x86_64
options set Input/SearchPath ./src
options set Output/OutputVHDL false
options set Architectural/DefaultRegisterThreshold 4096

flow package require /SCVerify
flow package option set /SCVerify/USE_CCS_BLOCK true
flow package option set /SCVerify/USE_NCSIM true
flow package option set /SCVerify/USE_VCS false
flow package option set /SCVerify/USE_MSIM false

flow package require /NCSim

solution options set Flows/NCSim/NC_ROOT /cad/cadence/INCISIVE15.20.022/
# add the generated SRAM cells as library files
solution options set ComponentLibs/SearchPath {/home/users/ctorng/work/cc/ee272-hw5/Conv/design/hls /home/users/ctorng/work/cc/ee272-hw5/Conv/design/hls/mem_outputs} -append

# Delete solution if already exists
catch {
    set existing_solution [project get /SOLUTION/$blockname* -match glob -return leaf]
    solution remove -solution $existing_solution -delete
}

# set clk_period 5.0
#  This read clock_period as a parameter.
#  The parameter is defined in configure.yml for the hls node
set clk_period $::env(clock_period)

set clocks "clk \"-CLOCK_PERIOD $clk_period -CLOCK_EDGE rising -CLOCK_HIGH_TIME [expr $clk_period/2] -CLOCK_OFFSET 0.000000 -CLOCK_UNCERTAINTY 0.0 -RESET_KIND async -RESET_SYNC_NAME rst -RESET_SYNC_ACTIVE high -RESET_ASYNC_NAME arst_n -RESET_ASYNC_ACTIVE low -ENABLE_NAME {} -ENABLE_ACTIVE high\" "

go new
solution file add ./src/Conv.cpp
solution file add ./src/ConvTb.cpp -exclude true

go analyze


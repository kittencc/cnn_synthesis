# export MFLOWGEN_HOME=/afs/ir/class/ee272/mflowgen

#export MFLOWGEN_HOME=/home/users/ctorng/work/cc/mflowgen
export MFLOWGEN_HOME=/sim/ctorng/cc/mflowgen

export OPENRAM_HOME=/afs/ir/class/ee272/OpenRAM/compiler
export OPENRAM_TECH=/afs/ir/class/ee272/OpenRAM/technology
export PYTHONPATH=$PYTHONPATH:$OPENRAM_HOME

export FREEPDK45=/cad/freepdk/FreePDK45

export PATH=/cad/mentor/2019.11/Catapult_Synthesis_10.4b-841621/Mgc_home/bin:$PATH
export MGLS_LICENSE_FILE=1717@cadlic0.stanford.edu

source /cad/modules/tcl/init/sh
module load base
module load lc
module load dc_shell

# Autocomplete for make
complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' ?akefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make

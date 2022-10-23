flow package require MemGen
flow run /MemGen/MemoryGenerator_BuildLib {
VENDOR           *
RTLTOOL          DesignCompiler
TECHNOLOGY       *
LIBRARY          sram_64_256
MODULE           sram_64_256
OUTPUT_DIR       /home/users/ctorng/work/cc/ee272-hw5/Conv/design/hls/mem_outputs
FILES {
  { FILENAME /home/users/ctorng/work/cc/ee272-hw5/Conv/build/3-sram/outputs/sram_64_256.v FILETYPE Verilog MODELTYPE generic PARSE 1 PATHTYPE copy STATICFILE 1 VHDL_LIB_MAPS work }
}
VHDLARRAYPATH    {}
WRITEDELAY       0.1
INITDELAY        1
READDELAY        0.1
VERILOGARRAYPATH {}
INPUTDELAY       0.01
TIMEUNIT         1ns
WIDTH            256
AREA             0
RDWRRESOLUTION   UNKNOWN
WRITELATENCY     1
READLATENCY      1
DEPTH            64
PARAMETERS {
  { PARAMETER DATA_WIDTH TYPE hdl IGNORE 0 MIN {} MAX {} DEFAULT 256 }
  { PARAMETER ADDR_WIDTH TYPE hdl IGNORE 0 MIN {} MAX {} DEFAULT 6   }
  { PARAMETER RAM_DEPTH  TYPE hdl IGNORE 1 MIN {} MAX {} DEFAULT 0   }
  { PARAMETER DELAY      TYPE hdl IGNORE 1 MIN {} MAX {} DEFAULT 0   }
}
PORTS {
  { NAME port_0 MODE ReadWrite }
}
PINMAPS {
  { PHYPIN clk0  LOGPIN CLOCK        DIRECTION in  WIDTH 1.0        PHASE 1  DEFAULT {} PORTS port_0 }
  { PHYPIN csb0  LOGPIN CHIP_SELECT  DIRECTION in  WIDTH 1.0        PHASE 0  DEFAULT {} PORTS {}     }
  { PHYPIN web0  LOGPIN WRITE_ENABLE DIRECTION in  WIDTH 1.0        PHASE 0  DEFAULT {} PORTS port_0 }
  { PHYPIN addr0 LOGPIN ADDRESS      DIRECTION in  WIDTH ADDR_WIDTH PHASE {} DEFAULT {} PORTS port_0 }
  { PHYPIN din0  LOGPIN DATA_IN      DIRECTION in  WIDTH DATA_WIDTH PHASE {} DEFAULT {} PORTS port_0 }
  { PHYPIN dout0 LOGPIN DATA_OUT     DIRECTION out WIDTH DATA_WIDTH PHASE {} DEFAULT {} PORTS port_0 }
}

}

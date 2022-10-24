#! /usr/bin/env python
#=========================================================================
# construct.py
#=========================================================================
# flow to synthesize the hls generated RTL for the CNN accelerator
#
# Author : Cheryl (Yingqiu) Cao
# Date   : 2022-10-22
#

import os
import sys

from mflowgen.components import Graph, Step

def construct():

  g = Graph()

  #-----------------------------------------------------------------------
  # Parameters
  #-----------------------------------------------------------------------

  adk_name = 'freepdk-45nm'
  adk_view = 'view-standard'

  parameters = {
    'construct_path' : __file__,
    'design_name'    : 'Conv',
    'clock_period'   : 5.0,
    'adk'            : adk_name,
    'adk_view'       : adk_view,
    'topographical'  : True,
  }

  #-----------------------------------------------------------------------
  # Create nodes
  #-----------------------------------------------------------------------

  this_dir = os.path.dirname( os.path.abspath( __file__ ) )

  # ADK step

  g.set_adk( adk_name )
  adk = g.get_adk_step()

  # Custom steps
  sram         = Step( this_dir + '/sram'        )
#  rtl          = Step( this_dir + '/rtl'         )
  constraints  = Step( this_dir + '/constraints' )
  hls          = Step( this_dir + '/hls' )

  # Default steps

  info         = Step( 'info',                  default=True )
  dc           = Step( 'synopsys-dc-synthesis', default=True )

  #-----------------------------------------------------------------------
  # Graph -- Add nodes
  #-----------------------------------------------------------------------

  g.add_step( info         )
  g.add_step( sram         )
#  g.add_step( rtl          )
  g.add_step( hls          )
  g.add_step( constraints  )
  g.add_step( dc           )

  #-----------------------------------------------------------------------
  # Graph -- Add edges
  #-----------------------------------------------------------------------

  # Connect by name

  g.connect_by_name( sram,        hls)
#  g.connect_by_name( rtl,         dc           )
  g.connect_by_name( adk,         dc           )
  g.connect_by_name( constraints, dc           )
  g.connect_by_name( hls,         dc           )

  # Dynamically add edges
  dc.extend_inputs(['sram_512_128_TT_1p1V_25C.db'])
  dc.extend_inputs(['sram_64_256_TT_1p1V_25C.db'])
  g.connect_by_name(sram, dc)

  #-----------------------------------------------------------------------
  # Parameterize
  #-----------------------------------------------------------------------

  g.update_params( parameters )

  return g

if __name__ == '__main__':
  g = construct()
#  g.plot()


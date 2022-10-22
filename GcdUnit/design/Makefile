#=========================================================================
# Makefile
#=========================================================================
# Generator : /home/users/ctorng/work/cc/mflowgen/mflowgen/backends/make_backend.py

SHELL=/usr/bin/env bash -euo pipefail

# $1 -- $dst
# $2 -- $src
# $3 -- $stamp

define cpdir
	rm -rf ./$1
	cp -aL $2 $1 || true
	chmod -R +w $1
	touch $3
endef

# $1 -- $dst
# $2 -- $src
# $3 -- $stamp

define cpdir-and-parameterize
	rm -rf ./$1
	cp -aL $2 $1 || true
	chmod -R +w $1
	cp .mflowgen/$1/configure.yml $1
	touch $3
endef

# $1 -- $dst
# $2 -- $src
# $3 -- $stamp

define mkdir-and-symlink
	rm -rf ./$1
	mkdir -p $1
	cd $1 && ln -sf ../$2/* . && cd ..
	rm $1/configure.yml && cp .mflowgen/$1/configure.yml $1
	touch $3
endef

# $1 -- $dst_dir
# $2 -- $dst
# $3 -- $src
# $4 -- $stamp

define symlink
	mkdir -p $1
	cd $1 && ln -sf $3 $2 && touch $4
endef

# $1 -- $stamp

define stamp
	touch $1
endef

# Default

default: constraints freepdk-45nm info rtl synopsys-dc-synthesis

# ------------------------------------------------------------------------
# constraints
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 0-constraints/.prebuilt)","")
0-constraints/.stamp:
	$(call cpdir-and-parameterize,0-constraints,constraints,0-constraints/.stamp)
endif

# collect inputs

# execute

ifeq ("$(wildcard 0-constraints/.prebuilt)","")

define 0_constraints_commands_rule
	mkdir -p 0-constraints/outputs && set -o pipefail && /home/users/ctorng/work/cc/mflowgen/mflowgen/scripts/mflowgen-letters -c -t constraints && chmod +x .mflowgen/0-constraints/mflowgen-run && cp -f .mflowgen/0-constraints/mflowgen-run 0-constraints && if [[ -e .mflowgen/0-constraints/mflowgen-debug ]]; then chmod +x .mflowgen/0-constraints/mflowgen-debug && cp -f .mflowgen/0-constraints/mflowgen-debug 0-constraints; fi && if [[ -e .mflowgen/0-constraints/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/0-constraints/mflowgen-check-preconditions.py && cp -f .mflowgen/0-constraints/mflowgen-check-preconditions.py 0-constraints; fi && if [[ -e .mflowgen/0-constraints/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/0-constraints/mflowgen-check-postconditions.py && cp -f .mflowgen/0-constraints/mflowgen-check-postconditions.py 0-constraints; fi && cd 0-constraints && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 0-constraints/outputs/*
endef

0-constraints/.execstamp: 0-constraints/.stamp
	$(call 0_constraints_commands_rule)
	touch $@

0-constraints/outputs/.execstamp.constraints.tcl: 0-constraints/.execstamp
	touch $@

endif

# collect outputs

0-constraints/outputs/.stamp.constraints.tcl: 0-constraints/.execstamp 0-constraints/outputs/.execstamp.constraints.tcl
	$(call stamp,0-constraints/outputs/.stamp.constraints.tcl)

# post-conditions

define 0_constraints_post_conditions_commands_rule
	cd 0-constraints && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

0-constraints/.postconditions.stamp: 0-constraints/.execstamp 0-constraints/outputs/.execstamp.constraints.tcl 0-constraints/outputs/.stamp.constraints.tcl
	$(call 0_constraints_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: constraints

constraints: 0-constraints/.execstamp 0-constraints/.postconditions.stamp 0-constraints/outputs/.execstamp.constraints.tcl 0-constraints/outputs/.stamp.constraints.tcl

.PHONY: 0

0: 0-constraints/.execstamp 0-constraints/.postconditions.stamp 0-constraints/outputs/.execstamp.constraints.tcl 0-constraints/outputs/.stamp.constraints.tcl

# debug

# ------------------------------------------------------------------------
# freepdk-45nm
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 1-freepdk-45nm/.prebuilt)","")
1-freepdk-45nm/.stamp:
	$(call mkdir-and-symlink,1-freepdk-45nm,../../../mflowgen/adks/freepdk-45nm,1-freepdk-45nm/.stamp)
endif

# collect inputs

# execute

ifeq ("$(wildcard 1-freepdk-45nm/.prebuilt)","")

define 1_freepdk_45nm_commands_rule
	mkdir -p 1-freepdk-45nm/outputs && set -o pipefail && /home/users/ctorng/work/cc/mflowgen/mflowgen/scripts/mflowgen-letters -c -t freepdk-45nm && chmod +x .mflowgen/1-freepdk-45nm/mflowgen-run && cp -f .mflowgen/1-freepdk-45nm/mflowgen-run 1-freepdk-45nm && if [[ -e .mflowgen/1-freepdk-45nm/mflowgen-debug ]]; then chmod +x .mflowgen/1-freepdk-45nm/mflowgen-debug && cp -f .mflowgen/1-freepdk-45nm/mflowgen-debug 1-freepdk-45nm; fi && if [[ -e .mflowgen/1-freepdk-45nm/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/1-freepdk-45nm/mflowgen-check-preconditions.py && cp -f .mflowgen/1-freepdk-45nm/mflowgen-check-preconditions.py 1-freepdk-45nm; fi && if [[ -e .mflowgen/1-freepdk-45nm/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/1-freepdk-45nm/mflowgen-check-postconditions.py && cp -f .mflowgen/1-freepdk-45nm/mflowgen-check-postconditions.py 1-freepdk-45nm; fi && cd 1-freepdk-45nm && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 1-freepdk-45nm/outputs/*
endef

1-freepdk-45nm/.execstamp: 1-freepdk-45nm/.stamp
	$(call 1_freepdk_45nm_commands_rule)
	touch $@

1-freepdk-45nm/outputs/.execstamp.adk: 1-freepdk-45nm/.execstamp
	touch $@

endif

# collect outputs

1-freepdk-45nm/outputs/.stamp.adk: 1-freepdk-45nm/.execstamp 1-freepdk-45nm/outputs/.execstamp.adk
	$(call stamp,1-freepdk-45nm/outputs/.stamp.adk)

# post-conditions

define 1_freepdk_45nm_post_conditions_commands_rule
	cd 1-freepdk-45nm && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

1-freepdk-45nm/.postconditions.stamp: 1-freepdk-45nm/.execstamp 1-freepdk-45nm/outputs/.execstamp.adk 1-freepdk-45nm/outputs/.stamp.adk
	$(call 1_freepdk_45nm_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: freepdk-45nm

freepdk-45nm: 1-freepdk-45nm/.execstamp 1-freepdk-45nm/.postconditions.stamp 1-freepdk-45nm/outputs/.execstamp.adk 1-freepdk-45nm/outputs/.stamp.adk

.PHONY: 1

1: 1-freepdk-45nm/.execstamp 1-freepdk-45nm/.postconditions.stamp 1-freepdk-45nm/outputs/.execstamp.adk 1-freepdk-45nm/outputs/.stamp.adk

# debug

# ------------------------------------------------------------------------
# info
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 2-info/.prebuilt)","")
2-info/.stamp:
	$(call cpdir-and-parameterize,2-info,../../../mflowgen/steps/info,2-info/.stamp)
endif

# collect inputs

# execute

ifeq ("$(wildcard 2-info/.prebuilt)","")

define 2_info_commands_rule
	mkdir -p 2-info/outputs && set -o pipefail && /home/users/ctorng/work/cc/mflowgen/mflowgen/scripts/mflowgen-letters -c -t info && chmod +x .mflowgen/2-info/mflowgen-run && cp -f .mflowgen/2-info/mflowgen-run 2-info && if [[ -e .mflowgen/2-info/mflowgen-debug ]]; then chmod +x .mflowgen/2-info/mflowgen-debug && cp -f .mflowgen/2-info/mflowgen-debug 2-info; fi && if [[ -e .mflowgen/2-info/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/2-info/mflowgen-check-preconditions.py && cp -f .mflowgen/2-info/mflowgen-check-preconditions.py 2-info; fi && if [[ -e .mflowgen/2-info/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/2-info/mflowgen-check-postconditions.py && cp -f .mflowgen/2-info/mflowgen-check-postconditions.py 2-info; fi && cd 2-info && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 2-info/outputs/*
endef

2-info/.execstamp: 2-info/.stamp
	$(call 2_info_commands_rule)

2-info/.execstamp.execute-phony: 2-info/.execstamp
	touch $@

endif

# collect outputs

# post-conditions

define 2_info_post_conditions_commands_rule
	cd 2-info && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

2-info/.postconditions.stamp: 2-info/.execstamp 2-info/.execstamp.execute-phony
	$(call 2_info_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: info

info: 2-info/.execstamp 2-info/.execstamp.execute-phony 2-info/.postconditions.stamp

.PHONY: 2

2: 2-info/.execstamp 2-info/.execstamp.execute-phony 2-info/.postconditions.stamp

# debug

# ------------------------------------------------------------------------
# rtl
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 3-rtl/.prebuilt)","")
3-rtl/.stamp:
	$(call cpdir-and-parameterize,3-rtl,rtl,3-rtl/.stamp)
endif

# collect inputs

# execute

ifeq ("$(wildcard 3-rtl/.prebuilt)","")

define 3_rtl_commands_rule
	mkdir -p 3-rtl/outputs && set -o pipefail && /home/users/ctorng/work/cc/mflowgen/mflowgen/scripts/mflowgen-letters -c -t rtl && chmod +x .mflowgen/3-rtl/mflowgen-run && cp -f .mflowgen/3-rtl/mflowgen-run 3-rtl && if [[ -e .mflowgen/3-rtl/mflowgen-debug ]]; then chmod +x .mflowgen/3-rtl/mflowgen-debug && cp -f .mflowgen/3-rtl/mflowgen-debug 3-rtl; fi && if [[ -e .mflowgen/3-rtl/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/3-rtl/mflowgen-check-preconditions.py && cp -f .mflowgen/3-rtl/mflowgen-check-preconditions.py 3-rtl; fi && if [[ -e .mflowgen/3-rtl/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/3-rtl/mflowgen-check-postconditions.py && cp -f .mflowgen/3-rtl/mflowgen-check-postconditions.py 3-rtl; fi && cd 3-rtl && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 3-rtl/outputs/*
endef

3-rtl/.execstamp: 3-rtl/.stamp
	$(call 3_rtl_commands_rule)
	touch $@

3-rtl/outputs/.execstamp.design.v: 3-rtl/.execstamp
	touch $@

endif

# collect outputs

3-rtl/outputs/.stamp.design.v: 3-rtl/.execstamp 3-rtl/outputs/.execstamp.design.v
	$(call stamp,3-rtl/outputs/.stamp.design.v)

# post-conditions

define 3_rtl_post_conditions_commands_rule
	cd 3-rtl && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

3-rtl/.postconditions.stamp: 3-rtl/.execstamp 3-rtl/outputs/.execstamp.design.v 3-rtl/outputs/.stamp.design.v
	$(call 3_rtl_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: rtl

rtl: 3-rtl/.execstamp 3-rtl/.postconditions.stamp 3-rtl/outputs/.execstamp.design.v 3-rtl/outputs/.stamp.design.v

.PHONY: 3

3: 3-rtl/.execstamp 3-rtl/.postconditions.stamp 3-rtl/outputs/.execstamp.design.v 3-rtl/outputs/.stamp.design.v

# debug

# ------------------------------------------------------------------------
# synopsys-dc-synthesis
# ------------------------------------------------------------------------

# build dir

ifeq ("$(wildcard 4-synopsys-dc-synthesis/.prebuilt)","")
4-synopsys-dc-synthesis/.stamp: 0-constraints/.execstamp 0-constraints/.postconditions.stamp 0-constraints/outputs/.execstamp.constraints.tcl 0-constraints/outputs/.stamp.constraints.tcl
4-synopsys-dc-synthesis/.stamp: 1-freepdk-45nm/.execstamp 1-freepdk-45nm/.postconditions.stamp 1-freepdk-45nm/outputs/.execstamp.adk 1-freepdk-45nm/outputs/.stamp.adk
4-synopsys-dc-synthesis/.stamp: 3-rtl/.execstamp 3-rtl/.postconditions.stamp 3-rtl/outputs/.execstamp.design.v 3-rtl/outputs/.stamp.design.v
4-synopsys-dc-synthesis/.stamp:
	$(call cpdir-and-parameterize,4-synopsys-dc-synthesis,../../../mflowgen/steps/synopsys-dc-synthesis,4-synopsys-dc-synthesis/.stamp)
endif

# collect inputs

ifeq ("$(wildcard 4-synopsys-dc-synthesis/.prebuilt)","")
4-synopsys-dc-synthesis/inputs/.stamp.adk: 4-synopsys-dc-synthesis/.stamp 1-freepdk-45nm/outputs/.stamp.adk
	$(call symlink,4-synopsys-dc-synthesis/inputs,adk,../../1-freepdk-45nm/outputs/adk,.stamp.adk)
endif

ifeq ("$(wildcard 4-synopsys-dc-synthesis/.prebuilt)","")
4-synopsys-dc-synthesis/inputs/.stamp.constraints.tcl: 4-synopsys-dc-synthesis/.stamp 0-constraints/outputs/.stamp.constraints.tcl
	$(call symlink,4-synopsys-dc-synthesis/inputs,constraints.tcl,../../0-constraints/outputs/constraints.tcl,.stamp.constraints.tcl)
endif

ifeq ("$(wildcard 4-synopsys-dc-synthesis/.prebuilt)","")
4-synopsys-dc-synthesis/inputs/.stamp.design.v: 4-synopsys-dc-synthesis/.stamp 3-rtl/outputs/.stamp.design.v
	$(call symlink,4-synopsys-dc-synthesis/inputs,design.v,../../3-rtl/outputs/design.v,.stamp.design.v)
endif

# execute

ifeq ("$(wildcard 4-synopsys-dc-synthesis/.prebuilt)","")

define 4_synopsys_dc_synthesis_commands_rule
	mkdir -p 4-synopsys-dc-synthesis/outputs && set -o pipefail && /home/users/ctorng/work/cc/mflowgen/mflowgen/scripts/mflowgen-letters -c -t synopsys-dc-synthesis && chmod +x .mflowgen/4-synopsys-dc-synthesis/mflowgen-run && cp -f .mflowgen/4-synopsys-dc-synthesis/mflowgen-run 4-synopsys-dc-synthesis && if [[ -e .mflowgen/4-synopsys-dc-synthesis/mflowgen-debug ]]; then chmod +x .mflowgen/4-synopsys-dc-synthesis/mflowgen-debug && cp -f .mflowgen/4-synopsys-dc-synthesis/mflowgen-debug 4-synopsys-dc-synthesis; fi && if [[ -e .mflowgen/4-synopsys-dc-synthesis/mflowgen-check-preconditions.py ]]; then chmod +x .mflowgen/4-synopsys-dc-synthesis/mflowgen-check-preconditions.py && cp -f .mflowgen/4-synopsys-dc-synthesis/mflowgen-check-preconditions.py 4-synopsys-dc-synthesis; fi && if [[ -e .mflowgen/4-synopsys-dc-synthesis/mflowgen-check-postconditions.py ]]; then chmod +x .mflowgen/4-synopsys-dc-synthesis/mflowgen-check-postconditions.py && cp -f .mflowgen/4-synopsys-dc-synthesis/mflowgen-check-postconditions.py 4-synopsys-dc-synthesis; fi && cd 4-synopsys-dc-synthesis && if [[ -e mflowgen-check-preconditions.py ]]; then ./mflowgen-check-preconditions.py || exit 1; fi && ./mflowgen-run 2>&1 | tee mflowgen-run.log || exit 1 && cd .. && touch -c 4-synopsys-dc-synthesis/outputs/*
endef

4-synopsys-dc-synthesis/.execstamp: 4-synopsys-dc-synthesis/.stamp 4-synopsys-dc-synthesis/inputs/.stamp.adk 4-synopsys-dc-synthesis/inputs/.stamp.constraints.tcl 4-synopsys-dc-synthesis/inputs/.stamp.design.v
	$(call 4_synopsys_dc_synthesis_commands_rule)
	touch $@

4-synopsys-dc-synthesis/outputs/.execstamp.design.v: 4-synopsys-dc-synthesis/.execstamp
	touch $@
4-synopsys-dc-synthesis/outputs/.execstamp.design.sdc: 4-synopsys-dc-synthesis/.execstamp
	touch $@
4-synopsys-dc-synthesis/outputs/.execstamp.design.namemap: 4-synopsys-dc-synthesis/.execstamp
	touch $@
4-synopsys-dc-synthesis/outputs/.execstamp.design.svf: 4-synopsys-dc-synthesis/.execstamp
	touch $@
4-synopsys-dc-synthesis/outputs/.execstamp.design.upf: 4-synopsys-dc-synthesis/.execstamp
	touch $@

endif

# collect outputs

4-synopsys-dc-synthesis/outputs/.stamp.design.v: 4-synopsys-dc-synthesis/.execstamp 4-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 4-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 4-synopsys-dc-synthesis/outputs/.execstamp.design.svf 4-synopsys-dc-synthesis/outputs/.execstamp.design.upf 4-synopsys-dc-synthesis/outputs/.execstamp.design.v
	$(call stamp,4-synopsys-dc-synthesis/outputs/.stamp.design.v)

4-synopsys-dc-synthesis/outputs/.stamp.design.sdc: 4-synopsys-dc-synthesis/.execstamp 4-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 4-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 4-synopsys-dc-synthesis/outputs/.execstamp.design.svf 4-synopsys-dc-synthesis/outputs/.execstamp.design.upf 4-synopsys-dc-synthesis/outputs/.execstamp.design.v
	$(call stamp,4-synopsys-dc-synthesis/outputs/.stamp.design.sdc)

4-synopsys-dc-synthesis/outputs/.stamp.design.namemap: 4-synopsys-dc-synthesis/.execstamp 4-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 4-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 4-synopsys-dc-synthesis/outputs/.execstamp.design.svf 4-synopsys-dc-synthesis/outputs/.execstamp.design.upf 4-synopsys-dc-synthesis/outputs/.execstamp.design.v
	$(call stamp,4-synopsys-dc-synthesis/outputs/.stamp.design.namemap)

4-synopsys-dc-synthesis/outputs/.stamp.design.svf: 4-synopsys-dc-synthesis/.execstamp 4-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 4-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 4-synopsys-dc-synthesis/outputs/.execstamp.design.svf 4-synopsys-dc-synthesis/outputs/.execstamp.design.upf 4-synopsys-dc-synthesis/outputs/.execstamp.design.v
	$(call stamp,4-synopsys-dc-synthesis/outputs/.stamp.design.svf)

4-synopsys-dc-synthesis/outputs/.stamp.design.upf: 4-synopsys-dc-synthesis/.execstamp 4-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 4-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 4-synopsys-dc-synthesis/outputs/.execstamp.design.svf 4-synopsys-dc-synthesis/outputs/.execstamp.design.upf 4-synopsys-dc-synthesis/outputs/.execstamp.design.v
	$(call stamp,4-synopsys-dc-synthesis/outputs/.stamp.design.upf)

# post-conditions

define 4_synopsys_dc_synthesis_post_conditions_commands_rule
	cd 4-synopsys-dc-synthesis && if [[ -e mflowgen-check-postconditions.py ]]; then ./mflowgen-check-postconditions.py || exit 1; fi && cd ..
endef

4-synopsys-dc-synthesis/.postconditions.stamp: 4-synopsys-dc-synthesis/.execstamp 4-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 4-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 4-synopsys-dc-synthesis/outputs/.execstamp.design.svf 4-synopsys-dc-synthesis/outputs/.execstamp.design.upf 4-synopsys-dc-synthesis/outputs/.execstamp.design.v 4-synopsys-dc-synthesis/outputs/.stamp.design.namemap 4-synopsys-dc-synthesis/outputs/.stamp.design.sdc 4-synopsys-dc-synthesis/outputs/.stamp.design.svf 4-synopsys-dc-synthesis/outputs/.stamp.design.upf 4-synopsys-dc-synthesis/outputs/.stamp.design.v
	$(call 4_synopsys_dc_synthesis_post_conditions_commands_rule)
	touch $@

# alias

.PHONY: synopsys-dc-synthesis

synopsys-dc-synthesis: 4-synopsys-dc-synthesis/.execstamp 4-synopsys-dc-synthesis/.postconditions.stamp 4-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 4-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 4-synopsys-dc-synthesis/outputs/.execstamp.design.svf 4-synopsys-dc-synthesis/outputs/.execstamp.design.upf 4-synopsys-dc-synthesis/outputs/.execstamp.design.v 4-synopsys-dc-synthesis/outputs/.stamp.design.namemap 4-synopsys-dc-synthesis/outputs/.stamp.design.sdc 4-synopsys-dc-synthesis/outputs/.stamp.design.svf 4-synopsys-dc-synthesis/outputs/.stamp.design.upf 4-synopsys-dc-synthesis/outputs/.stamp.design.v

.PHONY: 4

4: 4-synopsys-dc-synthesis/.execstamp 4-synopsys-dc-synthesis/.postconditions.stamp 4-synopsys-dc-synthesis/outputs/.execstamp.design.namemap 4-synopsys-dc-synthesis/outputs/.execstamp.design.sdc 4-synopsys-dc-synthesis/outputs/.execstamp.design.svf 4-synopsys-dc-synthesis/outputs/.execstamp.design.upf 4-synopsys-dc-synthesis/outputs/.execstamp.design.v 4-synopsys-dc-synthesis/outputs/.stamp.design.namemap 4-synopsys-dc-synthesis/outputs/.stamp.design.sdc 4-synopsys-dc-synthesis/outputs/.stamp.design.svf 4-synopsys-dc-synthesis/outputs/.stamp.design.upf 4-synopsys-dc-synthesis/outputs/.stamp.design.v

# debug

define 4_debug_rule
	cd 4-synopsys-dc-synthesis && ./mflowgen-debug 2>&1 | tee mflowgen-debug.log
endef

debug-synopsys-dc-synthesis: 
	$(call 4_debug_rule)

.PHONY: debug-4

debug-4: debug-synopsys-dc-synthesis

# ------------------------------------------------------------------------
# Misc
# ------------------------------------------------------------------------

# Clean

.PHONY: clean-all

clean-all:
	@find . -maxdepth 1 ! -name Makefile ! -name .mflowgen\* ! -name \. ! -name \.\. -exec rm -rf {} +

.PHONY: clean-0

clean-0:
	rm -rf ./0-constraints

.PHONY: clean-constraints

clean-constraints: clean-0

.PHONY: clean-1

clean-1:
	rm -rf ./1-freepdk-45nm

.PHONY: clean-freepdk-45nm

clean-freepdk-45nm: clean-1

.PHONY: clean-2

clean-2:
	rm -rf ./2-info

.PHONY: clean-info

clean-info: clean-2

.PHONY: clean-3

clean-3:
	rm -rf ./3-rtl

.PHONY: clean-rtl

clean-rtl: clean-3

.PHONY: clean-4

clean-4:
	rm -rf ./4-synopsys-dc-synthesis

.PHONY: clean-synopsys-dc-synthesis

clean-synopsys-dc-synthesis: clean-4

# Diff

.PHONY: diff-0

diff-0:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} constraints 0-constraints | grep --color=always -e '^-.*' -e '$$' -e 'Only in constraints.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 0-constraints.*' && echo || true

.PHONY: diff-1

diff-1:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../../../mflowgen/adks/freepdk-45nm 1-freepdk-45nm | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../../../mflowgen/adks/freepdk-45nm.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 1-freepdk-45nm.*' && echo || true

.PHONY: diff-2

diff-2:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../../../mflowgen/steps/info 2-info | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../../../mflowgen/steps/info.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 2-info.*' && echo || true

.PHONY: diff-3

diff-3:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} rtl 3-rtl | grep --color=always -e '^-.*' -e '$$' -e 'Only in rtl.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 3-rtl.*' && echo || true

.PHONY: diff-4

diff-4:
	@echo && diff -r -u --minimal --exclude={configure.yml,.time_end,.time_start,mflowgen-run*,mflowgen-debug,.stamp,inputs,outputs} ../../../mflowgen/steps/synopsys-dc-synthesis 4-synopsys-dc-synthesis | grep --color=always -e '^-.*' -e '$$' -e 'Only in ../../../mflowgen/steps/synopsys-dc-synthesis.*' | GREP_COLOR='01;32' grep --color=always -e '^+.*' -e '$$' -e 'Only in 4-synopsys-dc-synthesis.*' && echo || true

# Info

.PHONY: info-0

info-0:
	@/home/users/ctorng/work/cc/mflowgen/mflowgen/scripts/mflowgen-letters -c -t constraints && /home/users/ctorng/work/cc/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/0-constraints/configure.yml

.PHONY: info-1

info-1:
	@/home/users/ctorng/work/cc/mflowgen/mflowgen/scripts/mflowgen-letters -c -t freepdk-45nm && /home/users/ctorng/work/cc/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/1-freepdk-45nm/configure.yml

.PHONY: info-2

info-2:
	@/home/users/ctorng/work/cc/mflowgen/mflowgen/scripts/mflowgen-letters -c -t info && /home/users/ctorng/work/cc/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/2-info/configure.yml

.PHONY: info-3

info-3:
	@/home/users/ctorng/work/cc/mflowgen/mflowgen/scripts/mflowgen-letters -c -t rtl && /home/users/ctorng/work/cc/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/3-rtl/configure.yml

.PHONY: info-4

info-4:
	@/home/users/ctorng/work/cc/mflowgen/mflowgen/scripts/mflowgen-letters -c -t synopsys-dc-synthesis && /home/users/ctorng/work/cc/mflowgen/mflowgen/scripts/mflowgen-info -y .mflowgen/4-synopsys-dc-synthesis/configure.yml

# Runtimes

.PHONY: runtimes

runtimes:
	@/home/users/ctorng/work/cc/mflowgen/mflowgen/scripts/mflowgen-runtimes

# List

.PHONY: list

list:
	@echo && echo Generic Targets: && echo && printf " - %s\\n" "list      -- List all steps" "status    -- Print build status for each step" "runtimes  -- Print runtimes for each step" "graph     -- Generate a PDF of the step dependency graph" "clean-all -- Remove all build directories" "clean-N   -- Clean target N" "info-N    -- Print configured info for step N" "diff-N    -- Diff target N" && echo && echo Targets: && echo && printf " - %s\\n" "  0 : constraints" "  1 : freepdk-45nm" "  2 : info" "  3 : rtl" "  4 : synopsys-dc-synthesis" && echo && echo Debug Targets: && echo && printf " - %s\\n" "debug-4  : debug-synopsys-dc-synthesis" && echo

# Graph

.PHONY: graph

graph:
	dot -Tpdf .mflowgen/graph.dot > graph.pdf

# Status

.PHONY: status

status:
	@/home/users/ctorng/work/cc/mflowgen/mflowgen/scripts/mflowgen-status --backend make -s 0-constraints,1-freepdk-45nm,2-info,3-rtl,4-synopsys-dc-synthesis



netlister_dir ?= ~/Documents/Development/git/netlister

ALLLIBS ?= $(shell ls -1 ${netlister_dir}/lib/*.lib)

plcc84_dil64.net: plcc84_dil64.v ${ALLLIBS}
	netlister.py -i plcc84_dil64.v \
	-l ${netlister_dir}/lib/memory.lib \
	-l ${netlister_dir}/lib/idc_connectors.lib \
	-l ${netlister_dir}/lib/l1a-custom.lib \
	-l ${netlister_dir}/lib/xilinx.lib \
	-l ${netlister_dir}/lib/rcl.lib \
	-l ${netlister_dir}/lib/triac.lib \
	-o plcc84_dil64.net \
	-f net

plcc84_dil64.scr: plcc84_dil64.v ${ALLLIBS} plcc84_dil64.footer ../common/standard.header
	netlister.py \
	-i plcc84_dil64.v \
	-l ${netlister_dir}/lib/memory.lib \
	-l ${netlister_dir}/lib/idc_connectors.lib \
	-l ${netlister_dir}/lib/l1a-custom.lib \
	-l ${netlister_dir}/lib/xilinx.lib \
	-l ${netlister_dir}/lib/rcl.lib \
	-l ${netlister_dir}/lib/triac.lib \
	-o plcc84_dil64.scr \
	-f scr \
	-d ../common/standard.header \
	-t plcc84_dil64.footer


all: plcc84_dil64.scr plcc84_dil64.net

clean:
	rm -f *~ *scr *net

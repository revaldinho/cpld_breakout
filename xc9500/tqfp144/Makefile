
netlister_dir ?= ~/Documents/Development/git/netlister

ALLLIBS ?= $(shell ls -1 ${netlister_dir}/lib/*.lib)

tqfp144_dil60.net: tqfp144_dil60.v ${ALLLIBS}
	netlister.py -i tqfp144_dil60.v \
	-l ${netlister_dir}/lib/memory.lib \
	-l ${netlister_dir}/lib/idc_connectors.lib \
	-l ${netlister_dir}/lib/l1a-custom.lib \
	-l ${netlister_dir}/lib/xilinx.lib \
	-l ${netlister_dir}/lib/rcl.lib \
	-l ${netlister_dir}/lib/triac.lib \
	-o tqfp144_dil60.net \
	-f net

tqfp144_dil60.scr: tqfp144_dil60.v ${ALLLIBS} tqfp144_dil60.footer ../common/standard.header
	netlister.py \
	-i tqfp144_dil60.v \
	-l ${netlister_dir}/lib/memory.lib \
	-l ${netlister_dir}/lib/idc_connectors.lib \
	-l ${netlister_dir}/lib/l1a-custom.lib \
	-l ${netlister_dir}/lib/xilinx.lib \
	-l ${netlister_dir}/lib/rcl.lib \
	-l ${netlister_dir}/lib/triac.lib \
	-o tqfp144_dil60.scr \
	-f scr \
	-d ../common/standard.header \
	-t tqfp144_dil60.footer


all: tqfp144_dil60.scr tqfp144_dil60.net

clean:
	rm -f *~ *scr *net

SEED = 1
NOW :=`date "+%F-%T"`
CURRDIR := `pwd`
G ?= 0

all:
	docker build . --no-cache --rm -t gnmt:latest
	NV_GPU=$(G) nvidia-docker run --rm --ipc=host \
		-v $(CURRDIR)/../data:/data \
                gnmt:latest "./run_and_time.sh $(M) $(G)" |tee benchmark-$(NOW).log

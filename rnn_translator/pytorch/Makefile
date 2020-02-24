SEED = 1
NOW :=`date "+%F-%T"`
CURRDIR := `pwd`

one:
	docker build . --no-cache --rm -t gnmt:latest
	nvidia-docker run --rm --ipc=host \
                -v $(CURRDIR)/../data:/data \
                gnmt:latest "./run_and_time1.sh" $(SEED) |tee benchmark-$(NOW).log

two:
	docker build . --no-cache --rm -t gnmt:latest
	nvidia-docker run --rm --ipc=host \
                -v $(CURRDIR)/../data:/data \
                gnmt:latest "./run_and_time2.sh" $(SEED) |tee benchmark-$(NOW).log

three:
	docker build . --no-cache --rm -t gnmt:latest
	nvidia-docker run --rm --ipc=host \
                -v $(CURRDIR)/../data:/data \
                gnmt:latest "./run_and_time3.sh" $(SEED) |tee benchmark-$(NOW).log

zero:
	docker build . --no-cache --rm -t gnmt:latest
	nvidia-docker run --rm --ipc=host \
                -v $(CURRDIR)/../data:/data \
                gnmt:latest "./run_and_time0.sh" $(SEED) |tee benchmark-$(NOW).log


all:
	docker build . --no-cache --rm -t gnmt:latest
	nvidia-docker run --rm --ipc=host \
		-v $(CURRDIR)/../data:/data \
		gnmt:latest "./run_and_time.sh" $(SEED) |tee benchmark-$(NOW).log


SEED = 1
NOW :=`date "+%F-%T"`
CURRDIR := `pwd`

all:
	docker build . --no-cache --rm -t gnmt:latest
	nvidia-docker run --rm --ipc=host \
		-v $(CURRDIR)/../data:/data \
		gnmt:latest "./run_and_time.sh" $(SEED) |tee benchmark-$(NOW).log


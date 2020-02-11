SEED = 1
NOW :=`date "+%F-%T"`
CURRDIR := `pwd`

all:
	docker build . --rm -r --no-cache gnmt:latest
	nvidia-docker run --rm --ipc=host \
		-v $(CURRDIR)/../data:/data \
		gnmt:latest "./run_and_time.sh" $(SEED) |tee benchmark-$(NOW).log


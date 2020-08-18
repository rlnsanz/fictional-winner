SEED = 1
NOW :=`date "+%F-%T"`
CURRDIR := `pwd`
G ?= 0

all:
	echo "nvidia-docker build docker/ --rm -f docker/Dockerfile.gpu -t ds2-cuda9cudnn7:gpu"
	echo "NV_GPU=$(G) nvidia-docker run --rm --ipc=host \
              -v  $(CURRDIR)/../:/speech:rw \
              -v /etc/passwd:/etc/passwd:ro \
                --user $(id -u) ds2-cuda9cudnn7:gpu "./run_and_time.sh" $(M) $(G) | tee benchmark-$(NOW).log"

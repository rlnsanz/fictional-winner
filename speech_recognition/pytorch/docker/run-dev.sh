#!/bin/bash
nvidia-docker run \
  -v  /home/ubuntu/fictional-winner/speech_recognition:/speech:rw \
  -v /etc/passwd:/etc/passwd:ro \
  -it --rm --user $(id -u) ds2-cuda9cudnn7:gpu

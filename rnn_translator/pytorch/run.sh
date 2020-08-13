#!/bin/bash

set -e

DATASET_DIR="/data"

SEED="1"
TARGET="40.00"
FREQ="5e99"

INIT='strong'
NGPUS='4'

case ${1:-"base"} in

    base)
    MOUD=''
    cp train.raw train.py
    cp seq2seq/train/trainer.raw seq2seq/train/trainer.py
    ;;

    exec)
    MOUD='--flor=name:rnn_trans,rd:/data'
    cp train.flor train.py
    cp seq2seq/train/trainer.flor seq2seq/train/trainer.py
    ;;

    reexec)
    MOUD="--flor=name:rnn_trans,rd:/data,mode:reexec,memo:blessed.json,predinit:$INIT"
    cp train.flor train.py
    cp seq2seq/train/trainer.flor seq2seq/train/trainer.py
    ;;

    parallel)
    MOUD="--flor=name:rnn_trans,mode:reexec,memo:blessed.json,rd:/data,predinit:$INIT,pid:$2,ngpus:$NGPUS"
    cp train.parallel train.py
    cp seq2seq/train/trainer.flor seq2seq/train/trainer.py
    ;;

esac

# run training
echo $1 
echo $2
python3 train.py $MOUD \
  --dataset-dir ${DATASET_DIR} \
  --seed $SEED \
  --save-freq $FREQ \
  --target-bleu $TARGET \
  --results-dir /data/results

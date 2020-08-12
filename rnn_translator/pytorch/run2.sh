#!/bin/bash

set -e

DATASET_DIR='/data'

SEED=${1:-"1"}
TARGET=${2:-"40.00"}

# run training
python3 train.py --flor=name:rnn_trans,mode:reexec,memo:blessed.json,rd:/data,predinit:strong,pid:5,ngpus:6 \
  --dataset-dir ${DATASET_DIR} \
  --seed $SEED \
  --target-bleu $TARGET

#!/bin/bash

set -e

DATASET_DIR='/data'

SEED=${1:-"1"}
TARGET=${2:-"40.00"}

# run training
python3 train.py --flor=name:rnn_trans,rd:/data,mode:reexec,memo:blessed.json,rate:0.3 \
  --dataset-dir ${DATASET_DIR} \
  --seed $SEED \
  --target-bleu $TARGET

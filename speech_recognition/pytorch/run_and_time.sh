# Script to train and time DeepSpeech 2 implementation

set -e

RANDOM_SEED=1
TARGET_ACC=40

INIT='strong'
NGPUS='4'

case ${1:-"base"} in

    base)
    MOUD=''
    cp train.raw train.py
    ;;

    exec)
    MOUD='--flor=name:jasp,rd:/speech'
    cp train.flor train.py
    ;;

    reexec)
    MOUD="--flor=name:jasp,rd:/speech,mode:reexec,memo:blessed.json,predinit:$INIT"
    cp train.flor train.py
    ;;

    parallel)
    MOUD="--flor=name:jasp,mode:reexec,memo:blessed.json,rd:/speech,predinit:$INIT,pid:$2,ngpus:$NGPUS"
    cp train.parallel train.py
    ;;

esac

echo $1
echo $2
python3 train.py $MOUD --model_path models/deepspeech_t$RANDOM_SEED.pth.tar --seed $RANDOM_SEED --acc $TARGET_ACC

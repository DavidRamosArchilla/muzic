DATA_DIR=/content/data/meta
MODEL_NAME=

OMP_NUM_THREADS=$(cat /proc/cpuinfo| grep "processor"| wc -l)
NUM_WORKERS=$OMP_NUM_THREADS

fairseq-interactive $DATA_DIR \
  --path /checkpoints/$2  \
  --user-dir museformer \
  --task museformer_language_modeling \
  --sampling --sampling-topk 8  --beam 1 --nbest 1 \
  --min-len 1024 \
  --max-len-b 20480 \
  --num-workers $NUM_WORKERS \
  --seed $3

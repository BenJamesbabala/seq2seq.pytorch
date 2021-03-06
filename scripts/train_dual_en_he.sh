DATASET=${1:-"OpenSubtitles2016"}
DATASET_DIR=${2:-"./data/OpenSubtitles2016"}
OUTPUT_DIR=${3:-"./results"}

python main.py \
  --save en_he_dual \
  --dataset ${DATASET} \
  --dataset_dir ${DATASET_DIR} \
  --results_dir ${OUTPUT_DIR} \
  --model RecurrentAttentionSeq2Seq \
  --model_config "{'num_layers': 2, 'hidden_size': 256, 'tie_embedding': True, 'dropout': 0.2}" \
  --data_config "{'languages': ['he','en'], 'mark_language': True, 'tokenization':'bpe', 'num_symbols':32000, 'shared_vocab':True}" \
  --b 64 \
  --trainer MultiSeq2SeqTrainer \
  --optimization_config "{0: {'optimizer': 'Adam', 'lr': 1e-3},
                          4: {'optimizer': 'Adam', 'lr': 1e-4},
                          8: {'optimizer': 'SGD', 'lr': 1e-4}}" \

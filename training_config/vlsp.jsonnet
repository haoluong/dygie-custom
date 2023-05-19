local template = import "template.libsonnet";

template.DyGIE {
  local dygie = self,

  // Mapping from target task to the metric used to assess performance on that task.
  local validation_metrics = {
    'ner': '+MEAN__ner_f1',
    'relation': '+MEAN__relation_f1',
    'coref': '+coref_f1',
    'events': '+MEAN__arg_class_f1'
  },
  bert_model: "bert-base-cased",
  cuda_device: 0,
  data_paths: {
    train: "data/vlsp/collated_data/json/train.json",
    validation: "data/vlsp/collated_data/json/dev.json",
    test: "data/vlsp/collated_data/json/test.json",
  },
  loss_weights: {
    ner: 1.0,
    relation: 1.0,
    coref: 0.0,
    events: 0.0
  },
  trainer: {
    checkpointer: {
      num_serialized_models_to_keep: 3,
    },
    num_epochs: 20,
    grad_norm: 5.0,
    cuda_device: dygie.cuda_device,
    validation_metric: validation_metrics[dygie.target_task],
    optimizer: {
      type: 'adamw',
      lr: 1e-3,
      weight_decay: 0.0,
      parameter_groups: [
        [
          ['_embedder'],
          {
            lr: 5e-5,
            weight_decay: 0.01,
            finetune: true,
          },
        ],
      ],
    },
    learning_rate_scheduler: {
      type: 'slanted_triangular'
    }
  },
  target_task: "relation",
}
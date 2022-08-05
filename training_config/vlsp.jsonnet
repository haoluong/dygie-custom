local template = import "template.libsonnet";

template.DyGIE {
  bert_model: "roberta-base",
  cuda_device: 0,
  data_paths: {
    train: "data/vlsp/train.json",
    validation: "data/vlsp/dev.json",
    test: "data/vlsp/test.json",
  },
  loss_weights: {
    ner: 0.2,
    relation: 1.0,
    coref: 0.0,
    events: 0.0
  },
  target_task: "relation",
}
local template = import "template.libsonnet";

template.DyGIE {
  bert_model: "roberta-base",
  cuda_device: 0,
  data_paths: {
    train: "data/vlsp/collated_data/json/train.json",
    validation: "data/vlsp/collated_data/json/dev.json",
    test: "data/vlsp/collated_data/json/test.json",
  },
  loss_weights: {
    ner: 0.2,
    relation: 1.0,
    coref: 0.0,
    events: 0.0
  },
  target_task: "relation",
}
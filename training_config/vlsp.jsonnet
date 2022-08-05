local template = import "template.libsonnet";

template.DyGIE {
  bert_model: "bert-base-cased",
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
  model +: {
      feedforward_params +: {
        num_layers+: 2,
        hidden_dims+: 100,
        dropout+: 0.4,
      },
  }
  target_task: "relation",
}
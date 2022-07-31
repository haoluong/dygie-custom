local template = import "template.libsonnet";

template.DyGIE {
  bert_model: "allenai/scibert_scivocab_cased",
  cuda_device: 0,
  data_paths: {
    train: "data/vlsp/train.json",
    validation: "data/vlsp/dev.json",
    test: "data/vlsp/train.json",
  },
  loss_weights: {
    ner: 0.2,
    relation: 1.0,
    coref: 1.0,
    events: 0.0
  },
  model +: {
    modules +: {
      coref +: {
        coref_prop: 1
      }
    }
  },
  target_task: "relation",
}
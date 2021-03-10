#include <PLDA.h>

#include <rice/rice.hpp>

#include "utils.h"

void init_plda(Rice::Module& m) {
  Rice::define_class_under<tomoto::IPLDAModel, tomoto::ILLDAModel>(m, "PLDA")
    .define_singleton_function(
      "_new",
      [](size_t tw, size_t latent_topics, tomoto::Float alpha, tomoto::Float eta, int seed) {
        if (seed < 0) {
          seed = std::random_device{}();
        }
        return tomoto::IPLDAModel::create((tomoto::TermWeight)tw, latent_topics, 1, alpha, eta, seed);
      }, Rice::Return().takeOwnership())
    .define_method(
      "_add_doc",
      [](tomoto::IPLDAModel& self, Object words, std::vector<std::string> labels) {
        auto doc = buildDoc(words);
        doc.misc["labels"] = labels;
        return self.addDoc(doc);
      })
    .define_method(
      "latent_topics",
      [](tomoto::IPLDAModel& self) {
        return self.getNumLatentTopics();
      });
}

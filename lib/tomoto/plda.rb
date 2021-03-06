module Tomoto
  class PLDA
    def self.new(tw: :one, min_cf: 0, min_df: 0, rm_top: 0, latent_topics: 1, alpha: 0.1, eta: 0.01, seed: nil)
      model = _new(to_tw(tw), latent_topics, alpha, eta, seed || -1)
      model.instance_variable_set(:@min_cf, min_cf)
      model.instance_variable_set(:@min_df, min_df)
      model.instance_variable_set(:@rm_top, rm_top)
      init_params(model, binding)
    end

    def add_doc(doc, labels: [])
      _add_doc(prepare_doc(doc), labels)
    end
  end
end

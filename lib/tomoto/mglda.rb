module Tomoto
  class MGLDA
    def self.new(tw: :one, min_cf: 0, min_df: 0, rm_top: 0, k_g: 1, k_l: 1, t: 3)
      model = _new(to_tw(tw), k_g, k_l, t)
      model.instance_variable_set(:@min_cf, min_cf)
      model.instance_variable_set(:@min_df, min_df)
      model.instance_variable_set(:@rm_top, rm_top)
      model
    end
  end
end
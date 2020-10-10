require_relative "test_helper"

class HPATest < Minitest::Test
  def test_works
    model = Tomoto::HPA.new
    assert_kind_of Tomoto::PA, model
    assert_kind_of Tomoto::LDA, model
    assert_in_delta 0.1, model.alpha
    assert model.summary
  end
end

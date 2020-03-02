require 'test_helper'

class Metrics::SumTest < ActiveSupport::TestCase
  test 'calculates the sum of the values' do
    metrics = [
      Metric.new(key: 'foo', value: 1),
      Metric.new(key: 'foo', value: 2),
    ]

    service = Metrics::Sum.new metrics

    assert_equal 3, service.call
  end
end

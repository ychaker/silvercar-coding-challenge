require 'test_helper'

class MetricTest < ActiveSupport::TestCase
  test 'fetches the right metrics per key' do
    assert_equal 2, Metric.for_key('one').count
  end

  test 'fetches the right metrics for the last hour' do
    assert_equal 3, Metric.last_hour.count
  end
end

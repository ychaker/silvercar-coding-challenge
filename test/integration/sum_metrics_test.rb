require 'test_helper'

class SumMetricsTest < ActionDispatch::IntegrationTest
  test 'sums the values of the metrics created in the past hour' do
    get '/metrics/one/sum'

    assert_response :success

    assert_equal 5, JSON.parse(body)['value']
  end
end

require 'test_helper'

class CreateMetricTest < ActionDispatch::IntegrationTest
  test 'creates a valid metric' do
    assert_difference 'Metric.count' do
      post '/metrics/foo', params: { value: 30 }

      assert_response :success
      assert_equal 200, status
    end
  end

  test 'returns the proper error message when params are invalid' do
    assert_no_difference 'Metric.count' do
      post '/metrics/foo', params: { }
      assert_response :unprocessable_entity

      assert_equal 'Value is required!', JSON.parse(body)['error']
    end
  end

  test 'handles non int values' do
    assert_no_difference 'Metric.count' do
      post '/metrics/foo', params: { value: 'foo' }
      assert_response :unprocessable_entity

      assert_equal 'Value is not a number', JSON.parse(body)['error']
    end
  end
end

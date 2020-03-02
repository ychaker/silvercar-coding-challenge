class SumsController < ApplicationController
  def show
    metrics = Metric.for_key(params[:key]).last_hour
    service = Metrics::Sum.new metrics

    render json: { value: service.call }, status: :ok
  end
end

class SumsController < ApplicationController
  def show
    values = Metric.for_key(params[:key]).last_hour.pluck_value

    render json: { value: values.sum }, status: :ok
  end
end

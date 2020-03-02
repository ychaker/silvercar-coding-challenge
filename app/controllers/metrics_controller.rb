class MetricsController < ApplicationController
  def create
    @metric = Metric.new(key: params[:key], value: params.require(:value))

    if @metric.save
      render json: { }, status: :ok
    else
      render json: { error: @metric.errors.full_messages.join(' ') }, status: :unprocessable_entity
    end

  rescue ActionController::ParameterMissing
    render json: { error: 'Value is required!' }, status: :unprocessable_entity
  end
end

class SumsController < ApplicationController
  def show
    # Investigated added a view table that only has the metrics from
    # the last hour to make the query more performant
    # but realized that because it's a time based query then we'd have
    # to manually refresh the view table before making the query, like so:
    #   RecentMetric.refresh
    #   RecentMetric.for_key('active_visitors').pluck_value
    # which would then take more time (based on a few benchmarks I ran)
    # then calling this query below.
    values = Metric.for_key(params[:key]).last_hour.pluck_value

    render json: { value: values.sum }, status: :ok
  end
end

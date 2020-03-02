module Metrics
  class Sum
    attr_accessor :metrics

    def initialize metrics
      @metrics = metrics
    end

    def call
      metrics.inject(0) { |total, el| total += el.value }
    end
  end
end

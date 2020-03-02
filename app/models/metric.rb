class Metric < ApplicationRecord
  # Validations
  validates :key,
    presence: true

  validates :value,
    presence: true

  # Scopes
  scope :for_key, ->(key) {
    where(key: key)
  }

  scope :last_hour, ->() {
    where(Metric.arel_table[:created_at].gteq(1.hour.ago))
  }
end

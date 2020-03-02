class AddKeyIndexToMetric < ActiveRecord::Migration[6.0]
  def change
    add_index :metrics, :key
  end
end

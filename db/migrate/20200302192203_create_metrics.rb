class CreateMetrics < ActiveRecord::Migration[6.0]
  def change
    create_table :metrics do |t|
      t.string  :key,   null: false
      t.integer :value, null: false

      t.timestamps
    end
  end
end

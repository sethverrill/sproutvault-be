class CreateDaycareHours < ActiveRecord::Migration[8.0]
  def change
    create_table :daycare_hours do |t|
      t.references :daycare_provider, null: false, foreign_key: true
      t.references :child, null: false, foreign_key: true
      t.date :date
      t.time :start_time
      t.time :end_time
      t.interval :duration

      t.timestamps
    end
  end
end

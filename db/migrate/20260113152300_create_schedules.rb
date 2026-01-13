class CreateSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :schedules do |t|
      t.integer :weekday
      t.time :start_time
      t.time :end_time
      t.boolean :active
      t.references :barber, null: false, foreign_key: true

      t.timestamps
    end
  end
end

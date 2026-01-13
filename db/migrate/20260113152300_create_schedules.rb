class CreateSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :schedules do |t|
      t.integer :weekday
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :active
      t.references :barber, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateAppointments < ActiveRecord::Migration[8.0]
  def change
    create_table :appointments do |t|
      t.references :barber, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.string :customer_name
      t.datetime :start_time
      t.datetime :end_time
      t.integer :status

      t.timestamps
    end
  end
end

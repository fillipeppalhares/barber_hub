class CreateAppointments < ActiveRecord::Migration[8.0]
  def change
    create_table :appointments do |t|
      t.references :barber, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.string :customer_name
      t.datetime :start_at
      t.datetime :end_at
      t.integer :status

      t.timestamps
    end
  end
end

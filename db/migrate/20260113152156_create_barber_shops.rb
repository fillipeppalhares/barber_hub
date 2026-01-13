class CreateBarberShops < ActiveRecord::Migration[8.0]
  def change
    create_table :barber_shops do |t|
      t.string :name
      t.string :document
      t.string :address
      t.string :city
      t.string :phone

      t.timestamps
    end
  end
end

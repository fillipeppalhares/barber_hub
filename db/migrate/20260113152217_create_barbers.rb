class CreateBarbers < ActiveRecord::Migration[8.0]
  def change
    create_table :barbers do |t|
      t.string :name
      t.boolean :active
      t.references :barber_shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end

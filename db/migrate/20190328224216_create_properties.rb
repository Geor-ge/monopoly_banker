class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :color
      t.integer :property_price
      t.integer :house_price
      t.integer :hotel_price
      t.integer :mortgage_value
      t.integer :rent
      t.integer :rent_1
      t.integer :rent_2
      t.integer :rent_3
      t.integer :rent_4
      t.integer :rent_hotel
      t.boolean :owned
      t.integer :number_of_houses
      t.integer :number_of_hotels
      t.references :player

      t.timestamps
    end
  end
end

class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :piece
      t.integer :cash
      t.integer :number_of_railroads
      t.integer :number_of_utilities

      t.timestamps
    end
  end
end

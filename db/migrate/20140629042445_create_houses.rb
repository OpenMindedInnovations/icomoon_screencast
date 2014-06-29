class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :name
      t.integer :price
      t.string :location
      t.string :owner

      t.timestamps
    end
  end
end

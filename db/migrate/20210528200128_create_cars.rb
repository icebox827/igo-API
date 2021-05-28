class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.string :color
      t.string :transmission
      t.integer :seats
      t.string :image_url
      t.string :user_id

      t.timestamps
    end
    add_index :cars, :user_id
  end
end

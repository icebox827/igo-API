class AddFkToCars < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :cars, :users
  end
end

class AddForeignKeyToCars < ActiveRecord::Migration[6.1]
  def change
    add_reference :cars, :user_id, null: false, foreign_key: true
  end
end

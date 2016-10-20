class AddToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :id, :primary_key
  end
end

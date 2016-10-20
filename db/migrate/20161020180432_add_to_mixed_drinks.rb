class AddToMixedDrinks < ActiveRecord::Migration[5.0]
  def change
    add_column :mixed_drinks, :id, :primary_key
  end
end

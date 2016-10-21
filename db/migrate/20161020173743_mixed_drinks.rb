class MixedDrinks < ActiveRecord::Migration[5.0]
  def change
    create_join_table :drinks, :ingredients, table_name: :mixed_drinks do |t|
      t.belongs_to :drink, index: true, foreign_key: true
      t.belongs_to :ingredient, index: true, foreign_key: true
      t.timestamps
    end
  end
end

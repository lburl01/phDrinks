class Ingredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.belongs_to :category, index: true, foreign_key: true
      t.timestamps
    end
  end
end

class Games < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :drinks, table_name: :games do |t|
      t.integer :session, null: false
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :drink, index: true, foreign_key: true
      t.integer :correct?, default: 0
      t.timestamps
    end
  end
end

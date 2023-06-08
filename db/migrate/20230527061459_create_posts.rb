class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.integer :category_id
      t.string :title, null: false
      t.text :describe
      t.integer :area, null: false
      t.integer :prefecture, null: false
      t.string :location, null: false
      t.integer :vehicle
      t.boolean :is_deleted, null: false, default: false
      t.timestamps null: false
    end
  end
end

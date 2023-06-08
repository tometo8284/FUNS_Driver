class CreateMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :maps do |t|
      t.integer :post_id, null: false
      t.float :lat
      t.float :lng
      t.timestamps
    end
  end
end

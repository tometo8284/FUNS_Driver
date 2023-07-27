class CreateMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :maps do |t|
      t.integer :post_id, null: false
      t.float :lat, limit: 53 
      t.float :lng, limit: 53 
      t.text :marker_describe
    end
  end
end

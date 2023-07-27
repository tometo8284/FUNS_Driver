class CreateMapLines < ActiveRecord::Migration[6.1]
  def change
    create_table :map_lines do |t|
      t.integer :post_id, null: false
      t.float :line_lat, limit: 53
      t.float :line_lng, limit: 53
    end
  end
end

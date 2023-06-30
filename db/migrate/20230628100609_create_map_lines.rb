class CreateMapLines < ActiveRecord::Migration[6.1]
  def change
    create_table :map_lines do |t|
      t.integer :post_id, null: false
      t.float :line_lat
      t.float :line_lng
    end
  end
end

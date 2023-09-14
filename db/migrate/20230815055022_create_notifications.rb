class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id, null: false
      t.integer :visited_id, null: false
      t.integer :room_id
      t.integer :dm_id
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false
      t.boolean :is_admin, default: false, null: false
      t.timestamps
    end
  end
end

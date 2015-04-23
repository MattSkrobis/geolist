class CreateRanges < ActiveRecord::Migration
  def change
    create_table :ranges do |t|
      t.integer :user_id
      t.float :radius
      t.float :mid_lng
      t.float :mid_lat
    end
  end
end

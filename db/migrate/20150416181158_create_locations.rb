class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.float :longitude
      t.float :latitude
      t.integer :task_id
    end
  end
end
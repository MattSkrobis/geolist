class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.datetime :start_at
      t.datetime :end_at
      t.string :description
      t.integer :list_id
    end
  end
end

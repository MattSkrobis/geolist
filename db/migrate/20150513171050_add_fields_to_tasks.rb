class AddFieldsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :assignee_id, :integer
    add_column :tasks, :assigned, :boolean, default: false
  end
end

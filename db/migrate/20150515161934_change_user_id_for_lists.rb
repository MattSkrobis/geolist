class ChangeUserIdForLists < ActiveRecord::Migration
  def change
    rename_column :lists, :user_id, :owner_id
  end
end

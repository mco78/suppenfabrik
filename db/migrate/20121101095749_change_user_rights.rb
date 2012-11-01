class ChangeUserRights < ActiveRecord::Migration
  def up
  	rename_column :users, :user_management, :admin
  	remove_column :users, :time_tracking_admin
  end

  def down
  	rename_column :users, :admin, :user_management
  	add_column :users, :time_tracking_admin
  end
end

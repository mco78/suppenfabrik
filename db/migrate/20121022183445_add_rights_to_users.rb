class AddRightsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :user_management, :boolean, {:null => false, :default => false}
  	add_column :users, :time_tracking, :boolean, {:null => false, :default => false}
  	add_column :users, :time_tracking_admin, :boolean, {:null => false, :default => false}
  end
end

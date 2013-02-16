class AddCheckoutsToUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :daily_sales
  	add_column :users, :checkouts, :boolean, {:null => false, :default => false}
  end
end

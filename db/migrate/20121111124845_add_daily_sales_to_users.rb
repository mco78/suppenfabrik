class AddDailySalesToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :daily_sales, :boolean, {:null => false, :default => false}
  end
end

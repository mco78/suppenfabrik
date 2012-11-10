class AddStoreIdToDailySales < ActiveRecord::Migration
  def change
  	add_column :daily_sales, :store_id, :integer
  end
end

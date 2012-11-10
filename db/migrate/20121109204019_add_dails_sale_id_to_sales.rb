class AddDailsSaleIdToSales < ActiveRecord::Migration
  def change
  	add_column :sales, :daily_sale_id, :integer
  end
end

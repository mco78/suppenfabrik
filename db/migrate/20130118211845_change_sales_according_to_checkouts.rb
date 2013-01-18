class ChangeSalesAccordingToCheckouts < ActiveRecord::Migration
  def change
  	remove_column :sales, :product
  	add_column :sales, :product_id, :integer
  	remove_column :sales, :daily_sale_id
  	add_column :sales, :checkout_id, :integer
  end
end

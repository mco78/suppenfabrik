class AddBillsToCashBalances < ActiveRecord::Migration
  def change
  	add_column :cash_balances, :bill200, :integer
  	add_column :cash_balances, :bill100, :integer
  	add_column :cash_balances, :bill50, :integer
  	add_column :cash_balances, :bill20, :integer
  	add_column :cash_balances, :bill10, :integer
  	add_column :cash_balances, :bill5, :integer
  	add_column :cash_balances, :bill2, :integer
  	add_column :cash_balances, :bill1, :integer
  	add_column :cash_balances, :bill0_50, :integer
  	add_column :cash_balances, :bill0_20, :integer
  	add_column :cash_balances, :bill0_10, :integer
  	add_column :cash_balances, :bill0_05, :integer
  	add_column :cash_balances, :bill0_02, :integer
  	add_column :cash_balances, :bill0_01, :integer
  end
end

class AddExBillsToCashBalances < ActiveRecord::Migration
  def change
  	add_column :cash_balances, :ex_bill200, :integer
  	add_column :cash_balances, :ex_bill100, :integer
  	add_column :cash_balances, :ex_bill50, :integer
  	add_column :cash_balances, :ex_bill20, :integer
  	add_column :cash_balances, :ex_bill10, :integer
  	add_column :cash_balances, :ex_bill5, :integer
  	add_column :cash_balances, :ex_bill2, :integer
  	add_column :cash_balances, :ex_bill1, :integer
  	add_column :cash_balances, :ex_bill0_50, :integer
  	add_column :cash_balances, :ex_bill0_20, :integer
  	add_column :cash_balances, :ex_bill0_10, :integer
  	add_column :cash_balances, :ex_bill0_05, :integer
  	add_column :cash_balances, :ex_bill0_02, :integer
  	add_column :cash_balances, :ex_bill0_01, :integer
  end
end

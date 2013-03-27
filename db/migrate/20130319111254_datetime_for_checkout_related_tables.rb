class DatetimeForCheckoutRelatedTables < ActiveRecord::Migration
  def change
  	change_column :cash_balances, :date, :datetime
  	change_column :checkouts, :date, :datetime
  	change_column :receipts, :date, :datetime
  	change_column :sales, :date, :datetime
  	change_column :z_bons, :date, :datetime
  end

end

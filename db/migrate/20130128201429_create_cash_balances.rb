class CreateCashBalances < ActiveRecord::Migration
  def change
    create_table :cash_balances do |t|
      t.decimal :cash
      t.decimal :extraction
      t.date :date
      t.integer :checkout_id
      t.integer :store_id 
      t.integer :user_id 

      t.timestamps
    end
  end
end

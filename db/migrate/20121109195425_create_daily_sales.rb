class CreateDailySales < ActiveRecord::Migration
  def change
    create_table :daily_sales do |t|
      t.date :date

      t.timestamps
    end
  end
end

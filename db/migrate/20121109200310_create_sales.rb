class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.date :date
      t.string :product
      t.decimal :value
      t.integer :user_id
      t.integer :store_id

      t.timestamps
    end
  end
end

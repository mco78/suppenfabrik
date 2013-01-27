class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.text :text
      t.decimal :pre_tax
      t.decimal :tax
      t.decimal :after_tax
      t.integer :user_id
      t.integer :store_id
      t.integer :checkout_id
      t.date :date

      t.timestamps
    end
  end
end

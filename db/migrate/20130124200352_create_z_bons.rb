class CreateZBons < ActiveRecord::Migration
  def change
    create_table :z_bons do |t|
      t.decimal :sale19
      t.decimal :sale7
      t.date :date
      t.integer :user_id
      t.integer :store_id
      t.integer :checkout_id

      t.timestamps
    end
  end
end

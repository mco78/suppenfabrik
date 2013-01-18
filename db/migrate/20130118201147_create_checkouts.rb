class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.date :date
      t.integer :store_id

      t.timestamps
    end
  end
end

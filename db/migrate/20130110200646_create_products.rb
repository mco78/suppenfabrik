class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.boolean :capture, :default => false

      t.timestamps
    end
  end
end

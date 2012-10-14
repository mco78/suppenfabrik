class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.integer :user_id
      t.datetime :start
      t.datetime :stop

      t.timestamps
    end
  end
end

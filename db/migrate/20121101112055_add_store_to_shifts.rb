class AddStoreToShifts < ActiveRecord::Migration
  def change
  	add_column :shifts, :store_id, :integer
  end
end

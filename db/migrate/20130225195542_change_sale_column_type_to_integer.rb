class ChangeSaleColumnTypeToInteger < ActiveRecord::Migration
  def change
  	change_column :sales, :value, :integer
  end

end

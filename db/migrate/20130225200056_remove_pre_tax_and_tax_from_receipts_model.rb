class RemovePreTaxAndTaxFromReceiptsModel < ActiveRecord::Migration
  def change
  	remove_column :receipts, :pre_tax
  	remove_column :receipts, :tax
  	rename_column :receipts, :after_tax, :value
  end

end

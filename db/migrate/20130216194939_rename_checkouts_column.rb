class RenameCheckoutsColumn < ActiveRecord::Migration
  def change
  	rename_column :users, :checkouts, :checkout_rights
  end
end

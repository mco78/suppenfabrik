class AddFinishedToCheckouts < ActiveRecord::Migration
  def change
  	add_column :checkouts, :finished, :boolean, {:null => false, :default => false}
  end
end

class Checkout < ActiveRecord::Base
  attr_accessible :date, :store_id, :user_id

  belongs_to :user
  belongs_to :store
  has_many :sales
  has_many :z_bons
  has_many :receipts
  has_many :cash_balances


  validates_presence_of :date, :user_id, :store_id
  

  def set_defaults(current_user)
  	self.user_id = current_user.id
  	self.store_id = current_user.get_current_store_id
  	self.date = Time.now
  end

end

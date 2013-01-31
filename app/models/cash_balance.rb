class CashBalance < ActiveRecord::Base
	attr_accessible :cash, :date, :extraction, 
  					:checkout_id, :store_id, :user_id

  	belongs_to :checkout
  	belongs_to :user
  	belongs_to :store

  	#validates_presence_of 	:cash, :extraction, :date, 
  	#						:checkout_id, :store_id, :user_id

end

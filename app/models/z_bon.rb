class ZBon < ActiveRecord::Base
  attr_accessible 	:checkout_id, :date, :sale19, :sale7, 
  					:store_id, :user_id

  belongs_to :checkout
  belongs_to :user
  belongs_to :store

  validates_presence_of :checkout_id, :date, :sale19, :sale7, 
  						:store_id, :user_id
  
end

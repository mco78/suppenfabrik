class Receipt < ActiveRecord::Base
  	attr_accessible :after_tax, :checkout_id, :date, :pre_tax, 
  					:store_id, :tax, :text, :user_id

  	belongs_to :checkout
  	belongs_to :user
  	belongs_to :store

  	validates_presence_of 	:after_tax, :checkout_id, :date, :pre_tax, 
  							:store_id, :tax, :user_id
end

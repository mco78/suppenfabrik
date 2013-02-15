class CashBalance < ActiveRecord::Base
	attr_accessible :cash, :date, :extraction, 
  					:checkout_id, :store_id, :user_id

  	belongs_to :checkout
  	belongs_to :user
  	belongs_to :store

  	#validates_presence_of 	:cash, :extraction, :date, 
  	#						:checkout_id, :store_id, :user_id

  	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
	    	csv << column_names
	      	all.each do |shift|
	    	    csv << shift.attributes.values_at(*column_names)
	    	end
	    end
	end
end

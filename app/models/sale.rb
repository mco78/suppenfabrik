class Sale < ActiveRecord::Base
	
	belongs_to :checkout
	belongs_to :product
	belongs_to :store
	belongs_to :user

	attr_accessible :date, :product_id, :store_id, :user_id, :value, :checkout_id

	validates_presence_of :product, :value, :user_id

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
	    	csv << column_names
	      	all.each do |shift|
	    	    csv << shift.attributes.values_at(*column_names)
	    	end
	    end
	end

end

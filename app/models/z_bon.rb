class ZBon < ActiveRecord::Base
  attr_accessible 	:checkout_id, :date, :sale19, :sale7, 
  					:store_id, :user_id

  belongs_to :checkout
  belongs_to :user
  belongs_to :store

  validates_presence_of :checkout_id, :date, :store_id, :user_id

  before_save :set_zero

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
	    	csv << column_names
	      	all.each do |shift|
	    	    csv << shift.attributes.values_at(*column_names)
	    	end
	    end
	end

	def set_zero
		if self.sale19.nil?
			self.sale19 = 0
		end
		if self.sale7.nil?
			self.sale7 = 0
		end
	end
  
end

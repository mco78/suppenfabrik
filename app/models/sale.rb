class Sale < ActiveRecord::Base
	
	belongs_to :daily_sale
	belongs_to :store
	belongs_to :user

	attr_accessible :date, :product, :store_id, :user_id, :value, :daily_sale_id

	validates_presence_of :product, :value, :user_id

	before_save :fill_hidden_fields

	def fill_hidden_fields
		parent = DailySale.find(self.daily_sale_id)
		self.store_id = parent.store_id
		self.date = parent.date
	end

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
	    	csv << column_names
	      	all.each do |shift|
	    	    csv << shift.attributes.values_at(*column_names)
	    	end
	    end
	end

end

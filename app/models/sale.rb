class Sale < ActiveRecord::Base
	
	belongs_to :daily_sale
	belongs_to :store
	belongs_to :user

	attr_accessible :date, :product, :store_id, :user_id, :value, :daily_sale_id

	before_save :fill_hidden_fields

	def fill_hidden_fields
		parent = DailySale.find(self.daily_sale_id)
		self.store_id = parent.store_id
		self.date = parent.date
	end

end

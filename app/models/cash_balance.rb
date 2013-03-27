class CashBalance < ActiveRecord::Base
	attr_accessible :cash, :date, :extraction, 
  					:checkout_id, :store_id, :user_id, :bill200, :bill100, :bill50,
  					:bill20, :bill10, :bill5, :bill2, :bill1, :bill0_50, :bill0_20, 
  					:bill0_10, :bill0_05, :bill0_02, :bill0_01,
  					:ex_bill200, :ex_bill100, :ex_bill50,
  					:ex_bill20, :ex_bill10, :ex_bill5, :ex_bill2, :ex_bill1, :ex_bill0_50, :ex_bill0_20, 
  					:ex_bill0_10, :ex_bill0_05, :ex_bill0_02, :ex_bill0_01


  	belongs_to :checkout
  	belongs_to :user
  	belongs_to :store

  	#validates_presence_of 	:cash, :extraction, :date, 
  	#						:checkout_id, :store_id, :user_id

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
		if self.cash.nil?
			self.cash = 0
		end
		if self.extraction.nil?
			self.extraction = 0
		end
	end

end

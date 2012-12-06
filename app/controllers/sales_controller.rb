class SalesController < ApplicationController

	before_filter :authenticate_user!
	before_filter :admin_rights
	
	def index
		@sales = Sale.all
		respond_to do |format|
			format.html
			format.csv { send_data Sale.to_csv }
			format.xls
		end
	end
end

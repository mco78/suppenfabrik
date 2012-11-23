class SalesController < ApplicationController

	def index
		@sales = Sale.all
		respond_to do |format|
			format.html
			format.csv { send_data Sale.to_csv }
			format.xls
		end
	end
end

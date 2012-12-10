class SalesController < ApplicationController

	before_filter :authenticate_user!
	before_filter :admin_rights
	
	def index
		@sales = Kaminari.paginate_array(Sale.all(:order => :date).reverse).page(params[:page]).per(20)
		respond_to do |format|
			format.html
			format.csv { send_data Sale.to_csv }
			format.xls
		end
	end
end

class CheckoutsController < ApplicationController

	before_filter :authenticate_user!

	def new
		@checkout = Checkout.new
		@checkout.set_defaults(current_user)
		if @checkout.store_id.nil?
			flash.keep[:alert] = "Du musst dich erst zu einer Schicht anmelden, um die Endabrechnung zu machen!"
			redirect_to timetracking_path
		else
			@store = Store.find(@checkout.store_id)
			@user = current_user
			@checkout.save
		end
		redirect_to checkout_sales_path(@checkout)
	end

	def step1
		@checkout = Checkout.find(params[:id])
		@store = Store.find(@checkout.store_id)
		@user = current_user
		@products = Product.where(:capture => true)
		@products.count.times {@checkout.sales.build }
	end

	def step2

	end

	def update
	    @checkout = Checkout.find(params[:id])
	    @checkout.update_attributes(params[:checkout])
	end



end

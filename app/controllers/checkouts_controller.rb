class CheckoutsController < ApplicationController

	before_filter :authenticate_user!
	before_filter :checkout_rights

	def new
		@user = current_user
		if @user.shifts.all(:order => :start).last.stop.nil?
			@checkout = Checkout.new
			@checkout.set_defaults(current_user)
			@checkout.save
			redirect_to checkout_sales_path(@checkout)
		else
			flash.keep[:alert] = "Du musst dich erst zu einer Schicht anmelden, um die Endabrechnung zu machen!"
			redirect_to timetracking_path
		end
	end

	def update
	    @checkout = Checkout.find(params[:id])
	    @checkout.update_attributes(params[:checkout])
	end



end

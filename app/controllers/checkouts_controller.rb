class CheckoutsController < ApplicationController

	before_filter :authenticate_user!
	before_filter :checkout_rights
	before_filter :admin_rights, :only => [:index, :show]

	def index
		@checkouts = Kaminari.paginate_array(Checkout.all(:order => :date).reverse).page(params[:page]).per(25)
	end

	def new
		@user = current_user
		if @user.shifts.empty?
			flash.keep[:alert] = "Du musst dich erst zu einer Schicht anmelden, um die Endabrechnung zu machen!"
			redirect_to timetracking_path
		else
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
	end

	def show
		@checkout = Checkout.find(params[:id])
		@user = current_user
		@store = @checkout.store
		@sales = @checkout.sales
		@z_bon = @checkout.z_bons.last
		@receipts = @checkout.receipts
		@cash_balance = @checkout.cash_balances.last
	end


	def confirm
		@checkout = Checkout.find(params[:id])
		@user = current_user
		@store = @checkout.store
		@sales = @checkout.sales
		@z_bon = @checkout.z_bons.last
		@receipts = @checkout.receipts
		@cash_balance = @checkout.cash_balances.last
	end

	def finish
		@checkout = Checkout.find(params[:id])
		@checkout.finished = true
		@checkout.save
		flash[:success]  = "Endabrechnung beendet."
		redirect_to root_path
	end


	def update
	    @checkout = Checkout.find(params[:id])
	    @checkout.update_attributes(params[:checkout])
	end



end

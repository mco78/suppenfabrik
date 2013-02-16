# -*- coding: utf-8 -*-
class CashBalancesController < ApplicationController

	before_filter :authenticate_user!
	before_filter :checkout_rights
	
	def index
		@checkout = Checkout.find(params[:checkout_id])
		@store = Store.find(@checkout.store_id)
		@user = current_user
		if CashBalance.find_by_checkout_id(@checkout.id).nil?
			@cash_balance = CashBalance.new
		else
			@cash_balance = @checkout.cash_balances.last
		end
		
		@sales = @checkout.sales
		@z_bon = @checkout.z_bons.last
		@receipts = @checkout.receipts
	end

	def admin_index
		respond_to do |format|
			format.html  { @cash_balances = Kaminari.paginate_array(CashBalance.all(:order => :date).reverse).page(params[:page]).per(25) }
			format.csv { send_data CashBalance.to_csv }
			format.xls { @cash_balances = CashBalance.all }
		end
	end

	def update
		@checkout = Checkout.find(params[:checkout_id])
		@cash_balance = CashBalance.find params[:id]
		@cash_balance.update_attributes params[:cash_balance]
		redirect_to checkout_cash_balances_path(@checkout)
	end

	def new
		@cash_balance = CashBalance.new
	end

	def create
    	@checkout = Checkout.find(params[:checkout_id])
    	@cash_balance = CashBalance.new(params[:cash_balance])

	    if @cash_balance.save
	        flash[:success] = "Kassenbestand gespeichert."
			redirect_to checkout_cash_balances_path(@checkout)
		else	
			flash[:error] = "Fehler!"
			redirect_to :back
	    end
	end

	def destroy
		CashBalance.find(params[:id]).destroy
		flash[:sucess] = "Kassenbestand gelöscht"
		redirect_to :back
	end

end

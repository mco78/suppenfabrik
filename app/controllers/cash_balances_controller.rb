# -*- coding: utf-8 -*-
class CashBalancesController < ApplicationController

	before_filter :authenticate_user!
	before_filter :checkout_rights
	before_filter :admin_rights, :only => [:admin_index]
	
	def index
		@checkout = Checkout.find(params[:checkout_id])
		@store = Store.find(@checkout.store_id)
		@user = current_user
		if CashBalance.find_by_checkout_id(@checkout.id).nil?
			@cash_balance = CashBalance.create(	:checkout_id => @checkout.id,
		 										:date => @checkout.date,
		 										:user_id => @user.id,
		 										:store_id => @store.id)
		else
			@cash_balance = @checkout.cash_balances.last
		end
		redirect_to edit_checkout_cash_balance_path(@checkout, @cash_balance)
	end

	def admin_index
		respond_to do |format|
			format.html  { @cash_balances = Kaminari.paginate_array(CashBalance.all(:order => :date).reverse).page(params[:page]).per(25) }
			format.csv { send_data CashBalance.to_csv }
			format.xls { @cash_balances = CashBalance.all }
		end
	end

	def edit
		@checkout = Checkout.find(params[:checkout_id])
		@store = Store.find(@checkout.store_id)
		@user = current_user
		@cash_balance = CashBalance.find(params[:id])
	end

	def update
		@checkout = Checkout.find(params[:checkout_id])
		@cash_balance = CashBalance.find params[:id]
		@cash_balance.update_attributes params[:cash_balance]
		redirect_to checkout_cash_balances_path(@checkout)
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

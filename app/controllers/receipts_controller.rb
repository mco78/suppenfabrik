# -*- coding: utf-8 -*-
class ReceiptsController < ApplicationController

	def index
		@checkout = Checkout.find(params[:checkout_id])
		@store = Store.find(@checkout.store_id)
		@user = current_user
		@receipts = @checkout.receipts
	end

	def update
		@checkout = Checkout.find(params[:checkout_id])
		@receipt = Receipt.find params[:id]
		@receipt.update_attributes params[:receipt]
		redirect_to checkout_receipts_path(@checkout)
	end

	def new
		@receipt = Receipt.new
	end

	def create
    	@checkout = Checkout.find(params[:checkout_id])
    	@receipt = Receipt.new(params[:receipt])

	    if @receipt.save
	        flash[:success] = "Beleg gespeichert."
			redirect_to checkout_receipts_path(@checkout)
		else	
			flash[:error] = "Fehler!"
			redirect_to :back
	    end
	end

	def destroy
		Receipt.find(params[:id]).destroy
		flash[:sucess] = "Beleg gelöscht"
		redirect_to :back
	end

end

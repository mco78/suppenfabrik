# -*- coding: utf-8 -*-
class ZBonsController < ApplicationController

	def index
		@checkout = Checkout.find(params[:checkout_id])
		@store = Store.find(@checkout.store_id)
		@user = current_user

		if ZBon.find_by_checkout_id(@checkout.id).nil?
			@z_bon = ZBon.new
		else
			@z_bon = @checkout.z_bons.last
		end
	end

	def update
		@checkout = Checkout.find(params[:checkout_id])
		@z_bon = ZBon.find params[:id]
		@z_bon.update_attributes params[:z_bon]
		redirect_to checkout_z_bons_path(@checkout)
	end

	def new
		@z_bon = ZBon.new
	end

	def create
    	@checkout = Checkout.find(params[:checkout_id])
    	@z_bon = ZBon.new(params[:z_bon])

	    if @z_bon.save
	        flash[:success] = "Z-Bon gespeichert."
			redirect_to checkout_z_bons_path(@checkout)
		else	
			flash[:error] = "Fehler!"
			redirect_to :back
	    end
	end

	def destroy
		ZBon.find(params[:id]).destroy
		flash[:sucess] = "Z-Bon gelöscht"
		redirect_to :back
	end
end

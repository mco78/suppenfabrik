# -*- coding: utf-8 -*-
class SalesController < ApplicationController

	before_filter :authenticate_user!
	before_filter :admin_rights
	
	def index
		@checkout = Checkout.find(params[:checkout_id])
		@store = Store.find(@checkout.store_id)
		@user = current_user
		@products = Product.where(:capture => true)

		@sales = @checkout.sales
		@sale = Sale.new
		# if @checkout.sales.empty?
		# 	@new = true
		# 	@products.count.times {@checkout.sales.build}
		# 	@sales = @checkout.sales
		# else
		# 	@new = false
		# 	@sales = @checkout.sales
		# end
	end

	def update
		@sale = Sale.find params[:id]
		@sale.update_attributes params[:sale]
	end

	def new
		@sale = Sale.new
	end

	def create
    	@sale = Sale.new(params[:sale])

	    respond_to do |format|
		      if @sale.save
			        format.html { redirect_to sales_path, notice: 'Umsatz erfolgreich erstellt.' }
			        format.json { render json: @sale, status: :created, location: @sale }
		      else
			        format.html { render action: "new" }
			        format.json { render json: @sale.errors, status: :unprocessable_entity }
		      end
	    end
	end

	def destroy
		Sale.find(params[:id]).destroy
		flash[:sucess] = "Umsatz gelöscht"
		redirect_to :back
	end
end

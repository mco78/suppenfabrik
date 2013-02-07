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
	end

	def admin_index
		respond_to do |format|
			format.html  { @sales = Kaminari.paginate_array(Sale.all(:order => :date).reverse).page(params[:page]).per(25) }
			format.csv { send_data Sale.to_csv }
			format.xls { @sales = Sale.all }
		end
	end

	def update
		@checkout = Checkout.find(params[:checkout_id])
		@sale = Sale.find params[:id]
		@sale.update_attributes params[:sale]
		redirect_to checkout_z_bons_path(@checkout)
	end	

	def new
		@sale = Sale.new
	end

	def create
		@checkout = Checkout.find(params[:checkout_id])
    	@sale = Sale.new(params[:sale])

	    if @sale.save
	        flash[:success] = "Umsatz gespeichert."
			redirect_to checkout_sales_path(@checkout)
		else	
			flash[:error] = "Fehler!"
			redirect_to :back
	    end
	end

	def destroy
		Sale.find(params[:id]).destroy
		flash[:sucess] = "Umsatz gelöscht"
		redirect_to :back
	end
end

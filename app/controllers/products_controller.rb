 # -*- coding: utf-8 -*-

class ProductsController < ApplicationController

	before_filter :authenticate_user!
	before_filter :admin_rights

	def index
		@products = Product.all(:order => :created_at)
	end

	def update
		@product = Product.find params[:id]
		@product.update_attributes params[:product]
		redirect_to products_path
	end

	def new
		@product = Product.new
	end

	def create
    @product = Product.new(params[:product])

	    respond_to do |format|
		      if @product.save
			        format.html { redirect_to products_path, notice: 'Product erfolgreich erstellt.' }
			        format.json { render json: @product, status: :created, location: @product }
		      else
			        format.html { render action: "new" }
			        format.json { render json: @product.errors, status: :unprocessable_entity }
		      end
	    end
	end

	def destroy
		Product.find(params[:id]).destroy
		flash[:sucess] = "Produkt gelöscht"
		redirect_to :back
	end

end

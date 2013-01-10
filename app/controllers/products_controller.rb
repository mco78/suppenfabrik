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

end

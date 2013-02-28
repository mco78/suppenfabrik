# -*- coding: utf-8 -*-
class ZBonsController < ApplicationController

	before_filter :authenticate_user!
	before_filter :checkout_rights
	before_filter :admin_rights, :only => [:admin_index]
	
	def index
		@checkout = Checkout.find(params[:checkout_id])
		@store = Store.find(@checkout.store_id)
		@user = current_user
		if ZBon.find_by_checkout_id(@checkout.id).nil?
		 	@z_bon = ZBon.create(	:checkout_id => @checkout.id,
		 							:date => @checkout.date,
		 							:user_id => @user.id,
		 							:store_id => @store.id)
		 else
		 	@z_bon = @checkout.z_bons.last
		end
		redirect_to edit_checkout_z_bon_path(@checkout, @z_bon)
	end

	def admin_index
		respond_to do |format|
			format.html  { @z_bons = Kaminari.paginate_array(ZBon.all(:order => :date).reverse).page(params[:page]).per(25) }
			format.csv { send_data ZBon.to_csv }
			format.xls { @z_bons = ZBon.all }
		end
	end

	def edit
		@checkout = Checkout.find(params[:checkout_id])
		@store = Store.find(@checkout.store_id)
		@user = current_user
		@z_bon = ZBon.find(params[:id])
	end

	def update
		@checkout = Checkout.find(params[:checkout_id])
		@z_bon = ZBon.find(params[:id])

		if @z_bon.update_attributes(params[:z_bon])
			flash[:success] = "Z-Bon aktualisiert."
			redirect_to edit_checkout_z_bon_path(@checkout, @z_bon)	 
		else
			flash[:error] = "Fehler!"
			redirect_to :back
	    end
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

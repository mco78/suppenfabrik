 # -*- coding: utf-8 -*-

class UsersController < ApplicationController

	before_filter :authenticate_user!
	before_filter :admin_rights

	def index
		@title = "Übersicht User"
		@users = User.all
	end

	def show
		@title = "User Detailansicht"
		@user = User.find(params[:id])
	end

	def new
		@title = "User erstellen"
		@user = User.new
	end

	def edit
		@title = "User bearbeiten"
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(params[:user])

		if @user.save
			flash[:success] = "User angelegt"
			redirect_to @user
		else
			flash[:error] = "Fehler!"
			redirect_to :back
		end
	end

	def update
		@user = User.find(params[:id])

		if @user.update_attributes(params[:user])
			flash[:success] = "User geändert."
			redirect_to @user
		else
			flash[:error] = "Fehler!"
			redirect_to :back
		end
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User gelöscht"
		redirect_to :back
	end 

	def edit_password
		@user = User.find(params[:id])
	end

	def update_password
	    @user = User.find(params[:id])
	    if @user.update_attributes(params[:user])
	      # Sign in the user by passing validation in case his password changed
	      #sign_in @user, :bypass => true
	      flash[:success] = "Passwort von " + @user.name + " geändert."
	      #flash[:alert] = "ACHTUNG: Aus Testgründen wurde " + @user.name + " automatisch angemeldet! Bitte ausloggen!"
	      redirect_to users_path
	    else
	      #redirect_to edit_password_user_path
	      render "edit_password"
	    end
	end



end

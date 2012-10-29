 # -*- coding: utf-8 -*-

class UsersController < ApplicationController

	before_filter :authenticate_user!
	before_filter :user_management_rights

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



end

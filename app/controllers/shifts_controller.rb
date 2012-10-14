 # -*- coding: utf-8 -*-
class ShiftsController < ApplicationController

	def index
		@title = "Übersicht Schichten"
		@shifts = Shift.all
	end

	def show
		@title = "Ansicht Schicht"
		@shift = Shift.find(params[:id])
	end

	def new
		@title = "Schicht erstellen"
		@shift = Shift.new
	end

	def edit
		@title = "Schicht bearbeiten"
		@shift = Shift.find(params[:id])
	end

	def create
		@shift = Shift.new(params[:shift])
		if @shift.save
			flash[:success] = "Schicht erfolgreich erstellt."
			redirect_to @shift
		else
			flash[:error] = "Fehler!"
			redirect_to :back
		end
	end

	def update
		@shift = Shift.find(params[:id])

		if @shift.update_attributes(params[:shift])
			flash[:success] = "Schicht bearbeitet."
			redirect_to @shift
		else
			flash[:error] = "Fehler!"
			redirect_to :back
		end
	end

	def destroy
		Shift.find(params[:id]).destroy
		flash[:alert] = "Schicht gelöscht"
		redirect_to shifts_path
	end
end

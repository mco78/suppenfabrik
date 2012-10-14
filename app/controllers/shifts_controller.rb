 # -*- coding: utf-8 -*-
class ShiftsController < ApplicationController

	before_filter :authenticate_user!

	def timetracking
		@title = 'Zeiterfassung'
		@user = current_user

		if @user.shifts.empty?
			@status = "not working"
		else
			if @user.shifts.all(:order => :start).last.stop.nil?
				#schicht läuft noch
				@current_shift = @user.shifts.all(:order => :start).last
			else
				#neue schicht
				@current_shift = nil
				@last_shift = @user.shifts.all(:order => :start).last
				@status = "not working"
			end
		end
		
	end

	def start
		@user = current_user
		@user.start_shift
		redirect_to timetracking_path
	end

	def stop
		@user = current_user
		@shift = Shift.find(params[:id])
		@user.end_shift(@shift)
		redirect_to timetracking_path
	end

	def index
		@title = "Übersicht Schichten"
		@shifts = Shift.all.sort_by &:start
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

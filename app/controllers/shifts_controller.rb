 # -*- coding: utf-8 -*-
class ShiftsController < ApplicationController

	before_filter :authenticate_user!
	before_filter :time_tracking_rights, :only => [:timetracking, :start, :stop]
	before_filter :admin_rights, :only => [:index, :show, :new, :edit, :create, :update, :destroy]

	def timetracking
		@title = 'Zeiterfassung'
		@user = current_user
		
		if @user.shifts.empty?
		else
			if @user.shifts.all(:order => :start).last.stop.nil?
				@current_shift = @user.shifts.all(:order => :start).last
			else
				@current_shift = nil
				@last_shift = @user.shifts.all(:order => :start).last
			end
		end
	end

	def confirm_start
		@title = 'Schicht starten'
		@user = current_user
		@stores = Store.all
		@shift = Shift.new

		if @user.shifts.empty?
		else
			if @user.shifts.all(:order => :start).last.stop.nil?
				@current_shift = @user.shifts.all(:order => :start).last
			else
				@current_shift = nil
				@last_shift = @user.shifts.all(:order => :start).last
			end
		end
	end

	def start
		@shift = Shift.new(params[:shift])
		if @shift.save
			flash[:success] = "Schicht gestartet um " + Time.now.strftime("%H:%M") + "."
			redirect_to timetracking_path
		else
			flash[:error] = "Fehler!"
			redirect_to timetracking_path
		end
	end

	def stop
		@user = current_user
		@shift = @user.shifts.all(:order => :start).last
		@user.end_shift(@shift)
		flash[:success] = "Schicht beendet um " + @shift.stop.strftime("%H:%M") + ". Arbeitszeit: "
		redirect_to timetracking_path
	end

	def index
		@title = "Übersicht Schichten"
		
		respond_to do |format|
			format.html  { @shifts = Kaminari.paginate_array(Shift.all(:order => :start).reverse).page(params[:page]).per(25) }
			format.csv { send_data Shift.to_csv }
			format.xls { @shifts = Shift.all }
		end
	end

	def show
		@title = "Ansicht Schicht"
		@shift = Shift.find(params[:id])
	end

	def new
		@title = "Schicht erstellen"
		@shift = Shift.new
		@stores = Store.all
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

class ApplicationController < ActionController::Base
  protect_from_forgery

  def user_management_rights
  	unless current_user.user_management == true
  		flash[:error] = "Du hast keine Usermanagement-Rechte!"
  		redirect_to :root
  	end
  end

  def time_tracking_rights
  	unless current_user.time_tracking == true
  		flash[:error] = "Du hast keine Zeiterfassungs-Rechte!"
  		redirect_to :root
  	end
  end

  def time_tracking_admin_rights
  	unless current_user.time_tracking_admin == true
  		flash[:error] = "Du hast keine Zeiterfassung-Verwaltungs-Rechte!"
  		redirect_to :root
  	end
  end

end

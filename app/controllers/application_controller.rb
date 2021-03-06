# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  def admin_rights
  	unless current_user.admin == true
  		flash[:error] = "Du hast keine Admin-Rechte!"
  		redirect_to :root
  	end
  end

  def time_tracking_rights
  	unless current_user.time_tracking == true
  		flash[:error] = "Du hast keine Zeiterfassungs-Rechte!"
  		redirect_to :root
  	end
  end

  def checkout_rights
    unless current_user.checkout_rights == true
      flash[:error] = "Du hast keine Endabrechnugns-Rechte!"
      redirect_to :root
    end
  end

end

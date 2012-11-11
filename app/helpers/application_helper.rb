module ApplicationHelper

	def find_user_location(user)
		if user.shifts.all(:order => :start).last.stop.nil?
			return user.shifts.all(:order => :start).last.store_id
		else
			return nil
		end
	end

end

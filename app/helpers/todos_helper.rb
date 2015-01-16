module TodosHelper
	def past_due(date)
		if Date.today.in_time_zone > date
			return true
		else
			return false
		end
	end

	def is_due(date)
		if Date.today.in_time_zone == date
			return true
		else 
			return false
		end
	end
end

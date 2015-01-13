module TodosHelper
	def past_due(date)
		if Date.today > date
			return true
		else
			return false
		end
	end

	def is_due(date)
		if Date.today == date
			return true
		else 
			return false
		end
	end
end

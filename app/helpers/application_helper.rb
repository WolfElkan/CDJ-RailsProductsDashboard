module ApplicationHelper
end

class ActionDispatch::Request::Session
	def init defaults
		defaults.to_a.each do |default| 
			@key = default[0]
			@val = default[1]
			if self[@key] == nil
				self[@key] = @val
			end
		end
	end
end

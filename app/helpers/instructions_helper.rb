module InstructionsHelper
	def percent 
		# require 'debugger'; debugger
		(@instructions.current_page.to_f / @instructions.total_pages.to_f) * 100
	end
end

class Sizes
	attr_accessor :handle
	def initialize(filename)
		@handle = File.open(filename, 'a')
	end

	def addSizing(waist, length, skirt_type)
		newSize = "#{waist},#{length},#{skirt_type}"
		@handle.puts(newSize)
	end
end




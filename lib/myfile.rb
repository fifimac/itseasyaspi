class MyFile
	attr_accessor :handle
	def initialize(filename)
		@handle = File.new(filename, 'r')
	end
	def finished
		@handle.close
		puts "Bye"
	end
	def showall
		while !(@handle.eof) do
		puts @handle.gets
		end
	end
end


# f = MyFile.new("testfile.txt")
# # puts f.handle.gets
# f.showall
# f.finished
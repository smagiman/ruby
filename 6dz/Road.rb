class Road

	attr_accessor  :title, :cars, :bicycles, :traffic_lights

	def initialize(title)
		print 'how would you like to call you Road?'
		@title = title
		@traffic_lights = Array.new
		@cars = Hash.new
		@bicycles = Hash.new
	end
end
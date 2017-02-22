class TrafficLight
	attr_accessor :color, :state
	def initialize()
		@state = 'good'
		random_num = rand(10)
		if random_num > 5
		  @color = 'red'
		else
		  @color = 'green'
		end
	end

	def change_color!	
		if @color == 'red'
			@color = 'green'
		else
			@color = 'red'
		end
		random_num = rand(10)
		if random_num > 5
			@state = 'bad'
		end
	end
end
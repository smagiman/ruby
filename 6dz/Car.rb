
class Car < Vehicle
	def destroy!
		puts "OMG, something goes wrong and I got into accident!" 
		puts "#{@title} car was brave, RIP"
		@title
	end
	def drive(traffic_light, count_of_traffic_lights = 0)	
        if traffic_light == nil
        	puts "It`s so boring when you don`t have traffic lights"
		elsif traffic_light.color == 'green' && @location < count_of_traffic_lights 
			puts "Let`s drive"
			@location += 1
		elsif traffic_light.color == 'green' && @location >= count_of_traffic_lights 
			puts "Let`s drive"
			@location = 1
		else
			puts "I guess i cant drive"
	end
	end
end


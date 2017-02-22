class Game
	attr_accessor :roads
	def initialize()
		@roads = Hash.new
		puts 'Hello, my friend let`s play'
	end

	def start
		puts 'For more information print "help"'
		answer = gets
		answer = answer.downcase.chomp
		case answer
		  when 'make road'
		  	self.make_road
		  when 'make car'
		    self.make_car
		  when 'make bicycle'
		    self.make_bicycle
		  when 'make traffic light'
		    self.make_traffic_light
		  when 'audit'
		    self.audit
		  when 'go'
		    self.go
		  when 'restart'
		    self.restart
		  when 'exit'
		  	exit
		  when 'help'
		    self.help
		  else
		  	puts "There is no command like this, for more information print 'help'"
		    self.start
		end
	end

	def make_road
		title = gets 
		title = @title.chomp
		road = Road.new(title)
		@roads[road.title] = road
	    self.start
	end

	def make_car
		if @roads.length == 0
			puts 'You can`t make cars if you don`t have some roads'
		    self.start
		end
		print "how would you like to call you Car? "
		title = gets 
		title = title.chomp
		car = Car.new(title)
		puts "You have #{@roads.length} road(s) now, choose a name of road for your new car"
		@roads.each { |key, road|
			p road.title
		}
		print 'Choose a road:'
		road = gets 
		road = road.chomp
		unless @roads[road] == nil
			@roads[road].cars[car.title] = car
		else
			puts 'Oops, there is no such road, car have been lost and destroyed :-('
		end
		    self.start
	end

	def make_bicycle
		if @roads.length == 0
			puts 'You can`t make cars if you don`t have some roads'
		    self.start
		end
		print "how would you like to call you Car? "
		title = gets 
		title = title.chomp
		bicycle = Bicycle.new(title)
		puts "You have #{@roads.length} roads now, choose a name of road for your new bicycle"
		@roads.each { |key, road|
			p road.title
		}
		print 'Choose a road:'
		road = gets 
		road = road.chomp
		unless @roads[road] == nil
			@roads[road].bicycles[bicycle.title] = bicycle
		else
			puts 'Oops, there is no such road, bicycle have been lost and destroyed :-('
		end
		    self.start
	end

	def make_traffic_light
		if @roads.length == 0
			puts 'You can`t make traffic lights if you don`t have some roads'
		    self.start
		end
		traffic_light = TrafficLight.new
		puts "You have #{@roads.length} roads now, choose a name of road for your new traffic light"
		@roads.each { |key, road|
			p road.title
		}
		print 'Choose a road:'
		road = gets 
		road = road.chomp
		unless @roads[road] == nil
			@roads[road].traffic_lights.push(traffic_light)
		else
			puts 'Oops, there is no such road, traffic light have been lost and destroyed :-('
		end
		    self.start
	end

	def audit 
		if @roads.length == 0 
		puts "There is nothing here yet" 
		else
		puts "You have a lot of staff here:"
		end
		@roads.each {|key, road| 
			print 'Road: '
			p road.title 
			puts "\nCars:"
			road.cars.each { |key, car|
				puts "  #{key}, which located at point #{car.location}"			
			} 
			puts "\nBicycles:"
			road.bicycles.each { |key, bicycle|
				puts "  #{bicycle.title}"
			}
			puts "\nTraffic lights:"
			road.traffic_lights.each { |light|
				puts "  traffic light that burn #{light.color} in #{light.state} state"
			}
			print "\n"
		}
		self.start
	end

	def restart
		game = self.class.new
		game.start
	end

	def make_move
		@roads.each do |roadname, road|
			road.cars.each do |car_name, car|
			  print "I am a Car #{car.title} and I located on "
			  if road.traffic_lights.length == 0
			  	print "big road called #{road.title} without any traffic lights\n"
			  else
			  	print "big road called #{road.title} on traffic light number #{car.location} \n"
			  	if road.traffic_lights[car.location - 1].state == 'bad'
					unlucky_cars = road.cars.reject do |cartocheck_name, cartocheck| 
						cartocheck.location != car.location || car_name == cartocheck_name
					end
					unless unlucky_cars.length == 0
					unlucky_cars.each do |key, unlucky| 
						road.cars.delete(unlucky.destroy!)
						end
						road.cars.delete(car.destroy!)
					end
				else 
					car.drive(road.traffic_lights[car.location - 1], road.traffic_lights.length)
				end
			  end

			end
			road.bicycles.each do |by_name, bicycle|
				bicycle.drive
			end
			road.traffic_lights.each do |light|
				light.change_color!
			end
		end
	end

	def go
		puts 'we are all was burn for moving'
		self.start
	end


	def help
		string = File.open('help.txt', 'rb') { |file| file.read }
		puts string
		self.start
	end
end
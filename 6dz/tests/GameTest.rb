require '../Game.rb'
require '../Vehicle.rb'
require '../Car.rb'
require '../Road.rb'
require '../Bicycle.rb'
require '../TrafficLight.rb'

require "test/unit"

class GameTest < Test::Unit::TestCase

	def setup
		@game = Game.new
		road = Road.new('road')
		car1 = Car.new('bmw')
		car2 = Car.new('nissan')
		car3 = Car.new('lada')
		traffic1 = TrafficLight.new()
		traffic2 = TrafficLight.new()
		traffic3 = TrafficLight.new()
		@game.roads[road.title] = road
		@game.roads['road'].cars['bmw'] = car1
		@game.roads['road'].cars['nissan'] = car2
		@game.roads['road'].traffic_lights.push(traffic1)
		@game.roads['road'].traffic_lights.push(traffic2)
		@game.roads['road'].traffic_lights.push(traffic3)
		@game.roads['road'].traffic_lights.each do |t_l| 
			t_l.state = 'good'
			t_l.color = 'green'
		end
		@game.make_move
		@game.roads['road'].cars['lada'] = car3
		@game.roads['road'].traffic_lights.each do |t_l| 
			t_l.state = 'bad'
			#t_l.color = 'green'
		end
		@game.make_move
	end	

	def test_crash
		#testing that crash happens only when 2 cars stay on broken traffic light
		assert_equal(@game.roads['road'].cars.length, 1)
	end

end
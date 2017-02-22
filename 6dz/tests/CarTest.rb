require '../Vehicle.rb'
require '../Car.rb'
require '../TrafficLight.rb'

require "test/unit"

class CarTest < Test::Unit::TestCase

	def setup
		@car = Car.new('BMW')
		@traffic_light = TrafficLight.new
		@traffic_light_count = 2
	end

	def test_drive_green
		@traffic_light.color = 'green'
		start_location = @car.location
		@car.drive(@traffic_light, @traffic_light_count)
		end_location = @car.location
		assert_equal(start_location, end_location - 1)
	end

	def test_drive_red
		@traffic_light.color = 'red'
		start_location = @car.location
		@car.drive(@traffic_light, @traffic_light_count)
		end_location = @car.location
		assert_equal(start_location, end_location)
	end

	def no_more_traffic_lights
		@traffic_light.color = 'green'
		start_location = @car.location
		@car.drive(@traffic_light, @traffic_light_count)
		@car.drive(@traffic_light, @traffic_light_count)
		end_location = @car.location
		assert_equal(1, end_location)
	end

end
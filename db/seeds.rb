# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

reservoir = Reservoir.new(2500,350)

temp_values = [67, 65, 53, 39, 35]

temp_sensor1 = TemperatureSensor.new(temp_values[0])
temp_sensor2 = TemperatureSensor.new(temp_values[1])
temp_sensor3 = TemperatureSensor.new(temp_values[2])
temp_sensor4 = TemperatureSensor.new(temp_values[3])
temp_sensor5 = TemperatureSensor.new(temp_values[4])
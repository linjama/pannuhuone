# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Reservoir.destroy_all
reservoir = Reservoir.create!(volume: 2500, mass: 350)


TemperatureSensor.destroy_all
temp_values = [67, 65, 53, 39, 35]

reservoir.temperature_sensors.create!(temperature: temp_values[0])
reservoir.temperature_sensors.create!(temperature: temp_values[1])
reservoir.temperature_sensors.create!(temperature: temp_values[2])
reservoir.temperature_sensors.create!(temperature: temp_values[3])
reservoir.temperature_sensors.create!(temperature: temp_values[4])
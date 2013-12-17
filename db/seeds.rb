# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Reservoir.destroy_all
reservoir = Reservoir.create!(volume: 2500, mass: 350, name: "main_reservoir")


TemperatureSensor.destroy_all
temp_values = [81, 80, 80, 76, 68]
calibration_data = { voltages: Vector[1.2, 1.7, 2.0], temperatures: Vector[100, 60, 42] }

reservoir.temperature_sensors.create!(
  name: "top-0",
  temperature: temp_values[0], 
  calibration_data: calibration_data
  )
  
reservoir.temperature_sensors.create!(
  name: "top-1",
  temperature: temp_values[1],
  calibration_data: calibration_data
  )
  
reservoir.temperature_sensors.create!(
  name: "top-2",
  temperature: temp_values[2],
  calibration_data: calibration_data
  )
  
reservoir.temperature_sensors.create!(
  name: "top-3",
  temperature: temp_values[3],
  calibration_data: calibration_data
  )
  
reservoir.temperature_sensors.create!(
  name: "top-4",
  temperature: temp_values[4], 
  calibration_data: calibration_data
  )
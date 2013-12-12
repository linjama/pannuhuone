require 'matrix'

FactoryGirl.define do

  factory :reservoir do
    volume 2500
    mass 350
    name 'main_reservoir'
    after(:create) do |reservoir|
      1.upto(5) do |i|
        reservoir.temperature_sensors << FactoryGirl.build(
          :temperature_sensor, reservoir: reservoir, temperature: 60-2*i
        )
      end
    end
  end
  
  factory :temperature_sensor do
    temperature 57
    reservoir Reservoir.find_by_name('main_reservoir')
    calibration_data({ voltages: Vector[1.2, 1.7, 2.0], temperatures: Vector[100, 60, 42] })
  end
  
end
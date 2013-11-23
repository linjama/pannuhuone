require 'vector_math_helper'

class Reservoir < ActiveRecord::Base
  
  has_many :temperature_sensors, dependent: :destroy
  
  # Constants
  WATER_HEAT_CAPACITY = 4.2/3600.0    # [kWh/l/Celsius]
  METAL_HEAT_CAPACITY = 0.45/3600.0   # [kWh/kg/Celcius]
  TEMPERATURE_OF_INLET_WATER = 6
  TEMPERATURE_OF_HEATING_RETURN = 28  # Not planned to be measured
  TEMPERATURE_MEASUREMENT_POCKETS = Vector[20, 20, 20, 20, 20]/100 
  
  def total_heat_capacity
    WATER_HEAT_CAPACITY*self.volume + METAL_HEAT_CAPACITY*self.mass
  end
  
  def partial_heat_capacity
    self.total_heat_capacity * TEMPERATURE_MEASUREMENT_POCKETS
  end
  
  def remaining_capacity_for_heating
    vector_multiply(self.partial_heat_capacity, self.read_temperatures-TEMPERATURE_OF_HEATING_RETURN)
  end
  
  def read_temperatures
    ary = []
    self.temperature_sensors.each do |sensor|
      ary << sensor.temperature
    end
    Vector.elements(ary)
  end
     
end
class Reservoir < ActiveRecord::Base
  
  has_many :temperature_sensors
  
  require 'vector_math_helper'
  
  attr_accessor(:volume)
  attr_reader(:total_heat_capacity)
  attr_reader(:partial_heat_capacity)
  
  # Constants
  WATER_HEAT_CAPACITY = 4.2/3600.0    # [kWh/l/Celsius]
  METAL_HEAT_CAPACITY = 0.45/3600.0   # [kWh/kg/Celcius]
  TEMPERATURE_OF_INLET_WATER = 6.0
  TEMPERATURE_OF_HEATING_RETURN = 30.0  # Not planned to be measured
  TEMPERATURE_MEASUREMENT_POCKETS = vector_multiply([20, 20, 20, 20, 20],1/100) 
  
  def initialize(volume = 2500, mass = 350)
    @volume = volume
    @total_heat_capacity = calculate_total_heat_capacity(volume, mass)
    
    @partial_heat_capacity = vector_multiply(
      @total_heat_capacity, TEMPERATURE_MEASUREMENT_POCKETS
    )
       
  end
    
  private
  def calculate_total_heat_capacity(volume,mass)
    WATER_HEAT_CAPACITY*volume + METAL_HEAT_CAPACITY*mass
  end
    
  
end
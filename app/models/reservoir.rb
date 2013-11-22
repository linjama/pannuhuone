require 'vector_math_helper'

class Reservoir < ActiveRecord::Base
  
  has_many :temperature_sensors, dependent: :destroy
  
  # Constants
  WATER_HEAT_CAPACITY = 4.2/3600.0    # [kWh/l/Celsius]
  METAL_HEAT_CAPACITY = 0.45/3600.0   # [kWh/kg/Celcius]
  TEMPERATURE_OF_INLET_WATER = 6.0
  TEMPERATURE_OF_HEATING_RETURN = 30.0  # Not planned to be measured
  TEMPERATURE_MEASUREMENT_POCKETS = Vector[20, 20, 20, 20, 20]/100 
  
  def total_heat_capacity
    WATER_HEAT_CAPACITY*@volume + METAL_HEAT_CAPACITY*@mass
  end
  
  def partial_heat_capacity
    @total_heat_capacity * TEMPERATURE_MEASUREMENT_POCKETS
  end
  
  #def remaining_capacity_for_heating
    #@partial_heat_capacity
  #end
     
end
class Reservoir < ActiveRecord::Base
  
  has_many :temperature_sensors
  
  # Constants
  WATER_HEAT_CAPACITY = 4.2/3600.0    # [kWh/l/Celsius]
  METAL_HEAT_CAPACITY = 0.45/3600.0   # [kWh/kg/Celcius]
  TEMPERATURE_OF_INLET_WATER = 6.0
  TEMPERATURE_OF_HEATING_RETURN = 30.0
  TEMPERATURE_MEASUREMENT_POCKETS = [20, 20, 20, 20, 20] 
  
  def initialize(volume = 2500, mass = 350)
    @total_heat_capacity = total_heat_capacity
    TEMPERATURE_MEASUREMENT_POCKETS.each_with_index do |tmp|
      @partial_heat_capacity
    end
      
  end
    
  private
  def total_heat_capacity
    WATER_HEAT_CAPACITY*WATER_VOLUME + METAL_HEAT_CAPACITY*MASS_OF_METAL_PARTS
  end
    
  
end
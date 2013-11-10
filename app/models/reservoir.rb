class Reservoir < ActiveRecord::Base
  
  has_many :temperature_sensors
  
  # Constants
  WATER_HEAT_CAPACITY = 4.2/3600.0    # [kWh/l/Celsius]
  METAL_HEAT_CAPACITY = 0.45/3600.0   # [kWh/kg/Celcius]
  WATER_VOLUME = 2500.0               # [liters]
  MASS_OF_METAL_PARTS = 350.0            # [kg]
  TEMPERATURE_OF_INLET_WATER = 6.0
  TEMPERATURE_OF_HEATING_RETURN = 30.0
  TEMPERATURE_MEASUREMENT_POCKETS
  
  def initialize
    #
  end
    
  private
    def total_heat_capacity
      WATER_HEAT_CAPACITY*WATER_VOLUME + METAL_HEAT_CAPACITY*MASS_OF_METAL_PARTS
    end
    
  
end

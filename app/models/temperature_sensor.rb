class TemperatureSensor < ActiveRecord::Base
  
  belongs_to :reservoir
  
  attr_reader :temperature
  
  def initialize(temperature=nil)
    @temperature = temperature
  end
     
end

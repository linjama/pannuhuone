#coding: utf-8

class TemperatureSensor < ActiveRecord::Base
  belongs_to :reservoir
  validates :reservoir_id, presence: true
  serialize :calibration_data, Hash
  
  def write_temperature_to_db
    channel = self.name[-1].to_i
    u = read_mcp3008(channel)
    
    self.temperature = interpolate(
      self[:calibration_data][:voltages], self[:calibration_data][:temperatures], u
    )
    
    self.save!
  end
  
  private
  
  def read_mcp3008(channel)
    1+0.1*channel
  end
  
  
end

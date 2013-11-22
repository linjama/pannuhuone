class TemperatureSensor < ActiveRecord::Base
  belongs_to :reservoir
  validates :reservoir_id, presence: true
    
end

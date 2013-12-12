#coding: utf-8

class TemperatureSensor < ActiveRecord::Base
  belongs_to :reservoir
  validates :reservoir_id, presence: true
  serialize :calibration_data, Hash
end

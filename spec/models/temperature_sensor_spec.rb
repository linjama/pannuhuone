require 'spec_helper'

describe TemperatureSensor do
  let!(:sensor1) { FactoryGirl.build(:temperature_sensor) }
  
  it "has calibration data" do
    sensor1[:calibration_data].should_not be_nil
  end
  
  it "has at least two voltage values" do
    sensor1[:calibration_data][:voltages].size.should >= 2 
  end
  
  specify "the number of voltage and temperature points is the same" do
    sensor1[:calibration_data][:voltages].size.should 
      eq(sensor1[:calibration_data][:temperatures].size)
  end
  
  specify "voltage values are monotonically increasing" do
    u = Vector.elements(sensor1[:calibration_data][:voltages])
    diff(u).each do |delta_u|
      delta_u.should > 0
    end
  end
  
  specify "temperature values are monotonically decreasing" do
    t = Vector.elements(sensor1[:calibration_data][:temperatures])
    diff(t).each do |delta_t|
      delta_t.should < 0
    end
  end 
  
  describe "Linear interpolation" do
    xit "returns the corresponding temperature value at data point"
  end
  
end

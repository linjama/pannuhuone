require 'spec_helper'

describe TemperatureSensor do
  let!(:sensor1) { FactoryGirl.build(:temperature_sensor) }
  let!(:u_data) { sensor1[:calibration_data][:voltages] }
  let!(:t_data) { sensor1[:calibration_data][:temperatures] }
  
  it "has calibration data" do
    u_data.should_not be_nil
    t_data.should_not be_nil
  end
  
  it "has at least two voltage values" do
    u_data.size.should >= 2 
  end
  
  specify "the number of voltage and temperature points is the same" do
    u_data.size.should eq t_data.size
  end
  
  specify "voltage values are monotonically increasing" do
    diff(u_data).each do |delta_u|
      delta_u.should > 0
    end
  end
  
  specify "temperature values are monotonically decreasing" do
    diff(t_data).each do |delta_t|
      delta_t.should < 0
    end
  end 
end

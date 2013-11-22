require 'spec_helper'

describe "Reservoir" do
  
  let(:reservoir) { FactoryGirl.create(:reservoir) }
  
  it "has reasonable value for volume" do
    reservoir.volume.should be > 10
    reservoir.volume.should be < 20000
  end
  
  it "has reasonable value for total heat capacity" do
    reservoir.total_heat_capacity.should be > 0.1   # kWh/deg_C
    reservoir.total_heat_capacity.should be < 100   # kWh/deg_C 
  end
  
  specify ": The sum of partial heat capacities is equal to total heat capacity" do
    sum = reservoir.partial_heat_capacity.reduce(:+)
    sum.should be_within(0.0001).of reservoir.total_heat_capacity
  end

  it "has at least one temperature sensor" do
    reservoir.temperature_sensors.first.should_not be_nil
  end

end

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
  
  specify "The sum of partial heat capacities is equal to total heat capacity" do
    sum = reservoir.partial_heat_capacity.reduce(:+)
    sum.should be_within(0.0001).of reservoir.total_heat_capacity
  end
  
  specify "Each temperature pocket has sensor" do
    reservoir.temperature_sensors.count.should eq Reservoir::TEMPERATURE_MEASUREMENT_POCKETS.size
    reservoir.read_temperatures.size.should eq Reservoir::TEMPERATURE_MEASUREMENT_POCKETS.size
  end
  
  specify "The temperature sensor readings are reasonable" do
    temperatures = reservoir.read_temperatures
    temperatures.each do |t|
      t.should be_within(45).of 55
    end
  end
  
  it "has reasonable value for maximum capacity for hot water" do
    max_hot_water_capacity = reservoir.maximum_capacity_for_hot_water
    estimate = reservoir.total_heat_capacity*35
    tolerance = reservoir.total_heat_capacity*10
    max_hot_water_capacity.should be_within(tolerance).of estimate
  end
  
  it "has reasonable value for maximum capacity for heating" do
    max_heating_capacity = reservoir.maximum_capacity_for_heating
    estimate = reservoir.total_heat_capacity*50
    tolerance = reservoir.total_heat_capacity*10
    max_heating_capacity.should be_within(tolerance).of estimate
  end

end

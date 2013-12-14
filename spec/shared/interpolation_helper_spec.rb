require 'spec_helper'
require 'interpolation_helper'

describe "InterpolationHelper" do
  let!(:x_data) { Vector[1.2, 1.7, 2.1, 22.4] }
  let!(:y_data) { Vector[12, 16, 27, 46] }
  let!(:delta_x) { diff(x_data) }
  let!(:delta_y) { diff(y_data) }
  
  it "returns the corresponding y-value at data point" do
    interpolate(x_data,y_data,x_data[0]).should eq y_data[0]
    interpolate(x_data,y_data,x_data[1]).should eq y_data[1]
  end
  
  it "interpolates betweeen data points" do
    (0..x_data.size-2).each do |ind|
      x_test = x_data[ind]+delta_x[ind]/2
      y_expected = y_data[ind]+delta_y[ind]/2
      interpolate(x_data,y_data,x_test).should be_within(1e-9).of(y_expected)
    end
  end
  
  it "extrapolates if x-value is smaller than first data point" do
    x_test = x_data[0] - delta_x[0]
    y_expected = y_data[0]-delta_y[0]
    interpolate(x_data,y_data,x_test).should be_within(1e-9).of(y_expected)
  end
  
  it "extrapolates if x-value is bigger than last data point" do
    x_test = x_data[-1] + delta_x[-1]
    y_expected = y_data[-1] + delta_y[-1]
    interpolate(x_data,y_data,x_test).should be_within(1e-9).of(y_expected)
  end
end
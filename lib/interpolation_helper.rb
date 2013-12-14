#coding: utf-8

require 'mathn'

def interpolate(x_vec, y_vec, x)
  x_data = x_vec.to_a
  y_data = y_vec.to_a
  if x_data.include?(x)
    ind = x_data.index { |val| val == x }
    return y_data[ind]
  elsif x > x_data[0] && x < x_data[-2]
    ind = x_data.index { |val| x > val }
    slope = (y_data[ind+1] - y_data[ind]) / (x_data[ind+1] - x_data[ind]) 
    return y_data[ind] + slope * (x - x_data[ind]) 
  end
end

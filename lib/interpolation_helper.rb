#coding: utf-8

require 'mathn'

def interpolate(x_vec, y_vec, x)
  x_data = x_vec.to_a
  y_data = y_vec.to_a
  
  if x_data.include?(x)
    ind = x_data.index { |val| val == x }
    return y_data[ind]
  elsif x > x_data[0] && x < x_data[-1]
    ind = x_data.index { |val| x < val }
    slope = (y_data[ind] - y_data[ind-1]) / (x_data[ind] - x_data[ind-1]) 
    return y_data[ind-1] + slope * (x - x_data[ind-1])
  elsif x < x_data[0]
     slope = (y_data[1] - y_data[0]) / (x_data[1] - x_data[0])
     return y_data[0] + slope * (x - x_data[0])
   elsif x > x_data[-1]
     slope = (y_data[-1] - y_data[-2]) / (x_data[-1] - x_data[-2])
     return y_data[-1] + slope * (x - x_data[-1])
   else
     raise 'Unknown error'
  end
end

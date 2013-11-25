class MainPageController < ApplicationController
  def index
    @reservoir = Reservoir.first
    p @reservoir
    @temperatures = @reservoir.read_temperatures
  end
end

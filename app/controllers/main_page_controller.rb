class MainPageController < ApplicationController
  def index
    @temperatures = Reservoir.first.read_temperatures
  end
end

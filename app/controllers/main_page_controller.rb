class MainPageController < ApplicationController
  def index
    @reservoir = Reservoir.find_by_name('main_reservoir')
    @temperatures = @reservoir.read_temperatures
  end
end

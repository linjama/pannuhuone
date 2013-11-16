class AddTemperatureToTemperatureSensor < ActiveRecord::Migration
  def change
    add_column :temperature_sensors, :temperature, :decimal, { precision: 5, scale: 1 }
  end
end

class AddNameToTemperatureSensor < ActiveRecord::Migration
  def change
    add_column :temperature_sensors, :name, :string
  end
end

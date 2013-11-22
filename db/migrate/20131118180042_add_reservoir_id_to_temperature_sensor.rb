class AddReservoirIdToTemperatureSensor < ActiveRecord::Migration
  def change
    add_column :temperature_sensors, :reservoir_id, :integer
  end
end

class CreateTemperatureSensors < ActiveRecord::Migration
  def change
    create_table :temperature_sensors do |t|

      t.timestamps
    end
  end
end

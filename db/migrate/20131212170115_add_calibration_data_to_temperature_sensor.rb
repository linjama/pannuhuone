class AddCalibrationDataToTemperatureSensor < ActiveRecord::Migration
  def change
    add_column :temperature_sensors, :calibration_data, :text
  end
end

module ApplicationHelper
  def kWh_display(kWh_value)
    number_with_precision(kWh_value, precision: 1)
  end
end

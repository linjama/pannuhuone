module ApplicationHelper
  
  # Displays kWh value in specific format
  def kWh_display(kWh_value)
    if kWh_value < 100
      number_with_precision(kWh_value, precision: 1)
    else
      number_with_precision(kWh_value, precision: 0)
    end
  end
  
  # Evaluates the value of constant from dimensions.css.scss
  def dimensions_reader(str)
    File.open(%Q(#{Rails.root}/app/assets/stylesheets/dimensions.css.scss)) do |file|
      while line = file.gets
        if line.start_with?("$")
          var, foo, val = line.partition(':')
          var = var.strip[1..-1]  # remove $ at the beginning
          val = val.strip[0..-2]  # Remove ; at the end
          
          return val if var == str
        end
      end
    end
    return nil
  end
  
end

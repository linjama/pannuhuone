module MainPageHelper
  
  def svg_tag_options
    section_height = dimensions_reader("content-height").to_i
    section_width = dimensions_reader("section-width").to_i
        
    opts = { 
      height: section_height.to_s.html_safe ,
      width: section_width.to_s.html_safe 
    }
  end
  
  def options_for_bar_displays
    section_height = svg_tag_options[:height].to_i
    section_width = svg_tag_options[:width].to_i 
    section_padding = dimensions_reader("section-padding").to_i
    bar_width = (section_width - 2 * section_padding).floor
    
    remaining_hot_water = @reservoir.remaining_capacity_for_hot_water
    max_hot_water = @reservoir.maximum_capacity_for_hot_water
    hot_water_bar_height = (section_height * remaining_hot_water / max_hot_water).ceil
    
    remaining_heating = @reservoir.remaining_capacity_for_heating
    max_heating = @reservoir.maximum_capacity_for_heating
    heating_bar_height = (section_height * remaining_heating / max_heating).ceil
    
            
    opts =  {
      hot_water: {
        x: section_padding.to_s.html_safe ,
        y: (section_height - hot_water_bar_height).to_s.html_safe ,
        width: bar_width.to_s.html_safe ,
        height: hot_water_bar_height.to_s.html_safe ,
        fill: "green".html_safe
      } ,
      heating: {
        x: section_padding.to_s.html_safe ,
        y: (section_height - heating_bar_height).to_s.html_safe ,
        width: bar_width.to_s.html_safe ,
        height: heating_bar_height.to_s.html_safe ,
        fill: "green".html_safe
      }
    }
  end
  
end

module MainPageHelper
  
  def svg_tag_options(id=nil)
    section_height = dimensions_reader("content-height").to_i
    section_width = dimensions_reader("section-width").to_i
    section_padding = dimensions_reader("section-padding").to_i 
        
    opts = {
      id: id , 
      height: section_height.to_s.html_safe ,
      width: (section_width - 2*section_padding).to_s.html_safe 
    }
  end
  
  def options_for_bar_displays
    text_offset = 5
    section_height = svg_tag_options[:height].to_i
    bar_width = svg_tag_options[:width].to_i 
    
    hot_water_bar_height = ( 
      section_height * @reservoir.remaining_capacity_for_hot_water(relative=true)
      ).ceil
    
    heating_bar_height = (
      section_height * @reservoir.remaining_capacity_for_heating(relative=true)
      ).ceil
    
    opts =  {
      hot_water: {
        x: "0".html_safe ,
        y: (section_height - hot_water_bar_height).to_s.html_safe ,
        width: bar_width.to_s.html_safe ,
        height: hot_water_bar_height.to_s.html_safe ,
        fill: "green".html_safe
      },
      
      hot_water_text: {
        x: text_offset.to_s.html_safe ,
        y: (section_height - hot_water_bar_height - text_offset).to_s.html_safe
      },
      
      heating: {
        x: "0".html_safe ,
        y: (section_height - heating_bar_height).to_s.html_safe ,
        width: bar_width.to_s.html_safe ,
        height: heating_bar_height.to_s.html_safe ,
        fill: "green".html_safe
      },
      
      heating_text: {
        x: text_offset.to_s.html_safe ,
        y: (section_height - heating_bar_height - text_offset).to_s.html_safe
      },
    }
  end
  
end

module MainPageHelper
  
  def options_for_hot_water_display
    remaining_hot_water = @reservoir.remaining_capacity_for_hot_water
    max_hot_water = @reservoir.maximum_capacity_for_hot_water
    full_heigth = dimensions_reader("content-heigth").strip[0..-3].to_f
    
    opts = {
      height: (full_heigth*remaining_hot_water/max_hot_water).ceil.to_s+"px" , 
      id: "hot_water_display_bar"
    }
    #options[:width] = dimensions_reader("hot-water-bar-width")
  end
  
end

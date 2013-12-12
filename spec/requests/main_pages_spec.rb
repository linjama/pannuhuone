require 'spec_helper'

describe "Main Page" do
  let!(:reservoir) { FactoryGirl.create(:reservoir) }   
  before(:each) { visit 'main_page/index' }
   
  describe "when I visit in the index page" do
    
    it "have content 'Temp.'" do
      page.should have_content 'Temp.'
    end
    
    it "displays all temperature values" do
      reservoir.read_temperatures.each do |t|
        page.should have_content(t.to_s)
      end
    end
    
    it "has content 'Hot Water'" do
      page.should have_content 'Hot Water' 
    end
    
    it "displays remaining hot water as a number" do
      remaining_hot_water = reservoir.remaining_capacity_for_hot_water
      page.should have_content kWh_display(remaining_hot_water)
    end
    
    it "have content 'Heating'" do
      page.should have_content 'Heating'
    end
    
    it "displays remaining heating capacity as a number" do
      page.should have_content kWh_display(reservoir.remaining_capacity_for_heating)
    end
    
    describe "Hot water display bar" do
      
      before(:each) do
        @hot_water_bar = page.find('svg#hot_water_display_bar').find('rect')
        @section_height = dimensions_reader("content-height").to_i
        @section_width = dimensions_reader("section-width").to_i
        @section_padding = dimensions_reader("section-padding").to_i 
      end
      
      specify "The width of the bar is section width - 2 x padding" do
        actual_width = @hot_water_bar[:width]
        expected_width = (@section_width - 2 * @section_padding).to_s
        actual_width.should eq expected_width
      end
      
      specify "The height of the bar is correct" do
        actual_height = @hot_water_bar[:height]
        expected_height = (
          @section_height*reservoir.remaining_capacity_for_hot_water(relative = true)
          ).ceil.to_s
        actual_height.should eq expected_height
      end
    end
      
    describe "Hot water display bar" do
      
      before(:each) do
        @heating_bar = page.find('svg#heating_display_bar').find('rect')
        @section_height = dimensions_reader("content-height").to_i
        @section_width = dimensions_reader("section-width").to_i
        @section_padding = dimensions_reader("section-padding").to_i 
      end
      
      specify "The width of the bar is section width - 2 x padding" do
        actual_width = @heating_bar[:width]
        expected_width = (@section_width - 2 * @section_padding).to_s
        actual_width.should eq expected_width
      end
      
      specify "The height of the bar is correct" do
        actual_height = @heating_bar[:height]
        expected_height = (
          @section_height*reservoir.remaining_capacity_for_heating(relative = true)
          ).ceil.to_s
        actual_height.should eq expected_height
      end
       
    end
    
    
    
  end
end

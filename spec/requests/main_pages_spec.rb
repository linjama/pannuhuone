require 'spec_helper'

describe "Main Page" do
  let!(:reservoir) { FactoryGirl.create(:reservoir) }   
  before(:each) { visit 'main_page/index' }
   
  describe "when I visit in the index page" do
    
    it "have content 'Temperatures'" do
      page.should have_content 'Temperatures'
    end
    
    it "displays all temperature values" do
      reservoir.read_temperatures.each do |t|
        page.should have_content(t.to_s)
      end
    end
    
    it "have content 'Hot water'" do
      page.should have_content 'Hot water' 
    end
    
    it "displays remaining hot water as a number" do
      remaining_hot_water = reservoir.remaining_capacity_for_hot_water
      page.should have_content kWh_display(remaining_hot_water)
    end
    
    it "displays remaining hot water as a bar" do
     page.should have_selector 'div#hot_water_display_bar'
     bar = page.find('div#hot_water_display_bar')
     remaining_hot_water = reservoir.remaining_capacity_for_hot_water
     max_hot_water = reservoir.maximum_capacity_for_hot_water
     full_heigth = dimensions_reader("content-heigth").strip[0..-3].to_f
     bar[:height].should eq((full_heigth*remaining_hot_water/max_hot_water).floor)
    end
    
    it "have content 'Heating'" do
      page.should have_content 'Heating'
    end
    
    it "displays remaining heating capacity as a number" do
      remaining_heating = reservoir.remaining_capacity_for_heating
      page.should have_content kWh_display(remaining_heating)
    end
    
  end
end

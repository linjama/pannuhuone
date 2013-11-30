require 'spec_helper'

describe "Main Page" do
  let!(:reservoir) { FactoryGirl.create(:reservoir) }   
  before(:each) { visit 'main_page/index' }
   
  describe "when I visit in the index page" do
    
    it "have content 'Temperatures'" do
      expect(page).to have_content('Temperatures')
    end
    
    it "displays all temperature values" do
      reservoir.read_temperatures.each do |t|
        expect(page).to have_content(t.to_s)
      end
    end
    
    it "have content 'Hot water'" do
      expect(page).to have_content('Hot water')
    end
    
    it "displays remaining hot water" do
      remaining_hot_water = reservoir.remaining_capacity_for_hot_water
      expect(page).to have_content kWh_display(remaining_hot_water)
    end
    
    it "have content 'Heating'" do
      expect(page).to have_content('Heating')
    end
    
    it "displays remaining heating capacity" do
      remaining_heating = reservoir.remaining_capacity_for_heating
      expect(page).to have_content kWh_display(remaining_heating)
    end
    
  end
end

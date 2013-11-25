require 'spec_helper'

describe "Main Page" do
  before(:each) { visit 'main_page/index' }
  let(:reservoir) { FactoryGirl.create(:reservoir) }
 
  describe "GET /main_page/index" do
    it "have content 'Temperatures'" do
      expect(page).to have_content('Temperatures')
    end
    
    it "displays all temperature values" do
      reservoir.read_temperatures.each do |t|
        expect(page).to have_content(t.to_s)
      end
    end
    
  end
end

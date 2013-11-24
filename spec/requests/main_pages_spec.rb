require 'spec_helper'

describe "Main Page" do
  describe "GET /main_pages" do
    it "Should have content 'Temperatures'" do
      visit '/main_pages/home'
      expect(page).to have_content('Temperatures')
    end
  end
end

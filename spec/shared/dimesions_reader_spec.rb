require 'spec_helper'

describe "Dimension Reader" do
  describe "when called with invalid argument" do
    it "returns nil" do
      dimensions_reader('Wibble').should be_nil
    end
  end
  
  describe "when called with valid argument" do
    it "returns corresponding value" do
      dimensions_reader('lumia800-screen-width').should eq '480px'
    end
  end
  
  describe "when called with incomplete argument" do
    it "returns nil" do
      dimensions_reader('lumia800-screen').should be_nil
    end
  end
  
  describe " when its 'to_i' method is called with valid argument" do
    it "returns integer value" do
      dimensions_reader('lumia800-screen-width').to_i.should eq 480
    end
  end
  
end

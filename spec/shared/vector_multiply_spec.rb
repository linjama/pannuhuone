require 'spec_helper'
require 'vector_math_helper'


describe "vector multiply" do

  let(:scalar1) { 2.0 }
  let(:scalar2) { 7.0 }
  let(:vector1) { [1.0, 2.0, 3.0] }
  let(:vector2) { [2.0, 3.0, -4.0] }

  context "when both are scalar" do
    it "returns product of inputs" do
      expect(vector_multiply(scalar1, scalar2)).to eq scalar1*scalar2
    end
  end
  
  context "when both are vectors with the same length" do
    it "returns elementwise product like Matlab's .* operator" do
      expect(vector_multiply(vector1, vector2)).to eq [2.0, 6.0, -12.0]
    end
  end
  
  context "when one is scalar and another is vector" do
    it "returns vector in which each elemenet is multiplied by the scalar" do
      expect(vector_multiply(scalar2, vector1)).to eq [7.0, 14.0, 21.0]
      expect(vector_multiply(vector1, scalar2)).to eq [7.0, 14.0, 21.0]
    end
  end
  
end

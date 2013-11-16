require 'spec_helper'
require 'vector_math_helper'


describe "vector multiply" do

  let(:scalar1) { 2.0 }
  let(:scalar2) { 7.0 }
  let(:vector1) { Vector[1.0, 2.0, 3.0] }
  let(:vector2) { Vector[2.0, 3.0, -4.0] }
  let(:vector_with_wrong_length) { Vector[1.0, 2.0] }
  
  context "when one is scalar and another is vector" do
    it "returns vector in which each elemenet is multiplied by the scalar" do
      (scalar2*vector1).should eq Vector[7.0, 14.0, 21.0]
      (vector1*scalar2).should eq Vector[7.0, 14.0, 21.0]
    end
  end
  
  context "vector_to_diagonal_matrix helper is called with vector" do
    it "returns diagonal matrix with vector's elements at diagonal" do
      vector_to_diagonal_matrix(vector1).should eq Matrix.diagonal(1.0, 2.0, 3.0)
    end
  end
  
  
  context "when both are vectors with the same length" do
    it "returns elementwise product like Matlab's .* operator" do
      vector_multiply(vector1, vector2).should eq Vector[2.0, 6.0, -12.0]
    end
  end
  
  context "when vectors have different lengths" do
    it "shows error message containing 'dimension mismatch'" do
      
      expect { vector_multiply(vector1, vector_with_wrong_length) }.to(
        raise_error(/dimension mismatch/)
      )
      
    end
  end
  
  context "it should not use integer arithmetic for rationals" do
    specify "when element is rational number" do
      vector_multiply([1/7, 1, 1], vector1).should eq Vector[1.0/7.0, 2.0, 3.0]
    end
  end
  
  context "when input is not numeric" do
    xit "shows error message containing 'must be numeric'" do
      
      expect { vector_multiply(vector1, 'a') }.to(
        raise_error(/must be numeric/)
      )
      
      expect { vector_multiply(vector1, '7.3') }.not_to(
        raise_error(/must be numeric/)
      )
      
      expect { vector_multiply(vector1, 'wibble') }.to(
        raise_error(/must be numeric/)
      )
      
      expect { vector_multiply(vector1, [1.0, 2.0, 'wibble']) }.to(
        raise_error(/must be numeric/)
      )
      
    end
  end
  
end

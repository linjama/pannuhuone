require 'spec_helper'
require 'vector_math_helper'


describe "sum vector and scalar" do
  let(:scalar) { 2.0 }
  let(:vector) { Vector[1.0, 2.0, 3.0] }
  
  it "adds the scalar to all elements of the vector" do
    add_scalar_to_vector(vector, scalar).should eq Vector[3.0, 4.0, 5.0]
  end
  
end

describe "vector diff" do
  let(:vector) { Vector[1, 2, 4] }  
  it "returns difference of elements" do
    diff(vector).should eq(Vector[1, 2])
  end 
  
end

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
  
  context "when input is nil of false" do
    it "shows error message containing 'nil'" do
      
      expect { vector_multiply(vector1, nil) }.to(
        raise_error(/nil/)
      )
      
      expect { vector_multiply(vector1, false) }.to(
        raise_error(/nil/)
      )
      
    end
  end
  
end

# Function to multiply two vectors of the same size


require 'mathn'
require 'matrix'

def vector_multiply(vec1, vec2)
  if vec1 && vec2
    vector_to_diagonal_matrix(vec1) * vec2
  else
    raise "'nil' or 'false' is not allowed as input!"
  end
end

def vector_to_diagonal_matrix(vec)
  Matrix.build(vec.count) do |row, col|
    if row == col
      vec[row]
    else
      0
    end
  end
end
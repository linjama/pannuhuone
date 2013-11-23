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

def add_scalar_to_vector(vec, scalar)
  scalar_expanded_to_column_matrix = Matrix.build(vec.size,1) { scalar }
  vec+scalar_expanded_to_column_matrix.column(0)
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
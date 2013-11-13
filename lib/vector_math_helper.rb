def vector_multiply(in1, in2)
  #Conversion scalars to array
  vec1 = [in1].flatten
  vec2 = [in2].flatten
  
  length_of_vec1 = vec1.length
  length_of_vec2 = vec2.length
  
  if length_of_vec1 == 0 || length_of_vec2 == 0
    raise 'Inputs must be scalars or arrays'
  elsif length_of_vec1 > 1 && length_of_vec2 > 1 && 
        length_of_vec1 != length_of_vec2
    raise 'Inputs must have same length or one of them must be scalar'
  elsif length_of_vec1 == 1 && vec2.length == 1
    vec1[0]*vec2[0]
  elsif length_of_vec1 == 1
    vec2.collect { |item| vec1[0]*item }
  elsif length_of_vec2 == 1
    vec1.collect { |item| vec2[0]*item }
  else
    (0..length_of_vec1-1).collect { |i| vec1[i]*vec2[i] }    
  end
end

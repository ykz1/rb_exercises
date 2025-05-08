def find_first_nonzero_among(numbers)
  numbers.each do |n|
    return n if n.nonzero?
  end
end

# Examples

# find_first_nonzero_among(0, 0, 1, 0, 2, 0)
# find_first_nonzero_among(1)

# Line 9 error raised: wrong number of arguments. We pass 6 integers to our method, which only expects one array element as an argument

# Line 10 error raised: wrong type of element passed; we pass an integer to our method, which only expects on array element as an argument. 
# The problem happens on line 2 when we try to call .each on an integer because .each is an array method

# Fixes for both of these would be to pass our values as arrays, see below for execution:

p find_first_nonzero_among([0, 0, 1, 0, 2, 0])
p find_first_nonzero_among([1])
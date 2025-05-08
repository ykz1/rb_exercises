numbers = [5, 2, 9, 6, 3, 1, 8]

even_numbers = numbers.map do |n|
  n if n.even?
end

p even_numbers # expected output: [2, 6, 8]


# The logical error is: the element is returned to be mapped if it is even, but our if statement does not specify what to do if it is not even and therefore nil is returned for each non-even element.
# We can solve this in two ways:

# 1. The simplest solution would be to use select instead of map:
p numbers.select { |x| x.even? }

# 2. If we're intent on using map, we can iterate through each element of numbers and only push the element into our new array if the element is even:
even_numbers2 = []
numbers.map do |x|
  even_numbers2 << x if x.even?
end

p even_numbers2
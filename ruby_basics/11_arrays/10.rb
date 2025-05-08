array1 = [1, 5, 9]
array2 = [1, 9, 5]

p array1 == array2

puts "They are false, because order matters in arrays"

puts
puts "However, if we created a 3rd array that held the same values as array1 in the same sequence, then this new array would be equal to array1"

array3 = [1, 5, 9]
p array1 == array3

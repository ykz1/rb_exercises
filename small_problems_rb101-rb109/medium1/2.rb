def rotate_array2(arr)
  arr[1..-1] + [arr[0]]
end

# Initial solution:
def rotate_rightmost_digits(num, digits)
  arr = num.digits.reverse
  (arr[0..(-digits-1)] << rotate_array2(arr[-digits..-1])).flatten.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

# Alternate solution:
def rotate_rightmost_digits2(num, digits)
  arr = num.digits.reverse
  arr[-digits..-1] = rotate_array2(arr[-digits..-1])
  arr.join.to_i
end

puts

p rotate_rightmost_digits2(735291, 1) == 735291
p rotate_rightmost_digits2(735291, 2) == 735219
p rotate_rightmost_digits2(735291, 3) == 735912
p rotate_rightmost_digits2(735291, 4) == 732915
p rotate_rightmost_digits2(735291, 5) == 752913
p rotate_rightmost_digits2(735291, 6) == 352917
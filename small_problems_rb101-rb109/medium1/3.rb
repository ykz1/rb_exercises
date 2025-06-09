def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(num, digits)
  arr = num.digits.reverse
  arr[-digits..-1] = rotate_array(arr[-digits..-1])
  arr.join.to_i
end

def max_rotation(num)
  num.digits.size.downto(1) { |digits| num = rotate_rightmost_digits(num, digits) }
  num
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

# Further exploration:
def max_rotation2(num)
  arr = num.digits.reverse
  arr.size.downto(2) do |digits|
    arr[-digits..-1] = arr[(-digits + 1)..-1] + [arr[-digits]]
  end
  arr.join.to_i
end

puts
p max_rotation2(735291) == 321579
p max_rotation2(3) == 3
p max_rotation2(35) == 53
p max_rotation2(105) == 15 # the leading zero gets dropped
p max_rotation2(8_703_529_146) == 7_321_609_845
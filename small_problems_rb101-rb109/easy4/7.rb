HEX_TO_NUM = {
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
  'A' => 10,
  'B' => 11,
  'C' => 12,
  'D' => 13,
  'E' => 14,
  'F' => 15,
}

# Main solution:
def string_to_integer(str)
  num = 0
  str.chars.each do |char|
    num *= 10
    num += ('1'..char).count
  end
  num
end

# Alternate solution with #inject:
def string_to_integer_2(str)
  str.chars.inject(0) do |num, char|
    num *= 10
    num += ('1'..char).count
  end
end

# Alternate solution with one-line #inject:
def string_to_integer_3(str)
  str.chars.inject(0) { |num, char| num = num * 10 + ('1'..char).count}
end

# Solution to further exploration i.e. hex conversion:
def hexadecimal_to_integer(hex)

  num = 0 
  hex.upcase.chars.reverse.each_with_index { |char, i| num += (HEX_TO_NUM[char] * 16**i )}
  num
end

# Re-written original solution in similar fomat to hex solution:
def string_to_integer_4(str)
  num = 0
  str.chars.reverse.each_with_index { |char, i| num += ('1'..char).count * 10**i}
  num
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

puts 

p string_to_integer_2('4321') == 4321
p string_to_integer_2('570') == 570

puts 

p string_to_integer_3('4321') == 4321
p string_to_integer_3('570') == 570

puts

p hexadecimal_to_integer('4D9f') == 19871

puts 

p string_to_integer_4('4321') == 4321
p string_to_integer_4('570') == 570

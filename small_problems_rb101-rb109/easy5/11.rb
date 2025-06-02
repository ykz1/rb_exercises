def digit_list(int)
  int.digits.reverse
end

def digit_list_2(int)
  output = []
  while int > 0
    int, remainder = int.divmod(10)
    output.prepend(remainder)
  end
  output
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

puts

p digit_list_2(12345) == [1, 2, 3, 4, 5]     # => true
p digit_list_2(7) == [7]                     # => true
p digit_list_2(375290) == [3, 7, 5, 2, 9, 0] # => true
p digit_list_2(444) == [4, 4, 4]             # => true

# Refactor second solution to handle 0
def digit_list_3(int)
  return [0] if int == 0
  output = []
  while int > 0
    int, remainder = int.divmod(10)
    output.prepend(remainder)
  end
  output
end

puts

p digit_list_3(12345) == [1, 2, 3, 4, 5]     # => true
p digit_list_3(7) == [7]                     # => true
p digit_list_3(375290) == [3, 7, 5, 2, 9, 0] # => true
p digit_list_3(444) == [4, 4, 4]             # => true
p digit_list_3(0) == [0]
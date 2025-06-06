def leading_substrings(str)
  output = []
  str.length.times { |i| output << str[0..i] }
  output
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']


# Alternate one-line solution below:

def leading_substrings2(str)
  (0..(str.length - 1)).map { |i| str[0..i] }
end

puts

p leading_substrings2('abc') == ['a', 'ab', 'abc']
p leading_substrings2('a') == ['a']
p leading_substrings2('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

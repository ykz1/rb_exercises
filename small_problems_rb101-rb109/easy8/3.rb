def substrings(str)
  output = []
  str.length.times do |i|
    (str.length - i).times do |j|
      output << str[i..(i + j)]
    end
  end
  output
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

# Alternate solution below using map:
def substrings2(str)
  (0..(str.length - 1)).map do |i|
    (0..(str.length - i - 1)).map do |j|
      str[i..(i + j)]
    end
  end.flatten
end

p substrings2('abcde')

p substrings2('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

# Refactored solution:
def substrings3(str)
  (0..(str.length - 1)).each_with_object([]) do |start_index, result|
    (0..(str.length - start_index - 1)).each do |length|
      result << str[start_index..(start_index + length)]
    end
  end
end

p substrings3('abcde')

p substrings3('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

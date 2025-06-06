# Notes from problem statement:
# 1. Return array of substrings of a string which are palindromic
# 2. Order of substrings in same sequence as they appear in the string, left to right
# 3. Do not remove duplicates
# 4. Use #substrings method from previous exercise
# 5. Case sensitive
# 6. Don't ignore non-alphabetical characters
# 7. Ignore single characters substrings

def substrings(str)
  str.length.times.with_object([]) do |i, output|
    (str.length - i).times do |j|
      output << str[i..(i + j)]
    end
  end
end

# Commented out below: test case for #substrings method
# p substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

# Main method to return array of palindromic substrings below:
def palindromes(str)
  substrings(str).select { |sub_str| palindromic?(sub_str) }
end

# Separate method below to check whether a specific string is palindromic:
def palindromic?(str)
  (str.length > 1) && (str == str.reverse)  # Placing length > 1 check first because it should be the more memory-efficient expression, and added brackets for readability
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# Further exploration below: there are several places we can alter code to ignore case and non-alphabetical characters. The most efficient would be to ignore it at the earliest step—when we create our substrings:

def substrings2(str, ignore_case_and_nonalphas=true)
  str = str.downcase.gsub(/\W/,'') if ignore_case_and_nonalphas

  str.length.times.with_object([]) do |i, output|
    (str.length - i).times do |j|
      output << str[i..(i + j)]
    end
  end
end

def palindromes2(str)
  substrings2(str).select { |sub_str| palindromic?(sub_str) }
end

puts

p palindromes2('abcd') == []
p palindromes2('madam') == ['madam', 'ada']
p palindromes2('hello-madam-did-madam-goodbye') #== [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
p palindromes2('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

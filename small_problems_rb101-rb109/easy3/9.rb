def palindrome?(arg)
  (arg.size / 2).times do |index|
  return false unless arg[index] == arg[-index - 1]
  end
  true
end

def real_palindrome?(arg)
  stripped_arg = arg.downcase.gsub(/[^a-z0-9]/,'')
  palindrome?(stripped_arg)
end

def palindromic_number?(number)
  palindrome?(number.to_s)
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

# Further exploration: if our number begins with one or more 0s, it will be read as an octal number instead. There is not a simple way to handle all possible cases:
# Case 1: neither the octal number passed nor its decimal representation are palindromic: e.g. octal 0123 is decimal 83
# Case 2: both the octal number passed and its decimal representation are palindromic: not sure if any of these exist
# Case 3: the octal number passed is a palindrome but its decimal representation is not: e.g. octal 0110 is decimal 72
# Case 4: the octal number passed is not palindromic but its decimal representation is: e.g. octal 0171 is decimal 121

# For cases 1 and 2, we can always return the correct answer. However, we cannot know for sure which case we're in between 3 and 4 because Ruby will interpret an octal number as decimal before evaluating it. 

# Therefore, the only way to handle octals is with an additional parameter:

def palindromic_number2?(number, octal=false)
  octal ? palindrome?(number.to_s(8).insert(0, '0')) : palindrome?(number.to_s)
end

puts
p palindromic_number2?(01233210) == false # octal 01233210 is decimal 341640, which is not palindromic
p palindromic_number2?(01233210, true) == true
def palindrome?(arg)
  (arg.size / 2).times do |index|
    return false unless arg[index] == arg[-index - 1]
  end
  true
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

# Additional test cases below for arrays:
puts
p palindrome?(['madam', "i'm", 'madam']) == true
p palindrome?(['madam', 'I am', 'not', 'madam']) == false
p palindrome?(['madam', 'I am', 'I am', 'madam']) == true
p palindrome?([]) == true
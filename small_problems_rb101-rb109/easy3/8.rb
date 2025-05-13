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

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
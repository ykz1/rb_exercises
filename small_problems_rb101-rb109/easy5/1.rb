def ascii_value(str)
  str.chars.sum { |char| char.ord }
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0


# Further exploration answer below: whereas #ord gives the ASCII number for a character, #chr does the opposite and returns the character associated with a given ASCII number.

def ascii_value_further_explore(str)
  str.chars.each do |char|
    p char.ord.chr == char # This will always print true.
  end
end

puts

ascii_value_further_explore('Four score')
ascii_value_further_explore('Launch School')
ascii_value_further_explore('a')
ascii_value_further_explore('')
# Regex solution
def crunch(str)
  str.gsub(/(.)\1+/, '\1')
end

# Non-regex solution
def crunch_2(str)
  temp_char = ''
  str.chars.map { |char| char == temp_char ? '' : temp_char = char }.join
end

# Alternate regex solution with a named capture
def crunch_3(str)
  str.gsub(/(?<char>.)\k<char>+/,'\k<char>')
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

puts

p crunch_2('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch_2('4444abcabccba') == '4abcabcba'
p crunch_2('ggggggggggggggg') == 'g'
p crunch_2('a') == 'a'
p crunch_2('') == ''

puts

p crunch_3('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch_3('4444abcabccba') == '4abcabcba'
p crunch_3('ggggggggggggggg') == 'g'
p crunch_3('a') == 'a'
p crunch_3('') == ''
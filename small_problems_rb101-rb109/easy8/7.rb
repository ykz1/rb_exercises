# Regex explanation: 
# - (?i) means ignore case
# - [a-z] captures all alphabets
# - &&[^aeiou] adds an additional condition to ignore vowels
# - Note that we can also use [b-z&&[^eiou]] excluding the a but it would be harder to read
# Added brackets around our ternary if statement to make it more readable 
def double_consonants(str)
  str.chars.map{ |char| (char.match?(/(?i)[a-z&&[^aeiou]]/)) ? (char * 2) : char }.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
=begin 

Start:  3:35p
Finish: 4:01p

Requirements:
- Input:      string
- Output:     hash
- Operation:  from given string, find: 1) percentage of characters that are lowercase; 2) percentage that are uppercase; and 3) percentage of characters that are neither

Solution overview:
- Convert string to array of characters
- Iterate character-by-character
- With each character, +1 to accumulator for our three categories if A-Z, a-z, or neither. Can use case statement for this. Accumulator could be output hash with 3 keys with starting values of 0
- Convert accumulators to percentages, with 100 being 100%, and to one decimal point

Assumptions:
- String given will contain at least one character
- Output percentages to be given as float with one decimal point

=end
def letter_percentages(str)
  chars = str.chars
  output = {
    lowercase: 0,
    uppercase: 0,
    neither: 0
  }
  chars.each do |char|
    case char
    when 'a'..'z' then output[:lowercase] += 1
    when 'A'..'Z' then output[:uppercase] += 1
    else output[:neither] += 1
    end
  end
  output.each_pair { |k, v| output[k] = v / chars.size.to_f * 100 }
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

# Refactor below with more efficient solution:
def letter_percentages2(str)
  total_chars = str.length.to_f
  output = {}
  output[:lowercase] = (str.count('a-z') / total_chars) * 100
  output[:uppercase] = (str.count('A-Z') / total_chars) * 100
  output[:neither] = 100.0 - output[:lowercase] - output[:uppercase]
  output
end

puts
p letter_percentages2('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages2('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages2('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
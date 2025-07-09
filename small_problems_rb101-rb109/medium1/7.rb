# Requirement:
# - Input: string
# - Output: string
# - Replace specific substrings with numbers
# - Assume: input will be split by space, i.e. 'zerozero' will come out as 'zerozero' and not '00' or '0 0'
# - Assume: output will be separated by space as well

# Test cases: provided below

# Data / algorithm:
# - Need to convert string to array to iterate through
# - Transformation, so probably want to use #map to iterate
# - Within block passed to #map, change specified keywords into numbers
# - Convert array returned by #map into string to be returned by our method

# - Alternatively to above, can also use #gsub to replace words within string:
# - 10 times, use #gsub to replace written numbers into their integer counterparts

NUMBERS = %w[zero one two three four five six seven eight nine]

def word_to_digit(str)
  NUMBERS.each_with_index do |word, number|
    str = str.gsub(/(?i)\b#{word}\b/, number.to_s)
  end
  str
end

def word_to_digit_no_spaces(str)
  arr = str.split
  counter = 0
  output = []
  substring = ''
  save_to_substring = false

  until counter == arr.size
    if arr[counter] == word_to_digit(arr[counter])
      if save_to_substring == true
        output << format_phone(substring)
        substring = ''
        save_to_substring = false
      end
      output << arr[counter]
    else
      save_to_substring = true
      substring << word_to_digit(arr[counter])
    end
    counter += 1
    output << format_phone(substring) if counter == arr.size
  end
  output.join(' ')
end

def format_phone(numstring)
  numstring.gsub(/\b(\d{3})(\d{3})(\d{4})\b/, '(\1) \2-\3') # 3 capture groups, capture 3, 3, then 4 digits within boundaries, to be replaced with formatted version of the same digits.
end

# p word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'
# p word_to_digit_no_spaces('Please call me at five five five one two three four. Thanks. 1 2 3 4') #== 'Please call me at 5 5 5 1 2 3 4. Thanks. 1 2 3 4'
p word_to_digit_no_spaces('Please call me at two zero two five five five one two three four. Thanks. 1 2 3 4') #== 'Please call me at 5 5 5 1 2 3 4. Thanks. 1 2 3 4'

# Further exploration:
# - handle upercase and capitalized word-numbers: done by adding `(?i)` to our regex term to match, this ignores case
# - remove space(s) between consecutive numbers: done with an until loop in #word_to_digit_no_spaces
# - Format 10 digit numbers as phone numbers: done with #format_phone method
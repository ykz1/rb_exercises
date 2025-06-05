def penultimate(str)
  str.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'


# Further exploration: handle one word and no word strings
def penultimate2(str)
  arr = str.split
  arr.size >= 2 ? arr[-2] : ''
end

p penultimate2('last word') == 'last'
p penultimate2('Launch School is great!') == 'is'
p penultimate2('one') == ''
p penultimate2('') == ''

# Further exploration: retrieve middle word. Edge cases:
# 1. empty string should return ''
# 2. one-word string should return the word
# 3. Strings with an even number of words should return ''

def middle_word(str)
  arr = str.split
  arr.size.even? ? '' : arr[(arr.size / 2.0).ceil - 1]
end

p middle_word('last word') == ''
p middle_word('Launch School is great!') == ''
p middle_word('one') == 'one'
p middle_word('') == ''
p middle_word('find middle word') == 'middle'
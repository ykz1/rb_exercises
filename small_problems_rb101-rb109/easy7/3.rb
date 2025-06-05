def word_cap(str)
  str.split.map(&:capitalize).join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Further exploration solutions below:

def word_cap2(str)
  str.split.map do |word|
    (word.length == 1) ? (word.upcase) : (word[0].upcase + word[1..-1].downcase)
  end.join(' ')
end

p word_cap2('four score and seven') == 'Four Score And Seven'
p word_cap2('the javaScript language') == 'The Javascript Language'
p word_cap2('this is a "quoted" word') == 'This Is A "quoted" Word'

def word_cap3(str)
  str.split.map do |word|
    word.chars.map.with_index { |char, i| (i == 0) ? char.upcase : char.downcase }.join
  end.join(' ')
end

p word_cap3('four score and seven') == 'Four Score And Seven'
p word_cap3('the javaScript language') == 'The Javascript Language'
p word_cap3('this is a "quoted" word') == 'This Is A "quoted" Word'

# Solution to initial exercise:

def print_in_box(text)
  puts '+-' + ('-' * text.length) + '-+'
  puts '| ' + (' ' * text.length) + ' |'
  puts '| ' + text + ' |'
  puts '| ' + (' ' * text.length) + ' |'
  puts '+-' + ('-' * text.length) + '-+'
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')


# Solution to Further Exploration:

def print_in_box2(text)
  text_limit = [76, text.length].min

  border_line = "+#{'-' * (text_limit + 2)}+"
  empty_line  = "|#{' ' * (text_limit + 2)}|"

  puts border_line
  puts empty_line

  # If statement to handle two scenarios: 1) when string passed fits on one line; and 2) when string passed requires multiple lines.
  if text.length <= 76
    puts "| #{text} |"
  else
    output_lines = text.scan(Regexp.new(".{1,#{text_limit}}"))    # Breaks up string passed into multiple lines in an array
    output_lines[-1] = output_lines[-1].center(text_limit)        # Pads and center-aligns the last element of our array to match our line length
    output_lines.each { |line| puts "| #{line} |" }               # Iterate through array of strings and prints them line-by-line
  end

  puts empty_line
  puts border_line
end

print_in_box2('To boldly go where no one has gone before.')
print_in_box2('')
print_in_box2('   ')
print_in_box2('Space: the final frontier. These are the voyages of the starship Enterprise. Its five-year mission: to explore strange new worlds; to seek out new life and new civilizations; to boldly go where no man has gone before!')


# Additionally, we can add to our program to 1) take user input on line limit; and 2) handle cases in which the last word on a line gets cut and continues on a new line.
# There are many rules in literature on how we do #2, but they generally include adding a hyphen to the end of the line, and breaking up words by syllable.
# I won't implement this but at a high level we will need to:
# 1. Break up the string argument into an array of words with #split
# 2. Iterate through our array of words, and print each line word-by-word. When we get to the last word, split that word into two chunks: one to be printed on the current line with a '-' appended, and the remainder to be printed on a new line
# 3. To further ensure we break up words by syllable, we would need to reference some kind of external API / library to help us figure out what a syllable is within each word
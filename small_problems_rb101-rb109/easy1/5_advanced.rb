def print_in_box3(text, line_limit=80)
  is_multiple_line = text.length > line_limit
  text_limit = [line_limit - 4, text.length].min

  border_line = "+#{'-' * (text_limit + 2)}+"
  empty_line  = "|#{' ' * (text_limit + 2)}|"

  puts border_line
  puts empty_line

  # If statement to handle two scenarios: 1) when string passed fits on one line; and 2) when string passed requires multiple lines.
  unless is_multiple_line
    puts "| #{text} |"
  else
    output_lines = wrap_text(text, text_limit)
    output_lines.each do |line|
      puts "| #{line.join(' ').center(text_limit)} |"
    end
  end

  puts empty_line
  puts border_line

end 

def wrap_text(text, text_limit)
  output_words = text.split   # Array to store words in our string
  output_lines = []           # Nested array of output lines
  output_line = []            # Array of words in a given line
  
  output_words.each_with_index do |word, index|
    if (output_line + [word]).join(' ').length <= text_limit            # Test whether appending word would create overflow
      output_line << word
    else
      output_lines << output_line
      output_line = [word]
    end
    output_lines << output_line if index == (output_words.length - 1)   # Adds the final line to our output nested array
  end
  output_lines
end

# Test cases below:
print_in_box3('To boldly go where no one has gone before.')
print_in_box3('')
print_in_box3('   ')
print_in_box3('Space: the final frontier. These are the voyages of the starship Enterprise. Its five-year mission: to explore strange new worlds; to seek out new life and new civilizations; to boldly go where no man has gone before!')
print_in_box3("Perhaps we'll never know how far the path can go, how much a human being can truly achieve, until we realize that the ultimate reward is not a gold medal but the path itself.")
print_in_box3('Space: the final frontier. These are the voyages of the starship Enterprise. Its five-year mission: to explore strange new worlds; to seek out new life and new civilizations; to boldly go where no man has gone before!', 30)
print_in_box3('', 10)
print_in_box3("Perhaps we'll never know how far the path can go, how much a human being can truly achieve, until we realize that the ultimate reward is not a gold medal but the path itself.", 100)


# Code below gives user ability to submit a quote and desired output box width:
=begin
puts "Paste in your quote:"
input = gets.chomp
puts
puts "How long do you want each line to be? (default 80)"
length = gets.chomp.to_i
puts
print_in_box3(input, length)
=end
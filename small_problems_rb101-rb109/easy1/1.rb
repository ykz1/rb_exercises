def repeat(string, number)
  if (string.is_a? String) && (number.is_a? Integer)
    number.times { puts string }
  else
    puts "Invalid arguments! Enter a string and an integer"
  end
end

repeat('Hello', 3)    # Print Hello 3 times
repeat(3, 'Hello')    # Invalid arguments message


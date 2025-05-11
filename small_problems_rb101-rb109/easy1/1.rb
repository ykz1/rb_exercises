def repeat(string, number)

  # line below will raise an actual exception 
  # raise ArgumentError, "Invalid arguments! Enter a string and a positive integer" unless (string.is_a? String) && (number.is_a? Integer) && (number > 0)

  if  (string.is_a? String) && (number.is_a? Integer) && (number > 0)
    number.times { puts string }
  else
    puts "Invalid arguments! Enter a string and a positive integer"
  end

end

repeat('Hello', 3)    # Print Hello 3 times
repeat(3, 'Hello')    # Invalid arguments message
repeat('Hello', -3)
# Solution for original exercise:

def stringy(digits)
  Array.new(digits) { |digit| 1 - digit % 2 }.join    # Could use .even? or .odd? for more readability but would be longer
end

# Adaption below for Further Exploration section:

def stringy2(digits, start=1)
  output = Array.new(digits) do |digit|           # Could do this in a one-line block but it would be hard to read
    (start == 1) ? (1 - digit % 2) : (digit % 2)  # Added parenthesis for readability
  end
  output.join
end

# Provided test cases:

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts stringy(1) == '1'    # Added a test case to make sure 1 digit also works


# Additional test cases for "Further Exploration" section—additional optional argument starting at 0:

puts
puts stringy2(6, 0) == '010101'
puts stringy2(9, 0) == '010101010'
puts stringy2(4, 0) == '0101'
puts stringy2(7, 0) == '0101010'
puts stringy2(1, 0) == '0'

# Finally, another lengthier implementation below using #times. Commented out and including for reference.

=begin
def stringy3(digits, start=1)
  
  output = ''                     # Initialize our output string variable
  start = start == 1              # Converts optional parameter to boolean to be used each loop below
  
  digits.times do |x|
    output += (start) ? (1 - x % 2).to_s : (x % 2).to_s
  end

  output

end
=end
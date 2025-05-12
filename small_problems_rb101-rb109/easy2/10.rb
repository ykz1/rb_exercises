def negative(number)
  number > 0 ? -number : number
end

# All test cases should return true
puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0      # There's no such thing as -0 in Ruby

def negative2(number)
  -(number.abs)            # This is superior; it says "return the negative of the absolute number" in a concise and clear manner.
end

puts negative2(5) == -5
puts negative2(-3) == -3
puts negative2(0) == 0      # There's no such thing as -0 in Ruby
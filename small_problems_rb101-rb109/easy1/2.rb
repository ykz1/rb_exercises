def is_odd?(number)

  # Validate argument passed
  unless number.is_a? Integer
    'Invalid entry! Please enter an integer.'
  else
  
    # Test oddness and return result; randomly choose between 2 methods: modulo and remainder
    if [true, false].sample
      # puts 'Modulo used'
      number % 2.abs == 1
    else
  
      # Calling abs() ensures our method works regardless of positive / negative argument
      # puts 'Remainder used'
      number.remainder(2).abs == 1
    end

  end

end


# Test cases below

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

puts is_odd?('a')   # => should return 'Invalid entry! Please enter an integer.'
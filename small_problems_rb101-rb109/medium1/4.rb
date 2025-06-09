# Initial solution below:
def switches(n)
  # Initiate an array to track all the switches starting in 'off' positions:
  arr = (1..n).map { |idx| [idx, 'off'] }

  # Iterate through rounds of flipping switches:
  (1..n).each do |multiple|
    
    # Set our index to the first switch to be flipped for each round:
    idx = (multiple - 1)

    # Iterate to flip switches until we reach the end of our array of switches:
    while idx <= (n - 1)
      # Call separate method to reverse 'on' and 'off' positions for flipped switches:
      arr[idx][1] = toggle(arr[idx][1])

      # Increment our index by the appropriate number for each round:
      idx += multiple
    end
  end

  # Select the switches which are turned 'on' and then return an array of only their switch numbers:
  arr.select { |(idx, status)| status == 'on' }.map { |(idx, status)| idx }

end

def toggle(switch)
  switch == 'on' ? 'off' : 'on'
end

p switches(5) == [1, 4]
p switches(10) == [1, 4, 9]
p switches(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]

# Refactored version below without a nested array to track switches:
def switches2(n)
  arr = ['off'] * n

  (1..n).each do |multiple|
    idx = multiple - 1
    while idx <= (n - 1)
      arr[idx] = toggle(arr[idx])
      idx += multiple
    end
  end

  arr.map.with_index { |status, idx| status == 'on' ? idx + 1 : nil }.compact
end

puts
p switches2(5) == [1, 4]
p switches2(10) == [1, 4, 9]
p switches2(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]

# Further exploration question 1: 
# When we have a starting position of 'off' combined and this ruleset for flipping switches, the switches that end in an 'on' state are the ones that are flipped an odd number of times. Each switch is flipped only on the round numbers which are factors of the switch number, so each switch's ending state is determined by its number of factors—specifically, only those with odd number of factors will end in an 'on' state (since our starting position is 'off'). Only perfect squares have an odd number of factors—this is because every number's factors are paired, and to have an odd number of factors, one of the pairs must be a factor and itself. See below for factors of numbers up to 10:
=begin
1: 1
2: 1, 2
3: 1, 3
4: 1, 2, 4
5: 1, 5
6: 1, 2, 3, 6
7: 1, 7
8: 1, 2, 4, 8
9: 1, 3, 9
10: 1, 2, 5, 10
=end
# This means that our method effectively finds the perfect squares up to a given number, and does the same thing as the method below:
def perfect_squares(n)
  i = 1
  output = []
  until i**2 > n
    output << i**2
    i += 1
  end
  output
end

puts
p perfect_squares(5) == [1, 4]
p perfect_squares(10) == [1, 4, 9]
p perfect_squares(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]

# Further exploration question 2:
# My original solution already uses an array to represent the lights. Below is an alternate solution which 1) uses a hash; and 2) finds the rounds on which each light is toggled, rather than finding the lights which are toggled each round. This should be a more efficient solution than my original solution.
def switches3(n)
  # Initialize our starting hash based on the number of lights given:
  hash = (1..n).to_h { |k| [k, 'off'] }

  # Iterate through each light:
  hash.each_key do |k|
    # For each light, find the round numbers on which they will be flipped:
    rounds_flipped = (1..k).select { |round| k % round == 0 }
    # Set the ending state to 'on' for a given light if they are flipped an odd number of times:
    hash[k] = 'on' if rounds_flipped.size.odd?
  end

  # Return the hash keys (i.e. light numbers) which end in an 'on' position:
  hash.select { |_, v| v == 'on' }.keys
end

puts
p switches3(5) == [1, 4]
p switches3(10) == [1, 4, 9]
p switches3(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]

# Further exploration question 3:
def format_output(n)
  on = switches3(n)
  off = (1..n).to_a - on
  str = ''

  case on.size
    when 0 then nil
    when 1 then str << "light #{on[0]} is on; "
    when 2 then str << "lights #{on[0]} and #{on[1]} are on; "
    else str << "lights #{on[0..-2].join(', ')}, and #{on[-1]} are on; "
  end

  case off.size
    when 0 then str.delete!(';').strip!
    when 1 then str << "light #{off[0]} is off"
    when 2 then str << "lights #{off[0]} and #{off[1]} are off"
    else str << "lights #{off[0..-2].join(', ')}, and #{off[-1]} are off"
  end

  str
end

puts
p format_output(1)
p format_output(2)
p format_output(3)
p format_output(4)
p format_output(5)
p format_output(10)
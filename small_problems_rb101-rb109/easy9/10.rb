def sum(num)
  num.digits.inject(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

# Alternate solution below that don't use #digits because it seems like taking a shortcut.
def sum2(num)
  num.to_s.chars.map(&:to_i).inject(:+)
end

puts sum2(23) == 5
puts sum2(496) == 19
puts sum2(123_456_789) == 45
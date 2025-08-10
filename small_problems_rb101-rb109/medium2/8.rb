def featured(num)
  num += 1
  num += 1 until num.odd? && num % 7 == 0
  loop do
    digits = num.digits
    return num if digits.size == digits.uniq.size
    num += 14
    return 'There is no possible number that fulfilles those requirements' if num > 9_999_999_999
  end
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

# p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
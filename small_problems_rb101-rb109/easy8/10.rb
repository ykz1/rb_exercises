def average(arr)
  arr.inject(:+) / arr.size
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# Further exploration:
def average_float(arr)
  arr.map(&:to_f).inject(:+) / arr.size
end

puts average_float([1, 6]) #== 3 # integer division: (1 + 6) / 2 -> 3
puts average_float([1, 5, 87, 45, 8, 8]) #== 25
puts average_float([9, 47, 23, 95, 16, 52]) #== 40
def sum_of_sums(arr)
  arr_size = arr.size
  sum = 0
  arr.each_with_index { |num, i| sum += num * (arr_size - i) }
  sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

# Alternate one-line solution:
def sum_of_sums2(arr)
  arr.map.with_index { |num, i| num * (arr.size - i) }.sum
end

p sum_of_sums2([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums2([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums2([4]) == 4
p sum_of_sums2([1, 2, 3, 4, 5]) == 35

def multisum(num)
  sum = 0
  (1..num).each do |x|
    sum += x if (x % 3 == 0) || (x % 5 == 0)
  end
  sum
end

# Re-written method below using #reduce. First filter for numbers which are divisible by 3 or 5, then add those numbers with #reduce
def multisum_reduce_1(num)
  arr = (1..num).select { |x| x % 3 == 0 || x % 5 == 0 }
  arr.reduce(:+)
end

# Re-factored #reduce method into one line by passing a block. Note that we now need to start our range at 0 to avoid 1 being added because of how #reduce works when passed a block.
def multisum_reduce_2(num)
  (0..num).reduce { |sum, x| ((x % 3 == 0) || (x % 5 == 0)) ? sum + x : sum }
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

puts

# Test cases for 1st reduce method
p multisum_reduce_1(3) == 3
p multisum_reduce_1(5) == 8
p multisum_reduce_1(10) == 33
p multisum_reduce_1(1000) == 234168

puts

# Test cases for 2nd reduce method
p multisum_reduce_2(3) == 3
p multisum_reduce_2(5) == 8
p multisum_reduce_2(10) == 33
p multisum_reduce_2(1000) == 234168
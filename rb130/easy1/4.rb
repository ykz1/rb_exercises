def divisors(num)
  (1..Math.sqrt(num)).each_with_object([]) do |divisor, output|
    if num % divisor == 0
      output << divisor
      output << num / divisor unless divisor == num / divisor
    end
  end.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
p divisors(999962000357)
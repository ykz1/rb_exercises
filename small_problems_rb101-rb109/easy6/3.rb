def find_fibonacci_index_by_length(int)
  fib = [1, 1]
  counter = 2

  until fib[1].to_s.size >= int
    fib[0], fib[1] = fib[1], fib.sum
    counter += 1
    # Line below was to make sure we weren't stuck in an infinite loop
    # p fib[1].to_s.size
  end
  counter
end

p find_fibonacci_index_by_length(2) #== 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) #== 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) #== 45
p find_fibonacci_index_by_length(100) #== 476
p find_fibonacci_index_by_length(1000) #== 4782
p find_fibonacci_index_by_length(10000) #== 47847
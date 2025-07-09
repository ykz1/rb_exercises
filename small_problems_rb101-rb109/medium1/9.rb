def fibonacci(n)
  return 1 if n <= 2
  acc1 = 1
  acc2 = 1
  i = 2

  loop do
    i += 1
    sum = acc1 + acc2
    return sum if i == n
    acc1 = acc2
    acc2 = sum
  end

end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501


# Refactor below:

def fibonacci2(n)
  return 1 if n <= 2
  n2, n1 = [1, 1]
  (n - 2).times do
    n2, n1 = [n1, n2 + n1]
  end
  n1
end

p fibonacci2(1)
p fibonacci2(2)
p fibonacci2(3)
p fibonacci2(4)
p fibonacci2(5)
p fibonacci2(6)
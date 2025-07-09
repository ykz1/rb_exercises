=begin
3:03pm start



Input: integer
Output: integer
Requirements:
- Given n, calculate the nth number in the Fibonacci sequence
- Write a recursive method

Assumptions:
- Input will always be a positive integer (no validation required)


=end

def fibonacci(n)
  return 1 if n == 1 || n == 2
  fibonacci(n - 2) + fibonacci(n - 1)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
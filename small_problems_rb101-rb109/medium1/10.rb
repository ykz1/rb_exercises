# Initial solution:
def fibonacci(n)
  return 1 if n <= 2
  n2, n1 = [1, 1]
  (n - 2).times do
    n2, n1 = [n1, n2 + n1]
  end
  n1
end

def fibonacci_last(n)
  fibonacci(n).digits[0]
end


# Refactored solution:
def fibonacci_last2(n)
  return 1 if n <= 2
  n2, n1 = [1, 1]
  3.upto(n) do
    n2, n1 = [last_digit(n1), last_digit(n2) + last_digit(n1)]
  end
  last_digit(n1)
end

def last_digit(n)
  n.to_s[-1].to_i
end

# 2nd refactor + Further exploration solution:
def fibonacci_last3(n)
  return 1 if n <= 2
  
  n2, n1 = [1, 1]
  counter = 3
  saved = {}
  start_index = 0
  loop_size = 0

  loop do
    # Calculate the last digit of the next Fibonacci number and return that digit if it is the right Fibonacci index
    n0 = (n2 + n1) % 10
    return n0 if counter == n

    # Store last digit given preceding two last digits
    saved[[n2, n1]] = n0
    
    # Iterate to next sequence of numbers and break out of loop if [n2, n1] is already a stored sequence
    n2, n1 = [n1, n0]
    if saved.key?([n2, n1])
      start_index = saved.keys.index([n2, n1]) + 3
      loop_size = counter - start_index + 1
      break
    end

    
    counter += 1
  end
  
  index = (n - start_index) % loop_size
  saved[saved.keys[index]]
end

p fibonacci_last3(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last3(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last3(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last3(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last3(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last3(123456789) # -> 4
p fibonacci_last3(123_456_789_987_745) # -> 5

# Further exploration notes below:

=begin

Requirement: 
- Find a way to calculate last digit of a Fibonacci number given n for any n

Solution:
- Any Fibonacci number (n0) can be calculated given the two preceding Fibonacci numbers (n1, and n2)
- When we only look at final digits, n1 and n2 are both single digit numbers
- Given the two points above, there are a maximum of 10^2 permutations of n1 and n2 which lets us calculate n0
- Therefore, before or by the 100th Fibonacci number, the sequence of n2, n1, n0 will repeat, and so 100 is the most number of times that we would need to loop

Implementation:
- As we start iterating, for each loop we need to track:
  - What sequence we're at (counter)
  - The Fibonacci number's last digit (n0)
  - The previous 2 Fibonacci numbers which ([n2, n1])
- Our table (array) would look something like this:

Counter     Fib Number Last Digit     Previous 2
1           1           
2           1
3           2                         [1, 1]
4           3                         [1, 2]
5           5                         [2, 3]
6           8                         [3, 5]
...

What data structure should we use?
- Need to look up by "Previous 2" data with each iteration to check if we've reached a full loop (many)
- Need to look up by counter to return the last digit as the ultimate answer (once)
- Given this, it makes sense to use a Hash with the previous 2 numbers as the key
- We can return

We stop looping if:
1) Counter reaches the given Fibonacci number we're looking for (n); OR
2) We reach a full loop i.e. [n2, n1] is already a stored 

If condition 2 is met, then we need to
1) Find the counter at which our loop begins - this will be our start_index
2) Find the size of the loop: current counter minus our start_index
3) (n - start_index) % loop_size shoud get us the index we're looking for within our loop to find the right last digit
=end


def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

p square(5) == 25
p square(-8) == 64

# Further exploration below—implemented "power to the n" using our multiply method:
def power(base, exponent)
  num = 1
  exponent.times { num = multiply(num, base) }  # A more elegant solution would be num *= base
  num
end

# Test cases added below
p power(5, 5) == 5**5
p power(2, 3) == 2**3
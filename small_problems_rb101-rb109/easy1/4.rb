# Solution:
def calculate_bonus(salary, has_bonus)
  has_bonus ? salary / 2 : 0
end


# Test cases:
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
a = 7

def my_value(b)
  b += 10
end

my_value(a)
puts a

puts "a should remain 7. The += operator assigned a new memory space for variable b while leaving the original memory space that a points to as is, at 7"

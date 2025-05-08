a = 7

def my_value(b)
  b = a + a
end

my_value(a)
puts a

puts "This will raise an error on line 4 because variable a is out-of-scope in my_value's definition"
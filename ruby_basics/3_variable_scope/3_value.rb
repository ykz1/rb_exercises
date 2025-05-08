a = 7

def my_value(b)
  a = b
end

my_value(a + 5)
puts a

puts "Again, this will print 7"
puts "The variable a defined on line 4 is local to my_value's definition, and is not the same as the variable a outside of my_value's definition"

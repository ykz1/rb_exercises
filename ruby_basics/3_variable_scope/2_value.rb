a = 7

def my_value(a)
  a += 10
end

my_value(a)
puts a

puts "This will print 7 as well"
puts "Similar to previous question, the local variable a within the method my_value does not mutate the original object 7 that variable a outside of my_value points to"
puts "The local variable a defined in my_value is different than the a defined outside of my_method's definition"

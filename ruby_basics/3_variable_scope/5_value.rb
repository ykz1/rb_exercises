a = "Xyzzy"

def my_value(b)
  b = 'yzzyX'
end

my_value(a)
puts a

puts "a will remain 'Xyzzy'"
puts "When a is passed to my_value an argument, local variable b points to the same object as a"
puts "On line 4, variable b is assigned to a new string object with the = operator"
puts "As a result, a still points to the original object / memory space containing 'Xyzzy' while b now points to a new object / memory space containing 'yzzyX'"
puts "The key difference between this exercise and the previous one is that = does not mutate the calling object, while String[]= does"
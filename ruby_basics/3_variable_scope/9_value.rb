a = 7
array = [1, 2, 3]

array.each do |a|
  a += 1
end

puts a

puts "a will print as 7"
puts "when outer scope variable a is passed as an argument to .each's invocation on line 4..."
puts "...it is passed as a value because on line 5 we are calling the = operator which does not mutate the calling object"
puts "and so the variable a that references a new integer with each iteration on line 5 is a local variable within .each's invocation..."
puts "...and not the outerscope variable defined on line 1"

puts "this is called variable shadowing, where inner scope variable a (defined on .each's invocation) hides access to outer scope variable a (defined on line 1)"
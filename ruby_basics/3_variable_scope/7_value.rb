a = 7
array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a

puts "a will print as 3"
puts ".each's invocation does not create a self-contained scope, and so the variable a is accessible within .each's block"
puts "each time we iterate and reach line 5, we assign a new value to a, ending with the final assignment of value 3"

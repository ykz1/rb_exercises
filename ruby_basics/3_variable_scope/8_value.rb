array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a

puts "Line 7 will product an error"
puts "The variable a defined on line 4 exists in the inner scope of .each's invocation"
puts "Because of this, when we jump back into the outer scope, the variable a defined on line 4 is not visible"